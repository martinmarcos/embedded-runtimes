--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.SCT is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  SCT operation
   type CONFIG_ENUM is
     (
      --  16-bit.The SCT operates as two 16-bit counters named L and H.
      CONFIG_ENUM_16_Bit,
      --  32-bit. The SCT operates as a unified 32-bit counter.
      CONFIG_ENUM_32_Bit)
     with Size => 1;
   for CONFIG_ENUM use
     (CONFIG_ENUM_16_Bit => 0,
      CONFIG_ENUM_32_Bit => 1);

   --  SCT clock mode
   type CONFIG_ENUM_1 is
     (
      --  Bus clock. The bus clock clocks the SCT and prescalers.
      Bus_Clock,
      --  Prescaled bus clock. The SCT clock is the bus clock, but the
      --  prescalers are enabled to count only when sampling of the input
      --  selected by the CKSEL field finds the selected edge. The minimum
      --  pulse width on the clock input is 1 bus clock period. This mode is
      --  the high-performance sampled-clock mode.
      Prescaled_Bus_Clock,
      --  SCT Input. The input selected by CKSEL clocks the SCT and prescalers.
      --  The input is synchronized to the bus clock and possibly inverted. The
      --  minimum pulse width on the clock input is 1 bus clock period. This
      --  mode is the low-power sampled-clock mode.
      Sct_Input,
      --  Reserved.
      Reserved)
     with Size => 2;
   for CONFIG_ENUM_1 use
     (Bus_Clock => 0,
      Prescaled_Bus_Clock => 1,
      Sct_Input => 2,
      Reserved => 3);

   --  SCT clock select
   type CONFIG_ENUM_2 is
     (
      --  Rising edges on input 0.
      Rising_Edges_On_Inpu,
      --  Falling edges on input 0.
      Falling_Edges_On_Inp,
      --  Rising edges on input 1.
      Rising_Edges_On_Inpu_1,
      --  Falling edges on input 1.
      Falling_Edges_On_Inp_1,
      --  Rising edges on input 2.
      Rising_Edges_On_Inpu_2,
      --  Falling edges on input 2.
      Falling_Edges_On_Inp_2,
      --  Rising edges on input 3.
      Rising_Edges_On_Inpu_3,
      --  Falling edges on input 3.
      Falling_Edges_On_Inp_3,
      --  Rising edges on input 4.
      Rising_Edges_On_Inpu_4,
      --  Falling edges on input 4.
      Falling_Edges_On_Inp_4,
      --  Rising edges on input 5.
      Rising_Edges_On_Inpu_5,
      --  Falling edges on input 5.
      Falling_Edges_On_Inp_5,
      --  Rising edges on input 6.
      Rising_Edges_On_Inpu_6,
      --  Falling edges on input 6.
      Falling_Edges_On_Inp_6,
      --  Rising edges on input 7.
      Rising_Edges_On_Inpu_7,
      --  Falling edges on input 7.
      Falling_Edges_On_Inp_7)
     with Size => 4;
   for CONFIG_ENUM_2 use
     (Rising_Edges_On_Inpu => 0,
      Falling_Edges_On_Inp => 1,
      Rising_Edges_On_Inpu_1 => 2,
      Falling_Edges_On_Inp_1 => 3,
      Rising_Edges_On_Inpu_2 => 4,
      Falling_Edges_On_Inp_2 => 5,
      Rising_Edges_On_Inpu_3 => 6,
      Falling_Edges_On_Inp_3 => 7,
      Rising_Edges_On_Inpu_4 => 8,
      Falling_Edges_On_Inp_4 => 9,
      Rising_Edges_On_Inpu_5 => 10,
      Falling_Edges_On_Inp_5 => 11,
      Rising_Edges_On_Inpu_6 => 12,
      Falling_Edges_On_Inp_6 => 13,
      Rising_Edges_On_Inpu_7 => 14,
      Falling_Edges_On_Inp_7 => 15);

   subtype CONFIG_NORELAOD_L_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_NORELOAD_H_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_INSYNC_Field is Interfaces.LPC4337.Byte;
   subtype CONFIG_AUTOLIMIT_L_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_AUTOLIMIT_H_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_RESERVED_Field is Interfaces.LPC4337.UInt13;

   --  SCT configuration register
   type CONFIG_Register is record
      --  SCT operation
      UNIFY       : CONFIG_ENUM := Interfaces.LPC4337.SCT.CONFIG_ENUM_16_Bit;
      --  SCT clock mode
      CLKMODE     : CONFIG_ENUM_1 := Interfaces.LPC4337.SCT.Bus_Clock;
      --  SCT clock select
      CKSEL       : CONFIG_ENUM_2 :=
                     Interfaces.LPC4337.SCT.Rising_Edges_On_Inpu;
      --  A 1 in this bit prevents the lower match and fractional match
      --  registers from being reloaded from their respective reload registers.
      --  Software can write to set or clear this bit at any time. This bit
      --  applies to both the higher and lower registers when the UNIFY bit is
      --  set.
      NORELAOD_L  : CONFIG_NORELAOD_L_Field := 16#0#;
      --  A 1 in this bit prevents the higher match and fractional match
      --  registers from being reloaded from their respective reload registers.
      --  Software can write to set or clear this bit at any time. This bit is
      --  not used when the UNIFY bit is set.
      NORELOAD_H  : CONFIG_NORELOAD_H_Field := 16#0#;
      --  Synchronization for input n (bit 9 = input 0, bit 10 = input 1,...,
      --  bit 16 = input 7). A 1 in one of these bits subjects the
      --  corresponding input to synchronization to the SCT clock, before it is
      --  used to create an event. If an input is synchronous to the SCT clock,
      --  keep its bit 0 for faster response. When the CKMODE field is 1x, the
      --  bit in this field, corresponding to the input selected by the CKSEL
      --  field, is not used.
      INSYNC      : CONFIG_INSYNC_Field := 16#3F#;
      --  A one in this bit causes a match on match register 0 to be treated as
      --  a de-facto LIMIT condition without the need to define an associated
      --  event. As with any LIMIT event, this automatic limit causes the
      --  counter to be cleared to zero in uni-directional mode or to change
      --  the direction of count in bi-directional mode. Software can write to
      --  set or clear this bit at any time. This bit applies to both the
      --  higher and lower registers when the UNIFY bit is set.
      AUTOLIMIT_L : CONFIG_AUTOLIMIT_L_Field := 16#0#;
      --  A one in this bit will cause a match on match register 0 to be
      --  treated as a de-facto LIMIT condition without the need to define an
      --  associated event. As with any LIMIT event, this automatic limit
      --  causes the counter to be cleared to zero in uni-directional mode or
      --  to change the direction of count in bi-directional mode. Software can
      --  write to set or clear this bit at any time. This bit is not used when
      --  the UNIFY bit is set.
      AUTOLIMIT_H : CONFIG_AUTOLIMIT_H_Field := 16#0#;
      --  Reserved
      RESERVED    : CONFIG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      UNIFY       at 0 range 0 .. 0;
      CLKMODE     at 0 range 1 .. 2;
      CKSEL       at 0 range 3 .. 6;
      NORELAOD_L  at 0 range 7 .. 7;
      NORELOAD_H  at 0 range 8 .. 8;
      INSYNC      at 0 range 9 .. 16;
      AUTOLIMIT_L at 0 range 17 .. 17;
      AUTOLIMIT_H at 0 range 18 .. 18;
      RESERVED    at 0 range 19 .. 31;
   end record;

   subtype CTRL_DOWN_L_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_STOP_L_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_HALT_L_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_CLRCTR_L_Field is Interfaces.LPC4337.Bit;

   --  L or unified counter direction select
   type CTRL_ENUM is
     (
      --  Up. The counter counts up to its limit condition, then is cleared to
      --  zero.
      Up,
      --  Up-down. The counter counts up to its limit, then counts down to a
      --  limit condition or to 0.
      Updown)
     with Size => 1;
   for CTRL_ENUM use
     (Up => 0,
      Updown => 1);

   subtype CTRL_PRE_L_Field is Interfaces.LPC4337.Byte;
   subtype CTRL_RESERVED_Field is Interfaces.LPC4337.UInt3;
   subtype CTRL_DOWN_H_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_STOP_H_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_HALT_H_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_CLRCTR_H_Field is Interfaces.LPC4337.Bit;
   subtype CTRL_PRE_H_Field is Interfaces.LPC4337.Byte;

   --  SCT control register
   type CTRL_Register is record
      --  This bit is 1 when the L or unified counter is counting down.
      --  Hardware sets this bit when the counter limit is reached and BIDIR is
      --  1. Hardware clears this bit when the counter reaches 0 or when the
      --  counter is counting down and a limit condition occurs.
      DOWN_L     : CTRL_DOWN_L_Field := 16#0#;
      --  When this bit is 1 and HALT is 0, the L or unified counter does not
      --  run but I/O events related to the counter can occur. If such an event
      --  matches the mask in the Start register, this bit is cleared and
      --  counting resumes.
      STOP_L     : CTRL_STOP_L_Field := 16#0#;
      --  When this bit is 1, the L or unified counter does not run and no
      --  events can occur. A reset sets this bit. When the HALT_L bit is one,
      --  the STOP_L bit is cleared. If you want to remove the halt condition
      --  and keep the SCT in the stop condition (not running), then you can
      --  change the halt and stop condition with one single write to this
      --  register. Once set, only software can clear this bit to restore
      --  counter operation.
      HALT_L     : CTRL_HALT_L_Field := 16#1#;
      --  Writing a 1 to this bit clears the L or unified counter. This bit
      --  always reads as 0.
      CLRCTR_L   : CTRL_CLRCTR_L_Field := 16#0#;
      --  L or unified counter direction select
      BIDIR_L    : CTRL_ENUM := Interfaces.LPC4337.SCT.Up;
      --  Specifies the factor by which the SCT clock is prescaled to produce
      --  the L or unified counter clock. The counter clock is clocked at the
      --  rate of the SCT clock divided by PRE_L+1. Clear the counter (by
      --  writing a 1 to the CLRCTR bit) whenever changing the PRE value.
      PRE_L      : CTRL_PRE_L_Field := 16#0#;
      --  Reserved
      RESERVED   : CTRL_RESERVED_Field := 16#0#;
      --  This bit is 1 when the H counter is counting down. Hardware sets this
      --  bit when the counter limit is reached and BIDIR is 1. Hardware clears
      --  this bit when the counter reaches 0 or when the counter is counting
      --  down and a limit condition occurs.
      DOWN_H     : CTRL_DOWN_H_Field := 16#0#;
      --  When this bit is 1 and HALT is 0, the H counter does not run but I/O
      --  events related to the counter can occur. If such an event matches the
      --  mask in the Start register, this bit is cleared and counting resumes.
      STOP_H     : CTRL_STOP_H_Field := 16#0#;
      --  When this bit is 1, the H counter does not run and no events can
      --  occur. A reset sets this bit. When the HALT_H bit is one, the STOP_H
      --  bit is cleared. If you want to remove the halt condition and keep the
      --  SCT in the stop condition (not running), then you can change the halt
      --  and stop condition with one single write to this register. Once set,
      --  this bit can only be cleared by software to restore counter
      --  operation.
      HALT_H     : CTRL_HALT_H_Field := 16#1#;
      --  Writing a 1 to this bit clears the H counter. This bit always reads
      --  as 0.
      CLRCTR_H   : CTRL_CLRCTR_H_Field := 16#0#;
      --  Direction select
      BIDIR_H    : CTRL_ENUM := Interfaces.LPC4337.SCT.Up;
      --  Specifies the factor by which the SCT clock is prescaled to produce
      --  the H counter clock. The counter clock is clocked at the rate of the
      --  SCT clock divided by PRELH+1. Clear the counter (by writing a 1 to
      --  the CLRCTR bit) whenever changing the PRE value.
      PRE_H      : CTRL_PRE_H_Field := 16#0#;
      --  Reserved
      RESERVED_1 : CTRL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      DOWN_L     at 0 range 0 .. 0;
      STOP_L     at 0 range 1 .. 1;
      HALT_L     at 0 range 2 .. 2;
      CLRCTR_L   at 0 range 3 .. 3;
      BIDIR_L    at 0 range 4 .. 4;
      PRE_L      at 0 range 5 .. 12;
      RESERVED   at 0 range 13 .. 15;
      DOWN_H     at 0 range 16 .. 16;
      STOP_H     at 0 range 17 .. 17;
      HALT_H     at 0 range 18 .. 18;
      CLRCTR_H   at 0 range 19 .. 19;
      BIDIR_H    at 0 range 20 .. 20;
      PRE_H      at 0 range 21 .. 28;
      RESERVED_1 at 0 range 29 .. 31;
   end record;

   subtype LIMIT_LIMMSK_L_Field is Interfaces.LPC4337.UInt16;
   subtype LIMIT_LIMMSK_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT limit register
   type LIMIT_Register is record
      --  If bit n is one, event n is used as a counter limit event for the L
      --  or unified counter (event 0 = bit 0, event 1 = bit 1, event 15 = bit
      --  15).
      LIMMSK_L : LIMIT_LIMMSK_L_Field := 16#0#;
      --  If bit n is one, event n is used as a counter limit event for the H
      --  counter (event 0 = bit 16, event 1 = bit 17, event 15 = bit 31).
      LIMMSK_H : LIMIT_LIMMSK_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LIMIT_Register use record
      LIMMSK_L at 0 range 0 .. 15;
      LIMMSK_H at 0 range 16 .. 31;
   end record;

   subtype HALT_HALTMSK_L_Field is Interfaces.LPC4337.UInt16;
   subtype HALT_HALTMSK_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT halt condition register
   type HALT_Register is record
      --  If bit n is one, event n sets the HALT_L bit in the CTRL register
      --  (event 0 = bit 0, event 1 = bit 1, event 15 = bit 15).
      HALTMSK_L : HALT_HALTMSK_L_Field := 16#0#;
      --  If bit n is one, event n sets the HALT_H bit in the CTRL register
      --  (event 0 = bit 16, event 1 = bit 17, event 15 = bit 31).
      HALTMSK_H : HALT_HALTMSK_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for HALT_Register use record
      HALTMSK_L at 0 range 0 .. 15;
      HALTMSK_H at 0 range 16 .. 31;
   end record;

   subtype STOP_STOPMSK_L_Field is Interfaces.LPC4337.UInt16;
   subtype STOP_STOPMSK_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT stop condition register
   type STOP_Register is record
      --  If bit n is one, event n sets the STOP_L bit in the CTRL register
      --  (event 0 = bit 0, event 1 = bit 1, event 15 = bit 15).
      STOPMSK_L : STOP_STOPMSK_L_Field := 16#0#;
      --  If bit n is one, event n sets the STOP_H bit in the CTRL register
      --  (event 0 = bit 16, event 1 = bit 17, event 15 = bit 31).
      STOPMSK_H : STOP_STOPMSK_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STOP_Register use record
      STOPMSK_L at 0 range 0 .. 15;
      STOPMSK_H at 0 range 16 .. 31;
   end record;

   subtype START_STARTMSK_L_Field is Interfaces.LPC4337.UInt16;
   subtype START_STARTMSK_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT start condition register
   type START_Register is record
      --  If bit n is one, event n clears the STOP_L bit in the CTRL register
      --  (event 0 = bit 0, event 1 = bit 1, event 15 = bit 15).
      STARTMSK_L : START_STARTMSK_L_Field := 16#0#;
      --  If bit n is one, event n clears the STOP_H bit in the CTRL register
      --  (event 0 = bit 16, event 1 = bit 17, event 15 = bit 31).
      STARTMSK_H : START_STARTMSK_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for START_Register use record
      STARTMSK_L at 0 range 0 .. 15;
      STARTMSK_H at 0 range 16 .. 31;
   end record;

   subtype DITHER_DITHMSK_L_Field is Interfaces.LPC4337.UInt16;
   subtype DITHER_DITHMSK_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT dither condition register
   type DITHER_Register is record
      --  If bit n is one, the event n causes the dither engine to advance to
      --  the next element in the dither pattern at the start of the next
      --  counter cycle of the 16-bit low counter or the unified counter (event
      --  0 = bit 0, event 1 = bit 1, event 15 = bit 15). If all bits are set
      --  to 0, the dither pattern automatically advances at the start of every
      --  new counter cycle.
      DITHMSK_L : DITHER_DITHMSK_L_Field := 16#0#;
      --  If bit n is one, the event n causes the dither engine to advance to
      --  the next element in the dither pattern at the start of the next
      --  counter cycle of the 16-bit high counter (event 0 = bit 0, event 1 =
      --  bit 1, event 15 = bit 15). If all bits are set to 0, the dither
      --  pattern automatically advances at the start of every new counter
      --  cycle.
      DITHMSK_H : DITHER_DITHMSK_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DITHER_Register use record
      DITHMSK_L at 0 range 0 .. 15;
      DITHMSK_H at 0 range 16 .. 31;
   end record;

   subtype COUNT_CTR_L_Field is Interfaces.LPC4337.UInt16;
   subtype COUNT_CTR_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT counter register
   type COUNT_Register is record
      --  When UNIFY = 0, read or write the 16-bit L counter value. When UNIFY
      --  = 1, read or write the lower 16 bits of the 32-bit unified counter.
      CTR_L : COUNT_CTR_L_Field := 16#0#;
      --  When UNIFY = 0, read or write the 16-bit H counter value. When UNIFY
      --  = 1, read or write the upper 16 bits of the 32-bit unified counter.
      CTR_H : COUNT_CTR_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COUNT_Register use record
      CTR_L at 0 range 0 .. 15;
      CTR_H at 0 range 16 .. 31;
   end record;

   subtype STATE_STATE_L_Field is Interfaces.LPC4337.UInt5;
   subtype STATE_RESERVED_Field is Interfaces.LPC4337.UInt11;
   subtype STATE_STATE_H_Field is Interfaces.LPC4337.UInt5;

   --  SCT state register
   type STATE_Register is record
      --  State variable.
      STATE_L    : STATE_STATE_L_Field := 16#0#;
      --  Reserved.
      RESERVED   : STATE_RESERVED_Field := 16#0#;
      --  State variable.
      STATE_H    : STATE_STATE_H_Field := 16#0#;
      --  Reserved.
      RESERVED_1 : STATE_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATE_Register use record
      STATE_L    at 0 range 0 .. 4;
      RESERVED   at 0 range 5 .. 15;
      STATE_H    at 0 range 16 .. 20;
      RESERVED_1 at 0 range 21 .. 31;
   end record;

   --  INPUT_AIN array element
   subtype INPUT_AIN_Element is Interfaces.LPC4337.Bit;

   --  INPUT_AIN array
   type INPUT_AIN_Field_Array is array (0 .. 7) of INPUT_AIN_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for INPUT_AIN
   type INPUT_AIN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AIN as a value
            Val : Interfaces.LPC4337.Byte;
         when True =>
            --  AIN as an array
            Arr : INPUT_AIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INPUT_AIN_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype INPUT_RESERVED_Field is Interfaces.LPC4337.Byte;
   --  INPUT_SIN array element
   subtype INPUT_SIN_Element is Interfaces.LPC4337.Bit;

   --  INPUT_SIN array
   type INPUT_SIN_Field_Array is array (0 .. 7) of INPUT_SIN_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for INPUT_SIN
   type INPUT_SIN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SIN as a value
            Val : Interfaces.LPC4337.Byte;
         when True =>
            --  SIN as an array
            Arr : INPUT_SIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for INPUT_SIN_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  SCT input register
   type INPUT_Register is record
      --  Read-only. Real-time status of input 0.
      AIN        : INPUT_AIN_Field;
      --  Read-only. Reserved.
      RESERVED   : INPUT_RESERVED_Field;
      --  Read-only. Input 0 state synchronized to the SCT clock.
      SIN        : INPUT_SIN_Field;
      --  Read-only. Reserved
      RESERVED_1 : INPUT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INPUT_Register use record
      AIN        at 0 range 0 .. 7;
      RESERVED   at 0 range 8 .. 15;
      SIN        at 0 range 16 .. 23;
      RESERVED_1 at 0 range 24 .. 31;
   end record;

   subtype REGMODE_REGMOD_L_Field is Interfaces.LPC4337.UInt16;
   subtype REGMODE_REGMOD_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT match/capture registers mode register
   type REGMODE_Register is record
      --  Each bit controls one pair of match/capture registers (register 0 =
      --  bit 0, register 1 = bit 1,..., register 15 = bit 15). 0 = registers
      --  operate as match registers. 1 = registers operate as capture
      --  registers.
      REGMOD_L : REGMODE_REGMOD_L_Field := 16#0#;
      --  Each bit controls one pair of match/capture registers (register 0 =
      --  bit 16, register 1 = bit 17,..., register 15 = bit 31). 0 = registers
      --  operate as match registers. 1 = registers operate as capture
      --  registers.
      REGMOD_H : REGMODE_REGMOD_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for REGMODE_Register use record
      REGMOD_L at 0 range 0 .. 15;
      REGMOD_H at 0 range 16 .. 31;
   end record;

   subtype OUTPUT_OUT_Field is Interfaces.LPC4337.UInt16;
   subtype OUTPUT_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT output register
   type OUTPUT_Register is record
      --  Writing a 1 to bit n makes the corresponding output HIGH. 0 makes the
      --  corresponding output LOW (output 0 = bit 0, output 1 = bit 1,...,
      --  output 15 = bit 15).
      OUT_k    : OUTPUT_OUT_Field := 16#0#;
      --  Reserved
      RESERVED : OUTPUT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUTPUT_Register use record
      OUT_k    at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  Set/clear operation on output 0. Value 0x3 is reserved. Do not program
   --  this value.
   type OUTPUTDIRCTRL_ENUM is
     (
      --  Independent. Set and clear do not depend on any counter.
      Independent,
      --  L counter. Set and clear are reversed when counter L or the unified
      --  counter is counting down.
      L_Counter,
      --  H counter. Set and clear are reversed when counter H is counting
      --  down. Do not use if UNIFY = 1.
      H_Counter)
     with Size => 2;
   for OUTPUTDIRCTRL_ENUM use
     (Independent => 0,
      L_Counter => 1,
      H_Counter => 2);

   --  OUTPUTDIRCTRL_SETCLR array
   type OUTPUTDIRCTRL_SETCLR_Field_Array is array (0 .. 15)
     of OUTPUTDIRCTRL_ENUM
     with Component_Size => 2, Size => 32;

   --  SCT output counter direction control register
   type OUTPUTDIRCTRL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SETCLR as a value
            Val : Interfaces.LPC4337.UInt32;
         when True =>
            --  SETCLR as an array
            Arr : OUTPUTDIRCTRL_SETCLR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for OUTPUTDIRCTRL_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  Effect of simultaneous set and clear on output 0.
   type RES_ENUM is
     (
      --  No change.
      No_Change,
      --  Set output (or clear based on the SETCLR0 field).
      Set_Output_Or_Clear,
      --  Clear output (or set based on the SETCLR0 field).
      Clear_Output_Or_Set,
      --  Toggle output.
      Toggle_Output)
     with Size => 2;
   for RES_ENUM use
     (No_Change => 0,
      Set_Output_Or_Clear => 1,
      Clear_Output_Or_Set => 2,
      Toggle_Output => 3);

   --  Effect of simultaneous set and clear on output 2.
   type RES_ENUM_1 is
     (
      --  No change.
      No_Change,
      --  Set output (or clear based on the SETCLR2 field).
      Set_Output_Or_Clear,
      --  Clear output n (or set based on the SETCLR2 field).
      Clear_Output_N_Or_S,
      --  Toggle output.
      Toggle_Output)
     with Size => 2;
   for RES_ENUM_1 use
     (No_Change => 0,
      Set_Output_Or_Clear => 1,
      Clear_Output_N_Or_S => 2,
      Toggle_Output => 3);

   --  SCT conflict resolution register
   type RES_Register is record
      --  Effect of simultaneous set and clear on output 0.
      O0RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 1.
      O1RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 2.
      O2RES  : RES_ENUM_1 := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 3.
      O3RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 4.
      O4RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 5.
      O5RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 6.
      O6RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 7.
      O7RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 8.
      O8RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 9.
      O9RES  : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 10.
      O10RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 11.
      O11RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 12.
      O12RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 13.
      O13RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 14.
      O14RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
      --  Effect of simultaneous set and clear on output 15.
      O15RES : RES_ENUM := Interfaces.LPC4337.SCT.No_Change;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RES_Register use record
      O0RES  at 0 range 0 .. 1;
      O1RES  at 0 range 2 .. 3;
      O2RES  at 0 range 4 .. 5;
      O3RES  at 0 range 6 .. 7;
      O4RES  at 0 range 8 .. 9;
      O5RES  at 0 range 10 .. 11;
      O6RES  at 0 range 12 .. 13;
      O7RES  at 0 range 14 .. 15;
      O8RES  at 0 range 16 .. 17;
      O9RES  at 0 range 18 .. 19;
      O10RES at 0 range 20 .. 21;
      O11RES at 0 range 22 .. 23;
      O12RES at 0 range 24 .. 25;
      O13RES at 0 range 26 .. 27;
      O14RES at 0 range 28 .. 29;
      O15RES at 0 range 30 .. 31;
   end record;

   subtype DMAREQ0_DEV_00_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_01_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_02_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_03_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_04_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_05_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_06_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_07_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_08_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_09_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_010_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_011_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_012_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_013_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_014_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DEV_015_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_RESERVED_Field is Interfaces.LPC4337.UInt14;
   subtype DMAREQ0_DRL0_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ0_DRQ0_Field is Interfaces.LPC4337.Bit;

   --  SCT DMA request 0 register
   type DMAREQ0_Register is record
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_00   : DMAREQ0_DEV_00_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_01   : DMAREQ0_DEV_01_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_02   : DMAREQ0_DEV_02_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_03   : DMAREQ0_DEV_03_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_04   : DMAREQ0_DEV_04_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_05   : DMAREQ0_DEV_05_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_06   : DMAREQ0_DEV_06_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_07   : DMAREQ0_DEV_07_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_08   : DMAREQ0_DEV_08_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_09   : DMAREQ0_DEV_09_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_010  : DMAREQ0_DEV_010_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_011  : DMAREQ0_DEV_011_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_012  : DMAREQ0_DEV_012_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_013  : DMAREQ0_DEV_013_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_014  : DMAREQ0_DEV_014_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 0 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_015  : DMAREQ0_DEV_015_Field := 16#0#;
      --  Reserved
      RESERVED : DMAREQ0_RESERVED_Field := 16#0#;
      --  A 1 in this bit makes the SCT set DMA request 0 when it loads the
      --  Match_L/Unified registers from the Reload_L/Unified registers.
      DRL0     : DMAREQ0_DRL0_Field := 16#0#;
      --  This read-only bit indicates the state of DMA Request 0
      DRQ0     : DMAREQ0_DRQ0_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAREQ0_Register use record
      DEV_00   at 0 range 0 .. 0;
      DEV_01   at 0 range 1 .. 1;
      DEV_02   at 0 range 2 .. 2;
      DEV_03   at 0 range 3 .. 3;
      DEV_04   at 0 range 4 .. 4;
      DEV_05   at 0 range 5 .. 5;
      DEV_06   at 0 range 6 .. 6;
      DEV_07   at 0 range 7 .. 7;
      DEV_08   at 0 range 8 .. 8;
      DEV_09   at 0 range 9 .. 9;
      DEV_010  at 0 range 10 .. 10;
      DEV_011  at 0 range 11 .. 11;
      DEV_012  at 0 range 12 .. 12;
      DEV_013  at 0 range 13 .. 13;
      DEV_014  at 0 range 14 .. 14;
      DEV_015  at 0 range 15 .. 15;
      RESERVED at 0 range 16 .. 29;
      DRL0     at 0 range 30 .. 30;
      DRQ0     at 0 range 31 .. 31;
   end record;

   subtype DMAREQ1_DEV_10_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_11_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_12_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_13_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_14_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_15_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_16_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_17_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_18_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_19_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_110_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_111_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_112_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_113_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_114_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DEV_115_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_RESERVED_Field is Interfaces.LPC4337.UInt14;
   subtype DMAREQ1_DRL1_Field is Interfaces.LPC4337.Bit;
   subtype DMAREQ1_DRQ1_Field is Interfaces.LPC4337.Bit;

   --  SCT DMA request 1 register
   type DMAREQ1_Register is record
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_10   : DMAREQ1_DEV_10_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_11   : DMAREQ1_DEV_11_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_12   : DMAREQ1_DEV_12_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_13   : DMAREQ1_DEV_13_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_14   : DMAREQ1_DEV_14_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_15   : DMAREQ1_DEV_15_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_16   : DMAREQ1_DEV_16_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_17   : DMAREQ1_DEV_17_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_18   : DMAREQ1_DEV_18_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_19   : DMAREQ1_DEV_19_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_110  : DMAREQ1_DEV_110_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_111  : DMAREQ1_DEV_111_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_112  : DMAREQ1_DEV_112_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_113  : DMAREQ1_DEV_113_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_114  : DMAREQ1_DEV_114_Field := 16#0#;
      --  If bit n is one, event n sets DMA request 1 (event 0 = bit 0, event 1
      --  = bit 1,..., event 15 = bit 15).
      DEV_115  : DMAREQ1_DEV_115_Field := 16#0#;
      --  Reserved
      RESERVED : DMAREQ1_RESERVED_Field := 16#0#;
      --  A 1 in this bit makes the SCT set DMA request 1 when it loads the
      --  Match L/Unified registers from the Reload L/Unified registers.
      DRL1     : DMAREQ1_DRL1_Field := 16#0#;
      --  This read-only bit indicates the state of DMA Request 1.
      DRQ1     : DMAREQ1_DRQ1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAREQ1_Register use record
      DEV_10   at 0 range 0 .. 0;
      DEV_11   at 0 range 1 .. 1;
      DEV_12   at 0 range 2 .. 2;
      DEV_13   at 0 range 3 .. 3;
      DEV_14   at 0 range 4 .. 4;
      DEV_15   at 0 range 5 .. 5;
      DEV_16   at 0 range 6 .. 6;
      DEV_17   at 0 range 7 .. 7;
      DEV_18   at 0 range 8 .. 8;
      DEV_19   at 0 range 9 .. 9;
      DEV_110  at 0 range 10 .. 10;
      DEV_111  at 0 range 11 .. 11;
      DEV_112  at 0 range 12 .. 12;
      DEV_113  at 0 range 13 .. 13;
      DEV_114  at 0 range 14 .. 14;
      DEV_115  at 0 range 15 .. 15;
      RESERVED at 0 range 16 .. 29;
      DRL1     at 0 range 30 .. 30;
      DRQ1     at 0 range 31 .. 31;
   end record;

   --  EVEN_IEN array element
   subtype EVEN_IEN_Element is Interfaces.LPC4337.Bit;

   --  EVEN_IEN array
   type EVEN_IEN_Field_Array is array (0 .. 15) of EVEN_IEN_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for EVEN_IEN
   type EVEN_IEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IEN as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  IEN as an array
            Arr : EVEN_IEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EVEN_IEN_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype EVEN_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT event enable register
   type EVEN_Register is record
      --  The SCT requests interrupt when bit n of this register and the event
      --  flag register are both one (event 0 = bit 0, event 1 = bit 1,...,
      --  event 15 = bit 15).
      IEN      : EVEN_IEN_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : EVEN_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVEN_Register use record
      IEN      at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  EVFLAG_FLAG array element
   subtype EVFLAG_FLAG_Element is Interfaces.LPC4337.Bit;

   --  EVFLAG_FLAG array
   type EVFLAG_FLAG_Field_Array is array (0 .. 15) of EVFLAG_FLAG_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for EVFLAG_FLAG
   type EVFLAG_FLAG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FLAG as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  FLAG as an array
            Arr : EVFLAG_FLAG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EVFLAG_FLAG_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype EVFLAG_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT event flag register
   type EVFLAG_Register is record
      --  Bit n is one if event n has occurred since reset or a 1 was last
      --  written to this bit (event 0 = bit 0, event 1 = bit 1,..., event 15 =
      --  bit 15).
      FLAG     : EVFLAG_FLAG_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : EVFLAG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVFLAG_Register use record
      FLAG     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  CONEN_NCEN array element
   subtype CONEN_NCEN_Element is Interfaces.LPC4337.Bit;

   --  CONEN_NCEN array
   type CONEN_NCEN_Field_Array is array (0 .. 15) of CONEN_NCEN_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for CONEN_NCEN
   type CONEN_NCEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  NCEN as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  NCEN as an array
            Arr : CONEN_NCEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CONEN_NCEN_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype CONEN_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT conflict enable register
   type CONEN_Register is record
      --  The SCT requests interrupt when bit n of this register and the SCT
      --  conflict flag register are both one (output 0 = bit 0, output 1 = bit
      --  1,..., output 15 = bit 15).
      NCEN     : CONEN_NCEN_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : CONEN_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONEN_Register use record
      NCEN     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  CONFLAG_NCFLAG array element
   subtype CONFLAG_NCFLAG_Element is Interfaces.LPC4337.Bit;

   --  CONFLAG_NCFLAG array
   type CONFLAG_NCFLAG_Field_Array is array (0 .. 15)
     of CONFLAG_NCFLAG_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for CONFLAG_NCFLAG
   type CONFLAG_NCFLAG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  NCFLAG as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  NCFLAG as an array
            Arr : CONFLAG_NCFLAG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CONFLAG_NCFLAG_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype CONFLAG_RESERVED_Field is Interfaces.LPC4337.UInt14;
   subtype CONFLAG_BUSERRL_Field is Interfaces.LPC4337.Bit;
   subtype CONFLAG_BUSERRH_Field is Interfaces.LPC4337.Bit;

   --  SCT conflict flag register
   type CONFLAG_Register is record
      --  Bit n is one if a no-change conflict event occurred on output n since
      --  reset or a 1 was last written to this bit (output 0 = bit 0, output 1
      --  = bit 1,..., output 15 = bit 15).
      NCFLAG   : CONFLAG_NCFLAG_Field := (As_Array => False, Val => 16#0#);
      --  Reserved.
      RESERVED : CONFLAG_RESERVED_Field := 16#0#;
      --  The most recent bus error from this SCT involved writing CTR
      --  L/Unified, STATE L/Unified, MATCH L/Unified, or the Output register
      --  when the L/U counter was not halted. A word write to certain L and H
      --  registers can be half successful and half unsuccessful.
      BUSERRL  : CONFLAG_BUSERRL_Field := 16#0#;
      --  The most recent bus error from this SCT involved writing CTR H, STATE
      --  H, MATCH H, or the Output register when the H counter was not halted.
      BUSERRH  : CONFLAG_BUSERRH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFLAG_Register use record
      NCFLAG   at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 29;
      BUSERRL  at 0 range 30 .. 30;
      BUSERRH  at 0 range 31 .. 31;
   end record;

   subtype MATCH_MATCH_L_Field is Interfaces.LPC4337.UInt16;
   subtype MATCH_MATCH_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT match value register of match channels 0 to 15; REGMOD0 to REGMODE15
   --  = 0
   type MATCH_Register is record
      --  When UNIFY = 0, read or write the 16-bit value to be compared to the
      --  L counter. When UNIFY = 1, read or write the lower 16 bits of the
      --  32-bit value to be compared to the unified counter.
      MATCH_L : MATCH_MATCH_L_Field := 16#0#;
      --  When UNIFY = 0, read or write the 16-bit value to be compared to the
      --  H counter. When UNIFY = 1, read or write the upper 16 bits of the
      --  32-bit value to be compared to the unified counter.
      MATCH_H : MATCH_MATCH_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MATCH_Register use record
      MATCH_L at 0 range 0 .. 15;
      MATCH_H at 0 range 16 .. 31;
   end record;

   --  SCT match value register of match channels 0 to 15; REGMOD0 to REGMODE15
   --  = 0
   type MATCH_Registers is array (0 .. 15) of MATCH_Register
     with Volatile;

   subtype CAP_CAP_L_Field is Interfaces.LPC4337.UInt16;
   subtype CAP_CAP_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT capture register of capture channel 0 to 15; REGMOD0 to REGMODE15 =
   --  1
   type CAP_Register is record
      --  When UNIFY = 0, read the 16-bit counter value at which this register
      --  was last captured. When UNIFY = 1, read the lower 16 bits of the
      --  32-bit value at which this register was last captured.
      CAP_L : CAP_CAP_L_Field := 16#0#;
      --  When UNIFY = 0, read the 16-bit counter value at which this register
      --  was last captured. When UNIFY = 1, read the upper 16 bits of the
      --  32-bit value at which this register was last captured.
      CAP_H : CAP_CAP_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CAP_Register use record
      CAP_L at 0 range 0 .. 15;
      CAP_H at 0 range 16 .. 31;
   end record;

   --  SCT capture register of capture channel 0 to 15; REGMOD0 to REGMODE15 =
   --  1
   type CAP_Registers is array (0 .. 15) of CAP_Register
     with Volatile;

   subtype FRACMAT_FRACMAT_L_Field is Interfaces.LPC4337.UInt4;
   subtype FRACMAT_RESERVED_Field is Interfaces.LPC4337.UInt12;
   subtype FRACMAT_FRACMAT_H_Field is Interfaces.LPC4337.UInt4;

   --  Fractional match registers 0 to 5 for SCT match value registers 0 to 5.
   type FRACMAT_Register is record
      --  When UNIFY = 0, read or write the 4-bit value specifying the dither
      --  pattern to be applied to the corresponding MATCHn_L register (n = 0
      --  to 5). When UNIFY = 1, the value applies to the unified, 32-bit
      --  fractional match register.
      FRACMAT_L  : FRACMAT_FRACMAT_L_Field := 16#0#;
      --  Reserved.
      RESERVED   : FRACMAT_RESERVED_Field := 16#0#;
      --  When UNIFY = 0, read or write 4-bit value specifying the dither
      --  pattern to be applied to the corresponding MATCHn_H register (n = 0
      --  to 5).
      FRACMAT_H  : FRACMAT_FRACMAT_H_Field := 16#0#;
      --  Reserved.
      RESERVED_1 : FRACMAT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FRACMAT_Register use record
      FRACMAT_L  at 0 range 0 .. 3;
      RESERVED   at 0 range 4 .. 15;
      FRACMAT_H  at 0 range 16 .. 19;
      RESERVED_1 at 0 range 20 .. 31;
   end record;

   --  Fractional match registers 0 to 5 for SCT match value registers 0 to 5.
   type FRACMAT_Registers is array (0 .. 5) of FRACMAT_Register
     with Volatile;

   subtype MATCHREL_RELOAD_L_Field is Interfaces.LPC4337.UInt16;
   subtype MATCHREL_RELOAD_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT match reload value register 0 to 15; REGMOD0 = 0 to REGMODE15 = 0
   type MATCHREL_Register is record
      --  When UNIFY = 0, read or write the 16-bit value to be loaded into the
      --  MATCHn_L register. When UNIFY = 1, read or write the lower 16 bits of
      --  the 32-bit value to be loaded into the MATCHn register.
      RELOAD_L : MATCHREL_RELOAD_L_Field := 16#0#;
      --  When UNIFY = 0, read or write the 16-bit to be loaded into the
      --  MATCHn_H register. When UNIFY = 1, read or write the upper 16 bits of
      --  the 32-bit value to be loaded into the MATCHn register.
      RELOAD_H : MATCHREL_RELOAD_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MATCHREL_Register use record
      RELOAD_L at 0 range 0 .. 15;
      RELOAD_H at 0 range 16 .. 31;
   end record;

   --  SCT match reload value register 0 to 15; REGMOD0 = 0 to REGMODE15 = 0
   type MATCHREL_Registers is array (0 .. 15) of MATCHREL_Register
     with Volatile;

   subtype CAPCTRL_CAPCON_L_Field is Interfaces.LPC4337.UInt16;
   subtype CAPCTRL_CAPCON_H_Field is Interfaces.LPC4337.UInt16;

   --  SCT capture control register 0 to 15; REGMOD0 = 1 to REGMODE15 = 1
   type CAPCTRL_Register is record
      --  If bit m is one, event m causes the CAPn_L (UNIFY = 0) or the CAPn
      --  (UNIFY = 1) register to be loaded (event 0 = bit 0, event 1 = bit
      --  1,..., event 15 = bit 15).
      CAPCON_L : CAPCTRL_CAPCON_L_Field := 16#0#;
      --  If bit m is one, event m causes the CAPn_H (UNIFY = 0) register to be
      --  loaded (event 0 = bit 16, event 1 = bit 17,..., event 15 = bit 31).
      CAPCON_H : CAPCTRL_CAPCON_H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CAPCTRL_Register use record
      CAPCON_L at 0 range 0 .. 15;
      CAPCON_H at 0 range 16 .. 31;
   end record;

   --  SCT capture control register 0 to 15; REGMOD0 = 1 to REGMODE15 = 1
   type CAPCTRL_Registers is array (0 .. 15) of CAPCTRL_Register
     with Volatile;

   subtype FRACMATREL_RELFRAC_L_Field is Interfaces.LPC4337.UInt4;
   subtype FRACMATREL_RESERVED_Field is Interfaces.LPC4337.UInt12;
   subtype FRACMATREL_RELFRAC_H_Field is Interfaces.LPC4337.UInt4;

   --  Fractional match reload registers 0 to 5 for SCT match value registers 0
   --  to 5.
   type FRACMATREL_Register is record
      --  When UNIFY = 0, read or write the 4-bit value to be loaded into the
      --  FRACMATn_L register. When UNIFY = 1, read or write the lower 4 bits
      --  to be loaded into the FRACMATn register.
      RELFRAC_L  : FRACMATREL_RELFRAC_L_Field := 16#0#;
      --  Reserved.
      RESERVED   : FRACMATREL_RESERVED_Field := 16#0#;
      --  When UNIFY = 0, read or write the 4-bit value to be loaded into the
      --  FRACMATn_H register. When UNIFY = 1, read or write the upper 4 bits
      --  with the 4-bit value to be loaded into the FRACMATn register.
      RELFRAC_H  : FRACMATREL_RELFRAC_H_Field := 16#0#;
      --  Reserved.
      RESERVED_1 : FRACMATREL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FRACMATREL_Register use record
      RELFRAC_L  at 0 range 0 .. 3;
      RESERVED   at 0 range 4 .. 15;
      RELFRAC_H  at 0 range 16 .. 19;
      RESERVED_1 at 0 range 20 .. 31;
   end record;

   --  Fractional match reload registers 0 to 5 for SCT match value registers 0
   --  to 5.
   type FRACMATREL_Registers is array (0 .. 5) of FRACMATREL_Register
     with Volatile;

   --  EV_STATE_STATEMSK array element
   subtype EV_STATE_STATEMSK_Element is Interfaces.LPC4337.Bit;

   --  EV_STATE_STATEMSK array
   type EV_STATE_STATEMSK_Field_Array is array (0 .. 31)
     of EV_STATE_STATEMSK_Element
     with Component_Size => 1, Size => 32;

   --  SCT event state register 0
   type EV_STATE_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STATEMSK as a value
            Val : Interfaces.LPC4337.UInt32;
         when True =>
            --  STATEMSK as an array
            Arr : EV_STATE_STATEMSK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for EV_STATE_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype EV_CTRL_MATCHSEL_Field is Interfaces.LPC4337.UInt4;

   --  Select L/H counter. Do not set this bit if UNIFY = 1.
   type EV_CTRL0_ENUM is
     (
      --  L state. Selects the L state and the L match register selected by
      --  MATCHSEL.
      L_State,
      --  H state. Selects the H state and the H match register selected by
      --  MATCHSEL.
      H_State)
     with Size => 1;
   for EV_CTRL0_ENUM use
     (L_State => 0,
      H_State => 1);

   --  Input/output select
   type EV_CTRL0_ENUM_1 is
     (
      --  Input. Selects the input selected by IOSEL.
      Input,
      --  Output. Selects the output selected by IOSEL.
      Output)
     with Size => 1;
   for EV_CTRL0_ENUM_1 use
     (Input => 0,
      Output => 1);

   subtype EV_CTRL_IOSEL_Field is Interfaces.LPC4337.UInt4;

   --  Selects the I/O condition for event n. (The detection of edges on
   --  outputs lags the conditions that switch the outputs by one SCT clock).
   --  In order to guarantee proper edge/state detection, an input must have a
   --  minimum pulse width of at least one SCT clock period .
   type EV_CTRL0_ENUM_2 is
     (
      --  LOW
      Low,
      --  Rise
      Rise,
      --  Fall
      Fall,
      --  HIGH
      High)
     with Size => 2;
   for EV_CTRL0_ENUM_2 use
     (Low => 0,
      Rise => 1,
      Fall => 2,
      High => 3);

   --  Selects how the specified match and I/O condition are used and combined.
   type EV_CTRL0_ENUM_3 is
     (
      --  OR. The event occurs when either the specified match or I/O condition
      --  occurs.
      Or_k,
      --  MATCH. Uses the specified match only.
      Match,
      --  IO. Uses the specified I/O condition only.
      Io,
      --  AND. The event occurs when the specified match and I/O condition
      --  occur simultaneously.
      And_k)
     with Size => 2;
   for EV_CTRL0_ENUM_3 use
     (Or_k => 0,
      Match => 1,
      Io => 2,
      And_k => 3);

   --  This bit controls how the STATEV value modifies the state selected by
   --  HEVENT when this event is the highest-numbered event occurring for that
   --  state.
   type EV_CTRL0_ENUM_4 is
     (
      --  STATEV value is added into STATE (the carry-out is ignored).
      Statev_Value_Is_Adde,
      --  STATEV value is loaded into STATE.
      Statev_Value_Is_Load)
     with Size => 1;
   for EV_CTRL0_ENUM_4 use
     (Statev_Value_Is_Adde => 0,
      Statev_Value_Is_Load => 1);

   subtype EV_CTRL_STATEV_Field is Interfaces.LPC4337.UInt5;
   subtype EV_CTRL_MATCHMEM_Field is Interfaces.LPC4337.Bit;

   --  Direction qualifier for event generation. This field only applies when
   --  the counters are operating in BIDIR mode. If BIDIR = 0, the SCT ignores
   --  this field. Value 0x3 is reserved.
   type EV_CTRL0_ENUM_5 is
     (
      --  Direction independent. This event is triggered regardless of the
      --  count direction.
      Direction_Independen,
      --  Counting up. This event is triggered only during up-counting when
      --  BIDIR = 1.
      Counting_Up,
      --  Counting down. This event is triggered only during down-counting when
      --  BIDIR = 1.
      Counting_Down)
     with Size => 2;
   for EV_CTRL0_ENUM_5 use
     (Direction_Independen => 0,
      Counting_Up => 1,
      Counting_Down => 2);

   subtype EV_CTRL_RESERVED_Field is Interfaces.LPC4337.UInt9;

   --  SCT event control register 0
   type EV_CTRL_Register is record
      --  Selects the Match register associated with this event (if any). A
      --  match can occur only when the counter selected by the HEVENT bit is
      --  running.
      MATCHSEL  : EV_CTRL_MATCHSEL_Field := 16#0#;
      --  Select L/H counter. Do not set this bit if UNIFY = 1.
      HEVENT    : EV_CTRL0_ENUM := Interfaces.LPC4337.SCT.L_State;
      --  Input/output select
      OUTSEL    : EV_CTRL0_ENUM_1 := Interfaces.LPC4337.SCT.Input;
      --  Selects the input or output signal associated with this event (if
      --  any). Do not select an input in this register, if CKMODE is 1x. In
      --  this case the clock input is an implicit ingredient of every event.
      IOSEL     : EV_CTRL_IOSEL_Field := 16#0#;
      --  Selects the I/O condition for event n. (The detection of edges on
      --  outputs lags the conditions that switch the outputs by one SCT
      --  clock). In order to guarantee proper edge/state detection, an input
      --  must have a minimum pulse width of at least one SCT clock period .
      IOCOND    : EV_CTRL0_ENUM_2 := Interfaces.LPC4337.SCT.Low;
      --  Selects how the specified match and I/O condition are used and
      --  combined.
      COMBMODE  : EV_CTRL0_ENUM_3 := Interfaces.LPC4337.SCT.Or_k;
      --  This bit controls how the STATEV value modifies the state selected by
      --  HEVENT when this event is the highest-numbered event occurring for
      --  that state.
      STATELD   : EV_CTRL0_ENUM_4 :=
                   Interfaces.LPC4337.SCT.Statev_Value_Is_Adde;
      --  This value is loaded into or added to the state selected by HEVENT,
      --  depending on STATELD, when this event is the highest-numbered event
      --  occurring for that state. If STATELD and STATEV are both zero, there
      --  is no change to the STATE value.
      STATEV    : EV_CTRL_STATEV_Field := 16#0#;
      --  If this bit is one and the COMBMODE field specifies a match component
      --  to the triggering of this event, then a match is considered to be
      --  active whenever the counter value is GREATER THAN OR EQUAL TO the
      --  value specified in the match register when counting up, LESS THEN OR
      --  EQUAL TO the match value when counting down. If this bit is zero, a
      --  match is only be active during the cycle when the counter is equal to
      --  the match value.
      MATCHMEM  : EV_CTRL_MATCHMEM_Field := 16#0#;
      --  Direction qualifier for event generation. This field only applies
      --  when the counters are operating in BIDIR mode. If BIDIR = 0, the SCT
      --  ignores this field. Value 0x3 is reserved.
      DIRECTION : EV_CTRL0_ENUM_5 :=
                   Interfaces.LPC4337.SCT.Direction_Independen;
      --  Reserved
      RESERVED  : EV_CTRL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EV_CTRL_Register use record
      MATCHSEL  at 0 range 0 .. 3;
      HEVENT    at 0 range 4 .. 4;
      OUTSEL    at 0 range 5 .. 5;
      IOSEL     at 0 range 6 .. 9;
      IOCOND    at 0 range 10 .. 11;
      COMBMODE  at 0 range 12 .. 13;
      STATELD   at 0 range 14 .. 14;
      STATEV    at 0 range 15 .. 19;
      MATCHMEM  at 0 range 20 .. 20;
      DIRECTION at 0 range 21 .. 22;
      RESERVED  at 0 range 23 .. 31;
   end record;

   --  OUT_SET_SET array element
   subtype OUT_SET_SET_Element is Interfaces.LPC4337.Bit;

   --  OUT_SET_SET array
   type OUT_SET_SET_Field_Array is array (0 .. 15) of OUT_SET_SET_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for OUT_SET_SET
   type OUT_SET_SET_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SET as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  SET as an array
            Arr : OUT_SET_SET_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for OUT_SET_SET_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype OUT_SET_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT output 0 set register
   type OUT_SET_Register is record
      --  A 1 in bit m selects event m to set output n (or clear it if SETCLRn
      --  = 0x1 or 0x2) event 0 = bit 0, event 1 = bit 1,..., event 15 = bit
      --  15.
      SET      : OUT_SET_SET_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : OUT_SET_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUT_SET_Register use record
      SET      at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  OUT_CLR_CLR array element
   subtype OUT_CLR_CLR_Element is Interfaces.LPC4337.Bit;

   --  OUT_CLR_CLR array
   type OUT_CLR_CLR_Field_Array is array (0 .. 15) of OUT_CLR_CLR_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for OUT_CLR_CLR
   type OUT_CLR_CLR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLR as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  CLR as an array
            Arr : OUT_CLR_CLR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for OUT_CLR_CLR_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype OUT_CLR_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  SCT output 0 clear register
   type OUT_CLR_Register is record
      --  A 1 in bit m selects event m to clear output n (or set it if SETCLRn
      --  = 0x1 or 0x2) event 0 = bit 0, event 1 = bit 1,..., event 15 = bit
      --  15.
      CLR      : OUT_CLR_CLR_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : OUT_CLR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUT_CLR_Register use record
      CLR      at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SCT_Disc is
     (
      Mode_1,
      Mode_2);

   --  State Configurable Timer (SCT) with dither engine
   type SCT_Peripheral
     (Discriminent : SCT_Disc := Mode_1)
   is record
      --  SCT configuration register
      CONFIG        : aliased CONFIG_Register;
      --  SCT control register
      CTRL          : aliased CTRL_Register;
      --  SCT limit register
      LIMIT         : aliased LIMIT_Register;
      --  SCT halt condition register
      HALT          : aliased HALT_Register;
      --  SCT stop condition register
      STOP          : aliased STOP_Register;
      --  SCT start condition register
      START         : aliased START_Register;
      --  SCT dither condition register
      DITHER        : aliased DITHER_Register;
      --  SCT counter register
      COUNT         : aliased COUNT_Register;
      --  SCT state register
      STATE         : aliased STATE_Register;
      --  SCT input register
      INPUT         : aliased INPUT_Register;
      --  SCT match/capture registers mode register
      REGMODE       : aliased REGMODE_Register;
      --  SCT output register
      OUTPUT        : aliased OUTPUT_Register;
      --  SCT output counter direction control register
      OUTPUTDIRCTRL : aliased OUTPUTDIRCTRL_Register;
      --  SCT conflict resolution register
      RES           : aliased RES_Register;
      --  SCT DMA request 0 register
      DMAREQ0       : aliased DMAREQ0_Register;
      --  SCT DMA request 1 register
      DMAREQ1       : aliased DMAREQ1_Register;
      --  SCT event enable register
      EVEN          : aliased EVEN_Register;
      --  SCT event flag register
      EVFLAG        : aliased EVFLAG_Register;
      --  SCT conflict enable register
      CONEN         : aliased CONEN_Register;
      --  SCT conflict flag register
      CONFLAG       : aliased CONFLAG_Register;
      --  Fractional match registers 0 to 5 for SCT match value registers 0 to
      --  5.
      FRACMAT       : aliased FRACMAT_Registers;
      --  Fractional match reload registers 0 to 5 for SCT match value
      --  registers 0 to 5.
      FRACMATREL    : aliased FRACMATREL_Registers;
      --  SCT event state register 0
      EV_STATE0     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL0      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE1     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL1      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE2     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL2      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE3     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL3      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE4     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL4      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE5     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL5      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE6     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL6      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE7     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL7      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE8     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL8      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE9     : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL9      : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE10    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL10     : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE11    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL11     : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE12    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL12     : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE13    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL13     : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE14    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL14     : aliased EV_CTRL_Register;
      --  SCT event state register 0
      EV_STATE15    : aliased EV_STATE_Register;
      --  SCT event control register 0
      EV_CTRL15     : aliased EV_CTRL_Register;
      --  SCT output 0 set register
      OUT_SET0      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR0      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET1      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR1      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET2      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR2      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET3      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR3      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET4      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR4      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET5      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR5      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET6      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR6      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET7      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR7      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET8      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR8      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET9      : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR9      : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET10     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR10     : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET11     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR11     : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET12     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR12     : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET13     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR13     : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET14     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR14     : aliased OUT_CLR_Register;
      --  SCT output 0 set register
      OUT_SET15     : aliased OUT_SET_Register;
      --  SCT output 0 clear register
      OUT_CLR15     : aliased OUT_CLR_Register;
      case Discriminent is
         when Mode_1 =>
            --  SCT match value register of match channels 0 to 15; REGMOD0 to
            --  REGMODE15 = 0
            MATCH : aliased MATCH_Registers;
            --  SCT match reload value register 0 to 15; REGMOD0 = 0 to
            --  REGMODE15 = 0
            MATCHREL : aliased MATCHREL_Registers;
         when Mode_2 =>
            --  SCT capture register of capture channel 0 to 15; REGMOD0 to
            --  REGMODE15 = 1
            CAP : aliased CAP_Registers;
            --  SCT capture control register 0 to 15; REGMOD0 = 1 to REGMODE15
            --  = 1
            CAPCTRL : aliased CAPCTRL_Registers;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for SCT_Peripheral use record
      CONFIG        at 16#0# range 0 .. 31;
      CTRL          at 16#4# range 0 .. 31;
      LIMIT         at 16#8# range 0 .. 31;
      HALT          at 16#C# range 0 .. 31;
      STOP          at 16#10# range 0 .. 31;
      START         at 16#14# range 0 .. 31;
      DITHER        at 16#18# range 0 .. 31;
      COUNT         at 16#40# range 0 .. 31;
      STATE         at 16#44# range 0 .. 31;
      INPUT         at 16#48# range 0 .. 31;
      REGMODE       at 16#4C# range 0 .. 31;
      OUTPUT        at 16#50# range 0 .. 31;
      OUTPUTDIRCTRL at 16#54# range 0 .. 31;
      RES           at 16#58# range 0 .. 31;
      DMAREQ0       at 16#5C# range 0 .. 31;
      DMAREQ1       at 16#60# range 0 .. 31;
      EVEN          at 16#F0# range 0 .. 31;
      EVFLAG        at 16#F4# range 0 .. 31;
      CONEN         at 16#F8# range 0 .. 31;
      CONFLAG       at 16#FC# range 0 .. 31;
      FRACMAT       at 16#140# range 0 .. 191;
      FRACMATREL    at 16#240# range 0 .. 191;
      EV_STATE0     at 16#300# range 0 .. 31;
      EV_CTRL0      at 16#304# range 0 .. 31;
      EV_STATE1     at 16#308# range 0 .. 31;
      EV_CTRL1      at 16#30C# range 0 .. 31;
      EV_STATE2     at 16#310# range 0 .. 31;
      EV_CTRL2      at 16#314# range 0 .. 31;
      EV_STATE3     at 16#318# range 0 .. 31;
      EV_CTRL3      at 16#31C# range 0 .. 31;
      EV_STATE4     at 16#320# range 0 .. 31;
      EV_CTRL4      at 16#324# range 0 .. 31;
      EV_STATE5     at 16#328# range 0 .. 31;
      EV_CTRL5      at 16#32C# range 0 .. 31;
      EV_STATE6     at 16#330# range 0 .. 31;
      EV_CTRL6      at 16#334# range 0 .. 31;
      EV_STATE7     at 16#338# range 0 .. 31;
      EV_CTRL7      at 16#33C# range 0 .. 31;
      EV_STATE8     at 16#340# range 0 .. 31;
      EV_CTRL8      at 16#344# range 0 .. 31;
      EV_STATE9     at 16#348# range 0 .. 31;
      EV_CTRL9      at 16#34C# range 0 .. 31;
      EV_STATE10    at 16#350# range 0 .. 31;
      EV_CTRL10     at 16#354# range 0 .. 31;
      EV_STATE11    at 16#358# range 0 .. 31;
      EV_CTRL11     at 16#35C# range 0 .. 31;
      EV_STATE12    at 16#360# range 0 .. 31;
      EV_CTRL12     at 16#364# range 0 .. 31;
      EV_STATE13    at 16#368# range 0 .. 31;
      EV_CTRL13     at 16#36C# range 0 .. 31;
      EV_STATE14    at 16#370# range 0 .. 31;
      EV_CTRL14     at 16#374# range 0 .. 31;
      EV_STATE15    at 16#378# range 0 .. 31;
      EV_CTRL15     at 16#37C# range 0 .. 31;
      OUT_SET0      at 16#500# range 0 .. 31;
      OUT_CLR0      at 16#504# range 0 .. 31;
      OUT_SET1      at 16#508# range 0 .. 31;
      OUT_CLR1      at 16#50C# range 0 .. 31;
      OUT_SET2      at 16#510# range 0 .. 31;
      OUT_CLR2      at 16#514# range 0 .. 31;
      OUT_SET3      at 16#518# range 0 .. 31;
      OUT_CLR3      at 16#51C# range 0 .. 31;
      OUT_SET4      at 16#520# range 0 .. 31;
      OUT_CLR4      at 16#524# range 0 .. 31;
      OUT_SET5      at 16#528# range 0 .. 31;
      OUT_CLR5      at 16#52C# range 0 .. 31;
      OUT_SET6      at 16#530# range 0 .. 31;
      OUT_CLR6      at 16#534# range 0 .. 31;
      OUT_SET7      at 16#538# range 0 .. 31;
      OUT_CLR7      at 16#53C# range 0 .. 31;
      OUT_SET8      at 16#540# range 0 .. 31;
      OUT_CLR8      at 16#544# range 0 .. 31;
      OUT_SET9      at 16#548# range 0 .. 31;
      OUT_CLR9      at 16#54C# range 0 .. 31;
      OUT_SET10     at 16#550# range 0 .. 31;
      OUT_CLR10     at 16#554# range 0 .. 31;
      OUT_SET11     at 16#558# range 0 .. 31;
      OUT_CLR11     at 16#55C# range 0 .. 31;
      OUT_SET12     at 16#560# range 0 .. 31;
      OUT_CLR12     at 16#564# range 0 .. 31;
      OUT_SET13     at 16#568# range 0 .. 31;
      OUT_CLR13     at 16#56C# range 0 .. 31;
      OUT_SET14     at 16#570# range 0 .. 31;
      OUT_CLR14     at 16#574# range 0 .. 31;
      OUT_SET15     at 16#578# range 0 .. 31;
      OUT_CLR15     at 16#57C# range 0 .. 31;
      MATCH         at 16#100# range 0 .. 511;
      MATCHREL      at 16#200# range 0 .. 511;
      CAP           at 16#100# range 0 .. 511;
      CAPCTRL       at 16#200# range 0 .. 511;
   end record;

   --  State Configurable Timer (SCT) with dither engine
   SCT_Periph : aliased SCT_Peripheral
     with Import, Address => System'To_Address (16#40000000#);

end Interfaces.LPC4337.SCT;
