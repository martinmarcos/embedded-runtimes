--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.TIMER is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype IR_MR0INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_MR1INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_MR2INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_MR3INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_CR0INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_CR1INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_CR2INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_CR3INT_Field is Interfaces.LPC4337.Bit;
   subtype IR_RESERVED_Field is Interfaces.LPC4337.UInt24;

   --  Interrupt Register. The IR can be written to clear interrupts. The IR
   --  can be read to identify which of eight possible interrupt sources are
   --  pending.
   type IR_Register is record
      --  Interrupt flag for match channel 0.
      MR0INT   : IR_MR0INT_Field := 16#0#;
      --  Interrupt flag for match channel 1.
      MR1INT   : IR_MR1INT_Field := 16#0#;
      --  Interrupt flag for match channel 2.
      MR2INT   : IR_MR2INT_Field := 16#0#;
      --  Interrupt flag for match channel 3.
      MR3INT   : IR_MR3INT_Field := 16#0#;
      --  Interrupt flag for capture channel 0 event.
      CR0INT   : IR_CR0INT_Field := 16#0#;
      --  Interrupt flag for capture channel 1 event.
      CR1INT   : IR_CR1INT_Field := 16#0#;
      --  Interrupt flag for capture channel 2 event.
      CR2INT   : IR_CR2INT_Field := 16#0#;
      --  Interrupt flag for capture channel 3 event.
      CR3INT   : IR_CR3INT_Field := 16#0#;
      --  Reserved.
      RESERVED : IR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR_Register use record
      MR0INT   at 0 range 0 .. 0;
      MR1INT   at 0 range 1 .. 1;
      MR2INT   at 0 range 2 .. 2;
      MR3INT   at 0 range 3 .. 3;
      CR0INT   at 0 range 4 .. 4;
      CR1INT   at 0 range 5 .. 5;
      CR2INT   at 0 range 6 .. 6;
      CR3INT   at 0 range 7 .. 7;
      RESERVED at 0 range 8 .. 31;
   end record;

   subtype TCR_CEN_Field is Interfaces.LPC4337.Bit;
   subtype TCR_CRST_Field is Interfaces.LPC4337.Bit;
   subtype TCR_RESERVED_Field is Interfaces.LPC4337.UInt30;

   --  Timer Control Register. The TCR is used to control the Timer Counter
   --  functions. The Timer Counter can be disabled or reset through the TCR.
   type TCR_Register is record
      --  When one, the Timer Counter and Prescale Counter are enabled for
      --  counting. When zero, the counters are disabled.
      CEN      : TCR_CEN_Field := 16#0#;
      --  When one, the Timer Counter and the Prescale Counter are
      --  synchronously reset on the next positive edge of PCLK. The counters
      --  remain reset until TCR[1] is returned to zero.
      CRST     : TCR_CRST_Field := 16#0#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : TCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      CEN      at 0 range 0 .. 0;
      CRST     at 0 range 1 .. 1;
      RESERVED at 0 range 2 .. 31;
   end record;

   --  Interrupt on MR0
   type MCR_ENUM is
     (
      --  Disabled. Interrupt is disabled
      Disabled,
      --  Enabled. Interrupt is generated when MR0 matches the value in the TC.
      Enabled)
     with Size => 1;
   for MCR_ENUM use
     (Disabled => 0,
      Enabled => 1);

   --  Reset on MR0
   type MCR_ENUM_1 is
     (
      --  Disabled. Feature disabled.
      Disabled,
      --  Reset. TC will be reset if MR0 matches it.
      Reset)
     with Size => 1;
   for MCR_ENUM_1 use
     (Disabled => 0,
      Reset => 1);

   --  Stop on MR0
   type MCR_ENUM_2 is
     (
      --  Disabled. Feature disabled.
      Disabled,
      --  Match. TC and PC will be stopped and TCR[0] will be set to 0 if MR0
      --  matches the TC.
      Match)
     with Size => 1;
   for MCR_ENUM_2 use
     (Disabled => 0,
      Match => 1);

   --  Stop on MR1
   type MCR_ENUM_3 is
     (
      --  Disabled. Feature disabled.
      Disabled,
      --  Stop. TC and PC will be stopped and TCR[0] will be set to 0 if MR1
      --  matches the TC.
      Stop)
     with Size => 1;
   for MCR_ENUM_3 use
     (Disabled => 0,
      Stop => 1);

   --  Interrupt on MR3
   type MCR_ENUM_4 is
     (
      --  Disabled. This interrupt is disabled.
      Disabled,
      --  Interrupt. Interrupt is generated when MR3 matches the value in the
      --  TC.
      Interrupt)
     with Size => 1;
   for MCR_ENUM_4 use
     (Disabled => 0,
      Interrupt => 1);

   subtype MCR_RESERVED_Field is Interfaces.LPC4337.UInt20;

   --  Match Control Register. The MCR is used to control if an interrupt is
   --  generated and if the TC is reset when a Match occurs.
   type MCR_Register is record
      --  Interrupt on MR0
      MR0I     : MCR_ENUM := Interfaces.LPC4337.TIMER.Disabled;
      --  Reset on MR0
      MR0R     : MCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Stop on MR0
      MR0S     : MCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on MR1
      MR1I     : MCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Reset on MR1
      MR1R     : MCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Stop on MR1
      MR1S     : MCR_ENUM_3 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on MR2
      MR2I     : MCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Reset on MR2
      MR2R     : MCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Stop on MR2.
      MR2S     : MCR_ENUM_3 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on MR3
      MR3I     : MCR_ENUM_4 := Interfaces.LPC4337.TIMER.Disabled;
      --  Reset on MR3
      MR3R     : MCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Stop on MR3
      MR3S     : MCR_ENUM_3 := Interfaces.LPC4337.TIMER.Disabled;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : MCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCR_Register use record
      MR0I     at 0 range 0 .. 0;
      MR0R     at 0 range 1 .. 1;
      MR0S     at 0 range 2 .. 2;
      MR1I     at 0 range 3 .. 3;
      MR1R     at 0 range 4 .. 4;
      MR1S     at 0 range 5 .. 5;
      MR2I     at 0 range 6 .. 6;
      MR2R     at 0 range 7 .. 7;
      MR2S     at 0 range 8 .. 8;
      MR3I     at 0 range 9 .. 9;
      MR3R     at 0 range 10 .. 10;
      MR3S     at 0 range 11 .. 11;
      RESERVED at 0 range 12 .. 31;
   end record;

   --  Match Register 0. MR0 can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR0 matches the TC.

   --  Match Register 0. MR0 can be enabled through the MCR to reset the TC,
   --  stop both the TC and PC, and/or generate an interrupt every time MR0
   --  matches the TC.
   type MR_Registers is array (0 .. 3) of Interfaces.LPC4337.UInt32
     with Volatile;

   --  Capture on CAPn.0 rising edge
   type CCR_ENUM is
     (
      --  Disabled. This feature is disabled.
      Disabled,
      --  Low to high. A sequence of 0 then 1 on CAPn.0 will cause CR0 to be
      --  loaded with the contents of TC.
      Low_To_High)
     with Size => 1;
   for CCR_ENUM use
     (Disabled => 0,
      Low_To_High => 1);

   --  Capture on CAPn.0 falling edge
   type CCR_ENUM_1 is
     (
      --  Disabled. This feature is disabled.
      Disabled,
      --  High to low. A sequence of 1 then 0 on CAPn.0 will cause CR0 to be
      --  loaded with the contents of TC.
      High_To_Low)
     with Size => 1;
   for CCR_ENUM_1 use
     (Disabled => 0,
      High_To_Low => 1);

   --  Interrupt on CAPn.0 event
   type CCR_ENUM_2 is
     (
      --  Disabled. This feature is disabled.
      Disabled,
      --  Load. A CR0 load due to a CAPn.0 event will generate an interrupt.
      Load)
     with Size => 1;
   for CCR_ENUM_2 use
     (Disabled => 0,
      Load => 1);

   subtype CCR_RESERVED_Field is Interfaces.LPC4337.UInt20;

   --  Capture Control Register. The CCR controls which edges of the capture
   --  inputs are used to load the Capture Registers and whether or not an
   --  interrupt is generated when a capture takes place.
   type CCR_Register is record
      --  Capture on CAPn.0 rising edge
      CAP0RE   : CCR_ENUM := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.0 falling edge
      CAP0FE   : CCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on CAPn.0 event
      CAP0I    : CCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.1 rising edge
      CAP1RE   : CCR_ENUM := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.1 falling edge
      CAP1FE   : CCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on CAPn.1 event
      CAP1I    : CCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.2 rising edge
      CAP2RE   : CCR_ENUM := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.2 falling edge:
      CAP2FE   : CCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on CAPn.2 event
      CAP2I    : CCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Capture on CAPn.3 rising edge
      CAP3RE   : CCR_ENUM := Interfaces.LPC4337.TIMER.Disabled;
      --  High to low. Capture on CAPn.3 falling edge
      CAP3FE   : CCR_ENUM_1 := Interfaces.LPC4337.TIMER.Disabled;
      --  Interrupt on CAPn.3 event:
      CAP3I    : CCR_ENUM_2 := Interfaces.LPC4337.TIMER.Disabled;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : CCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      CAP0RE   at 0 range 0 .. 0;
      CAP0FE   at 0 range 1 .. 1;
      CAP0I    at 0 range 2 .. 2;
      CAP1RE   at 0 range 3 .. 3;
      CAP1FE   at 0 range 4 .. 4;
      CAP1I    at 0 range 5 .. 5;
      CAP2RE   at 0 range 6 .. 6;
      CAP2FE   at 0 range 7 .. 7;
      CAP2I    at 0 range 8 .. 8;
      CAP3RE   at 0 range 9 .. 9;
      CAP3FE   at 0 range 10 .. 10;
      CAP3I    at 0 range 11 .. 11;
      RESERVED at 0 range 12 .. 31;
   end record;

   --  Capture Register 0. CR0 is loaded with the value of TC when there is an event on the CAPn.0 input.

   --  Capture Register 0. CR0 is loaded with the value of TC when there is an
   --  event on the CAPn.0 input.
   type CR_Registers is array (0 .. 3) of Interfaces.LPC4337.UInt32
     with Volatile;

   --  EMR_EM array element
   subtype EMR_EM_Element is Interfaces.LPC4337.Bit;

   --  EMR_EM array
   type EMR_EM_Field_Array is array (0 .. 3) of EMR_EM_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for EMR_EM
   type EMR_EM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : Interfaces.LPC4337.UInt4;
         when True =>
            --  EM as an array
            Arr : EMR_EM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EMR_EM_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  External Match Control 0. Determines the functionality of External Match
   --  0.
   type EMR_ENUM is
     (
      --  Do Nothing.
      Nop,
      --  Clear. Clear the corresponding External Match bit/output to 0 (MATn.m
      --  pin is LOW if pinned out).
      Clear,
      --  Set. Set the corresponding External Match bit/output to 1 (MATn.m pin
      --  is HIGH if pinned out).
      Set,
      --  Toggle. Toggle the corresponding External Match bit/output.
      Toggle)
     with Size => 2;
   for EMR_ENUM use
     (Nop => 0,
      Clear => 1,
      Set => 2,
      Toggle => 3);

   --  EMR_EMC array
   type EMR_EMC_Field_Array is array (0 .. 3) of EMR_ENUM
     with Component_Size => 2, Size => 8;

   --  Type definition for EMR_EMC
   type EMR_EMC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EMC as a value
            Val : Interfaces.LPC4337.Byte;
         when True =>
            --  EMC as an array
            Arr : EMR_EMC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for EMR_EMC_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype EMR_RESERVED_Field is Interfaces.LPC4337.UInt20;

   --  External Match Register. The EMR controls the external match pins
   --  MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
   type EMR_Register is record
      --  External Match 0. When a match occurs between the TC and MR0, this
      --  bit can either toggle, go low, go high, or do nothing, depending on
      --  bits 5:4 of this register. This bit can be driven onto a MATn.0 pin,
      --  in a positive-logic manner (0 = low, 1 = high).
      EM       : EMR_EM_Field := (As_Array => False, Val => 16#0#);
      --  External Match Control 0. Determines the functionality of External
      --  Match 0.
      EMC      : EMR_EMC_Field := (As_Array => False, Val => 16#0#);
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : EMR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EMR_Register use record
      EM       at 0 range 0 .. 3;
      EMC      at 0 range 4 .. 11;
      RESERVED at 0 range 12 .. 31;
   end record;

   --  Counter/Timer Mode This field selects which rising PCLK edges can
   --  increment Timer's Prescale Counter (PC), or clear PC and increment Timer
   --  Counter (TC). Timer Mode: the TC is incremented when the Prescale
   --  Counter matches the Prescale Register.
   type CTCR_ENUM is
     (
      --  Timer Mode. Counts every rising PCLK edge
      Timer_Mode,
      --  Counter Mode rising edge. TC is incremented on rising edges on the
      --  CAP input selected by bits 3:2.
      Counter_Mode_Rising,
      --  Counter Mode falling edge. TC is incremented on falling edges on the
      --  CAP input selected by bits 3:2.
      Counter_Mode_Falling,
      --  Counter Mode edges. TC is incremented on both edges on the CAP input
      --  selected by bits 3:2.
      Counter_Mode_Edges)
     with Size => 2;
   for CTCR_ENUM use
     (Timer_Mode => 0,
      Counter_Mode_Rising => 1,
      Counter_Mode_Falling => 2,
      Counter_Mode_Edges => 3);

   --  Count Input Select When bits 1:0 in this register are not 00, these bits
   --  select which CAP pin is sampled for clocking. Note: If Counter mode is
   --  selected for a particular CAPn input in the TnCTCR, the 3 bits for that
   --  input in the Capture Control Register (TnCCR) must be programmed as 000.
   --  However, capture and/or interrupt can be selected for the other 3 CAPn
   --  inputs in the same timer.
   type CTCR_ENUM_1 is
     (
      --  CAP0. CAPn.0 for TIMERn
      Cap0,
      --  CAP1. CAPn.1 for TIMERn
      Cap1,
      --  CAP2. CAPn.2 for TIMERn
      Cap2,
      --  CAP3. CAPn.3 for TIMERn
      Cap3)
     with Size => 2;
   for CTCR_ENUM_1 use
     (Cap0 => 0,
      Cap1 => 1,
      Cap2 => 2,
      Cap3 => 3);

   subtype CTCR_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  Count Control Register. The CTCR selects between Timer and Counter mode,
   --  and in Counter mode selects the signal and edge(s) for counting.
   type CTCR_Register is record
      --  Counter/Timer Mode This field selects which rising PCLK edges can
      --  increment Timer's Prescale Counter (PC), or clear PC and increment
      --  Timer Counter (TC). Timer Mode: the TC is incremented when the
      --  Prescale Counter matches the Prescale Register.
      CTMODE   : CTCR_ENUM := Interfaces.LPC4337.TIMER.Timer_Mode;
      --  Count Input Select When bits 1:0 in this register are not 00, these
      --  bits select which CAP pin is sampled for clocking. Note: If Counter
      --  mode is selected for a particular CAPn input in the TnCTCR, the 3
      --  bits for that input in the Capture Control Register (TnCCR) must be
      --  programmed as 000. However, capture and/or interrupt can be selected
      --  for the other 3 CAPn inputs in the same timer.
      CINSEL   : CTCR_ENUM_1 := Interfaces.LPC4337.TIMER.Cap0;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : CTCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTCR_Register use record
      CTMODE   at 0 range 0 .. 1;
      CINSEL   at 0 range 2 .. 3;
      RESERVED at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Timer0/1/2/3
   type TIMER_Peripheral is record
      --  Interrupt Register. The IR can be written to clear interrupts. The IR
      --  can be read to identify which of eight possible interrupt sources are
      --  pending.
      IR   : aliased IR_Register;
      --  Timer Control Register. The TCR is used to control the Timer Counter
      --  functions. The Timer Counter can be disabled or reset through the
      --  TCR.
      TCR  : aliased TCR_Register;
      --  Timer Counter. The 32 bit TC is incremented every PR+1 cycles of
      --  PCLK. The TC is controlled through the TCR.
      TC   : aliased Interfaces.LPC4337.UInt32;
      --  Prescale Register. When the Prescale Counter (PC) is equal to this
      --  value, the next clock increments the TC and clears the PC.
      PR   : aliased Interfaces.LPC4337.UInt32;
      --  Prescale Counter. The 32 bit PC is a counter which is incremented to
      --  the value stored in PR. When the value in PR is reached, the TC is
      --  incremented and the PC is cleared. The PC is observable and
      --  controllable through the bus interface.
      PC   : aliased Interfaces.LPC4337.UInt32;
      --  Match Control Register. The MCR is used to control if an interrupt is
      --  generated and if the TC is reset when a Match occurs.
      MCR  : aliased MCR_Register;
      --  Match Register 0. MR0 can be enabled through the MCR to reset the TC,
      --  stop both the TC and PC, and/or generate an interrupt every time MR0
      --  matches the TC.
      MR   : aliased MR_Registers;
      --  Capture Control Register. The CCR controls which edges of the capture
      --  inputs are used to load the Capture Registers and whether or not an
      --  interrupt is generated when a capture takes place.
      CCR  : aliased CCR_Register;
      --  Capture Register 0. CR0 is loaded with the value of TC when there is
      --  an event on the CAPn.0 input.
      CR   : aliased CR_Registers;
      --  External Match Register. The EMR controls the external match pins
      --  MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
      EMR  : aliased EMR_Register;
      --  Count Control Register. The CTCR selects between Timer and Counter
      --  mode, and in Counter mode selects the signal and edge(s) for
      --  counting.
      CTCR : aliased CTCR_Register;
   end record
     with Volatile;

   for TIMER_Peripheral use record
      IR   at 16#0# range 0 .. 31;
      TCR  at 16#4# range 0 .. 31;
      TC   at 16#8# range 0 .. 31;
      PR   at 16#C# range 0 .. 31;
      PC   at 16#10# range 0 .. 31;
      MCR  at 16#14# range 0 .. 31;
      MR   at 16#18# range 0 .. 127;
      CCR  at 16#28# range 0 .. 31;
      CR   at 16#2C# range 0 .. 127;
      EMR  at 16#3C# range 0 .. 31;
      CTCR at 16#70# range 0 .. 31;
   end record;

   --  Timer0/1/2/3
   TIMER0_Periph : aliased TIMER_Peripheral
     with Import, Address => System'To_Address (16#40084000#);

   --  Timer0/1/2/3
   TIMER1_Periph : aliased TIMER_Peripheral
     with Import, Address => System'To_Address (16#40085000#);

   --  Timer0/1/2/3
   TIMER2_Periph : aliased TIMER_Peripheral
     with Import, Address => System'To_Address (16#400C3000#);

   --  Timer0/1/2/3
   TIMER3_Periph : aliased TIMER_Peripheral
     with Import, Address => System'To_Address (16#400C4000#);

end Interfaces.LPC4337.TIMER;
