--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.DAC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RESERVED_Field is Interfaces.LPC4337.UInt6;
   subtype CR_VALUE_Field is Interfaces.LPC4337.UInt10;

   --  Settling time
   type CR_ENUM is
     (
      --  The settling time of the DAC is 1 micros max, and the maximum current
      --  is 700 microA.
      Short,
      --  The settling time of the DAC is 2.5 micros and the maximum current is
      --  350 microA.
      Long)
     with Size => 1;
   for CR_ENUM use
     (Short => 0,
      Long => 1);

   subtype CR_RESERVED_Field_1 is Interfaces.LPC4337.UInt15;

   --  DAC register. Holds the conversion data.
   type CR_Register is record
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED   : CR_RESERVED_Field := 16#0#;
      --  After the selected settling time after this field is written with a
      --  new VALUE, the voltage on the DACOUT pin (with respect to VSSA) is
      --  VALUE/1024 X VDDA.
      VALUE      : CR_VALUE_Field := 16#0#;
      --  Settling time
      BIAS       : CR_ENUM := Interfaces.LPC4337.DAC.Short;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED_1 : CR_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESERVED   at 0 range 0 .. 5;
      VALUE      at 0 range 6 .. 15;
      BIAS       at 0 range 16 .. 16;
      RESERVED_1 at 0 range 17 .. 31;
   end record;

   --  DMA request
   type CTRL_ENUM is
     (
      --  This bit is cleared on any write to the DACR register.
      Clr,
      --  This bit is set by hardware when the timer times out.
      Set)
     with Size => 1;
   for CTRL_ENUM use
     (Clr => 0,
      Set => 1);

   --  DMA double-buffering
   type CTRL_ENUM_1 is
     (
      --  DACR double-buffering is disabled.
      Disabled,
      --  When this bit and the CNT_ENA bit are both set, the double-buffering
      --  feature in the DACR register will be enabled. Writes to the DACR
      --  register are written to a pre-buffer and then transferred to the DACR
      --  on the next time-out of the counter.
      Enabled)
     with Size => 1;
   for CTRL_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype CTRL_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  DAC control register.
   type CTRL_Register is record
      --  DMA request
      INT_DMA_REQ : CTRL_ENUM := Interfaces.LPC4337.DAC.Clr;
      --  DMA double-buffering
      DBLBUF_ENA  : CTRL_ENUM_1 := Interfaces.LPC4337.DAC.Disabled;
      --  DMA time-out
      CNT_ENA     : CTRL_ENUM_1 := Interfaces.LPC4337.DAC.Disabled;
      --  DMA enable
      DMA_ENA     : CTRL_ENUM_1 := Interfaces.LPC4337.DAC.Disabled;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED    : CTRL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      INT_DMA_REQ at 0 range 0 .. 0;
      DBLBUF_ENA  at 0 range 1 .. 1;
      CNT_ENA     at 0 range 2 .. 2;
      DMA_ENA     at 0 range 3 .. 3;
      RESERVED    at 0 range 4 .. 31;
   end record;

   subtype CNTVAL_VALUE_Field is Interfaces.LPC4337.UInt16;
   subtype CNTVAL_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  DAC counter value register.
   type CNTVAL_Register is record
      --  16-bit reload value for the DAC interrupt/DMA timer.
      VALUE    : CNTVAL_VALUE_Field := 16#0#;
      --  Reserved.
      RESERVED : CNTVAL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNTVAL_Register use record
      VALUE    at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Digital-to-Analog Converter (DAC)
   type DAC_Peripheral is record
      --  DAC register. Holds the conversion data.
      CR     : aliased CR_Register;
      --  DAC control register.
      CTRL   : aliased CTRL_Register;
      --  DAC counter value register.
      CNTVAL : aliased CNTVAL_Register;
   end record
     with Volatile;

   for DAC_Peripheral use record
      CR     at 16#0# range 0 .. 31;
      CTRL   at 16#4# range 0 .. 31;
      CNTVAL at 16#8# range 0 .. 31;
   end record;

   --  Digital-to-Analog Converter (DAC)
   DAC_Periph : aliased DAC_Peripheral
     with Import, Address => System'To_Address (16#400E1000#);

end Interfaces.LPC4337.DAC;
