------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . B O A R D _ S U P P O R T             --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2016, AdaCore                     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- You should have received a copy of the GNU General Public License along  --
-- with this library; see the file COPYING3. If not, see:                   --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

with System.Machine_Code;

with System.BB.Parameters; use System.BB.Parameters;

package body System.BB.Board_Support is
   use CPU_Primitives, Interrupts, Machine_Code;

   Sys_Tick_Vector          : constant Vector_Id := 15;
   Interrupt_Request_Vector : constant Vector_Id := 16;
   --  See vector definitions in ARMv7-M version of System.BB.CPU_Primitives.
   --  Defined by ARMv7-M specifications.

   First_IRQ : constant Interrupt_ID := 2;
   --  This corresponds to the first IRQ number (handled by the NVIC). This
   --  offset is present so that the Sys_Tick exception can be handled like
   --  other interrupts, and because interrupt id 0 is reserved.

   Alarm_Time :  Timer_Interval;
   pragma Volatile (Alarm_Time);
   pragma Export (C, Alarm_Time, "__gnat_alarm_time");

   ---------------------------
   -- System control and ID --
   ---------------------------

   ICSR : Word with Volatile, Address => 16#E000_ED04#;
   --  Interrupt Control State (part of the System Control Block - SCB)

   ICSR_Pend_ST_Set : constant := 2**26; --  Set pending Sys_Tick (RW)
   ICSR_Pend_ST_Clr : constant := 2**25; --  Clear pending Sys_Tick (W)

   -----------------------
   -- Sys_Tick Handling --
   -----------------------

   --  We use the Sys_Tick timer as a periodic timer with 1 kHz rate. This
   --  is a trade-off between accurate delays, limited overhead and maximum
   --  time that interrupts may be disabled.

   Tick_Period   : constant Timer_Interval := Clock_Frequency / 1000;

   type Sys_Tick_Registers is record
      SYST_CSR   : Word;
      SYST_RVR   : Word;
      SYST_CVR   : Word;
      SYST_CALIB : Word;
   end record;

   CSR_Count_Flag : constant := 2**16;
   CSR_Clk_Source : constant := 2**2;
   CSR_Tick_Int   : constant := 2**1;
   CSR_Enable     : constant := 2**0;

   RVR_Last       : constant := 2**24 - 1;
   pragma Assert (Tick_Period <= RVR_Last + 1);

   SYST : Sys_Tick_Registers with Volatile, Address => 16#E000_E010#;
   --  SysTick control and status register (Part of SYST).

   Next_Tick_Time : Timer_Interval with Volatile;
   --  Time when systick will expire. This gives the high digits of the time

   ----------------------------------------------
   -- New Vectored Interrupt Controller (NVIC) --
   ----------------------------------------------

   NVIC_Base : constant := 16#E000_E000#;
   --  Nested Vectored Interrupt Controller (NVIC) base.

   NVIC_ISER0 : constant Address := NVIC_Base + 16#100#;
   --  Writing a bit mask to this register enables the corresponding interrupts

   type PRI is mod 2**8;
   --  Type for ARMv7-M interrupt priorities. Note that 0 is the highest
   --  priority, which is reserved for the kernel and has no corresponding
   --  Interrupt_Priority value, and 255 is the lowest. We assume the PRIGROUP
   --  setting is such that the 4 most significant bits determine the priority
   --  group used for preemption. However, if less bits are implemented, this
   --  should still work.

   function To_PRI (P : Integer) return PRI is
     (if P not in Interrupt_Priority then 0
      else PRI (Interrupt_Priority'Last - P + 1) * 16);
   --  Return the BASEPRI mask for the given Ada priority. Note that the zero
   --  value here means no mask, so no interrupts are masked.

   function To_Priority (P : PRI) return Interrupt_Priority is
     (if P = 0 then Interrupt_Priority'Last
      else (Interrupt_Priority'Last - Any_Priority'Base (P / 16) + 1));
   --  Given an ARM interrupt priority (PRI value), determine the Ada priority
   --  While the value 0 is reserved for the kernel and has no Ada priority
   --  that represents it, Interrupt_Priority'Last is closest.

   IP : array (Interrupt_ID) of PRI with Volatile, Address => 16#E000_E400#;

   --  Local utility functions

   procedure Enable_Interrupt_Request
     (Interrupt : Interrupt_ID;
      Prio      : Interrupt_Priority);
   --  Enable interrupt requests for the given interrupt

   ----------------------
   -- Initialize_Board --
   ----------------------

   procedure Initialize_Board is
   begin
      --  Mask interrupts
      Disable_Interrupts;

      --  Because we operate the SysTick clock as a periodic timer, and 24 bits
      --  at 168 MHz is sufficient for that, use the unscaled system clock.

      --  To initialize the Sys_Tick timer, first disable the clock, then
      --  program it and finally enable it. This way an accidentally
      --  misconfigured timer will not cause pending interrupt while
      --  reprogramming.

      SYST.SYST_CSR := CSR_Clk_Source; -- disable clock
      SYST.SYST_RVR := Word (Tick_Period - 1);
      SYST.SYST_CVR := 0;
      SYST.SYST_CSR := CSR_Clk_Source or CSR_Enable;

      Next_Tick_Time := Tick_Period;
      Set_Alarm (Timer_Interval'Last);
      Clear_Alarm_Interrupt;
      Enable_Interrupts (Priority'Last);
   end Initialize_Board;

   ------------------------
   -- Max_Timer_Interval --
   ------------------------

   function Max_Timer_Interval return Timer_Interval is (2**32 - 1);

   ----------------
   -- Read_Clock --
   ----------------

   function Read_Clock return Timer_Interval is
      PRIMASK : Word;
      Flag    : Boolean;
      Count   : Timer_Interval;
      Res     : Timer_Interval;

   begin
      --  As several registers and variables need to be read or modified, do
      --  it atomically.

      Asm ("mrs %0, PRIMASK",
           Outputs => Word'Asm_Output ("=&r", PRIMASK),
           Volatile => True);
      Asm ("msr PRIMASK, %0",
           Inputs  => Word'Asm_Input  ("r", 1),
           Volatile => True);

      --  We must read the counter register before the flag

      Count := Timer_Interval (SYST.SYST_CVR);

      --  If we read the flag first, a reload can occur just after the read and
      --  the count register would wrap around. We'd end up with a Count value
      --  close to the Tick_Period value but a flag at zero and therefore miss
      --  the reload and return a wrong clock value.

      --  This flag is set when the counter has reached zero. Next_Tick_Time
      --  has to be incremented. This will trigger an interrupt very soon (or
      --  has just triggered the interrupt), so count is either zero or not far
      --  from Tick_Period.

      Flag := (SYST.SYST_CSR and CSR_Count_Flag) /= 0;

      if Flag then

         --  Systick counter has just reached zero, pretend it is still zero

         --  This function is called by the interrupt handler that is executed
         --  when the counter reaches zero. Therefore, we signal that the next
         --  interrupt will happen within a period. Note that reading the
         --  Control and Status register (SYST_CSR) clears the COUNTFLAG bit,
         --  so even if we have sequential calls to this function, the
         --  increment of Next_Tick_Time will happen only once.

         Res := Next_Tick_Time;
         Next_Tick_Time := Next_Tick_Time + Tick_Period;

      else
         --  The counter is decremented, so compute the actual time

         Res := Next_Tick_Time - Count;
      end if;

      --  Restore interrupt mask

      Asm ("msr PRIMASK, %0",
           Inputs => Word'Asm_Input ("r", PRIMASK),
           Volatile => True);

      return Res;
   end Read_Clock;

   ---------------------------
   -- Clear_Alarm_Interrupt --
   ---------------------------

   procedure Clear_Alarm_Interrupt is
   begin
      ICSR := ICSR_Pend_ST_Clr;
   end Clear_Alarm_Interrupt;

   --------------------------
   -- Clear_Poke_Interrupt --
   --------------------------

   procedure Clear_Poke_Interrupt is
   begin
      null;
   end Clear_Poke_Interrupt;

   ---------------
   -- Set_Alarm --
   ---------------

   procedure Set_Alarm (Ticks : Timer_Interval) is
      Now : constant Timer_Interval := Read_Clock;

   begin
      --  As we will have periodic interrupts for alarms regardless, the only
      --  thing to do is force an interrupt if the alarm has already expired.

      Alarm_Time := Now + Timer_Interval'Min (Timer_Interval'Last / 2, Ticks);

      if Ticks = 0 then
         ICSR := ICSR_Pend_ST_Set;
      end if;
   end Set_Alarm;

   ------------------------
   -- Alarm_Interrupt_ID --
   ------------------------

   function Alarm_Interrupt_ID return Interrupt_ID is (1);
   --  Return the interrupt level to use for the alarm clock handler. Note that
   --  we use a "fake" Interrupt_ID for the alarm interrupt, as it is handled
   --  specially (not through the NVIC).

   -----------------------
   -- Poke_Interrupt_ID --
   -----------------------

   function Poke_Interrupt_ID return Interrupt_ID is (No_Interrupt);

   ---------------------------
   -- Get_Interrupt_Request --
   ---------------------------

   function Get_Interrupt_Request
     (Vector : Vector_Id) return Interrupt_ID
   is
      Res : Word;

   begin
      if Vector = Sys_Tick_Vector then
         return Alarm_Interrupt_ID;
      end if;

      Asm ("mrs %0, ipsr",
           Word'Asm_Output ("=r", Res),
           Volatile => True);

      Res := Res and 16#FF#;

      --  The exception number is read from the IPSR, convert it to IRQ
      --  number by substracting 16 (number of cpu exceptions) and then
      --  convert it to GNAT interrupt_id by adding First_IRQ.

      return Interrupt_ID'Base (Res) - 16 + First_IRQ;
   end Get_Interrupt_Request;

   ------------------------------
   -- Enable_Interrupt_Request --
   ------------------------------

   procedure Enable_Interrupt_Request
     (Interrupt : Interrupt_ID;
      Prio      : Interrupt_Priority)
   is
   begin
      if Interrupt = Alarm_Interrupt_ID then

         --  Consistency check with Priority_Of_Interrupt

         pragma Assert (Prio = Interrupt_Priority'Last);

         Clear_Alarm_Interrupt;
         SYST.SYST_CSR := SYST.SYST_CSR or CSR_Tick_Int;

      else
         declare
            pragma Assert (Interrupt >= First_IRQ);
            IRQ    : constant Natural := Interrupt - First_IRQ;
            Regofs : constant Natural := IRQ / 32;
            Regbit : constant Word := 2** (IRQ mod 32);
            NVIC_ISER : array (0 .. 15) of Word
                           with Volatile, Address => NVIC_ISER0;

            --  Many NVIC registers use 16 words of 32 bits each to serve as a
            --  bitmap for all interrupt channels. Regofs indicates register
            --  offset (0 .. 15), and Regbit indicates the mask required for
            --  addressing the bit.

         begin
            NVIC_ISER (Regofs) := Regbit;
         end;
      end if;
   end Enable_Interrupt_Request;

   -------------------------------
   -- Install_Interrupt_Handler --
   -------------------------------

   procedure Install_Interrupt_Handler
     (Handler   : Address;
      Interrupt : Interrupts.Interrupt_ID;
      Prio      : Interrupt_Priority)
   is
   begin
      if Interrupt = Alarm_Interrupt_ID then
         Install_Trap_Handler (Handler, Sys_Tick_Vector);

      else
         IP (Interrupt - First_IRQ) := To_PRI (Prio);
         Install_Trap_Handler (Handler, Interrupt_Request_Vector);
      end if;

      Enable_Interrupt_Request (Interrupt, Prio);
   end Install_Interrupt_Handler;

   ---------------------------
   -- Priority_Of_Interrupt --
   ---------------------------

   function Priority_Of_Interrupt
     (Interrupt : Interrupt_ID) return Any_Priority
   is
      --  Interrupt 2 .. 83 correspond to IRQ0 .. IRQ81

      (if Interrupt = Alarm_Interrupt_ID then Interrupt_Priority'Last
       else To_Priority (IP (Interrupt - First_IRQ)));

   ----------------
   -- Power_Down --
   ----------------

   procedure Power_Down is
   begin
      Asm ("wfi", Volatile => True);
   end Power_Down;

   -----------------------------
   -- Clear_Interrupt_Request --
   -----------------------------

   procedure Clear_Interrupt_Request (Interrupt : Interrupts.Interrupt_ID)
      is null;

   --------------------------
   -- Set_Current_Priority --
   --------------------------

   procedure Set_Current_Priority (Priority : Integer) is
   begin
      --  Writing a 0 to BASEPRI disables interrupt masking, while values
      --  15 .. 1 correspond to interrupt priorities 255 .. 241 in that order.

      Asm ("msr BASEPRI, %0",
           Inputs => PRI'Asm_Input ("r", To_PRI (Priority)),
           Volatile => True);
   end Set_Current_Priority;
end System.BB.Board_Support;
