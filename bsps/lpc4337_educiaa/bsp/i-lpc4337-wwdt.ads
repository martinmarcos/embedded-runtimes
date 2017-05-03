--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.WWDT is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Watchdog enable bit. This bit is Set Only.
   type MOD_ENUM is
     (
      --  The watchdog timer is stopped.
      Wwdtstopped,
      --  The watchdog timer is running.
      Wwdtrun)
     with Size => 1;
   for MOD_ENUM use
     (Wwdtstopped => 0,
      Wwdtrun => 1);

   --  Watchdog reset enable bit. This bit is Set Only.
   type MOD_ENUM_1 is
     (
      --  A watchdog time-out will not cause a chip reset.
      Wwdtint,
      --  A watchdog time-out will cause a chip reset.
      Wwdtreset)
     with Size => 1;
   for MOD_ENUM_1 use
     (Wwdtint => 0,
      Wwdtreset => 1);

   subtype MOD_WDTOF_Field is Interfaces.LPC4337.Bit;
   subtype MOD_WDINT_Field is Interfaces.LPC4337.Bit;

   --  Watchdog update mode. This bit is Set Only.
   type MOD_ENUM_2 is
     (
      --  The watchdog time-out value (WDTC) can be changed at any time.
      No_Lock,
      --  The watchdog time-out value (WDTC) can be changed only after the
      --  counter is below the value of WDWARNINT and WDWINDOW.
      Lock)
     with Size => 1;
   for MOD_ENUM_2 use
     (No_Lock => 0,
      Lock => 1);

   subtype MOD_RESERVED_Field is Interfaces.LPC4337.UInt3;

   --  Watchdog mode register. This register contains the basic mode and status
   --  of the Watchdog Timer.
   type MOD_Register is record
      --  Watchdog enable bit. This bit is Set Only.
      WDEN          : MOD_ENUM := Interfaces.LPC4337.WWDT.Wwdtstopped;
      --  Watchdog reset enable bit. This bit is Set Only.
      WDRESET       : MOD_ENUM_1 := Interfaces.LPC4337.WWDT.Wwdtint;
      --  Watchdog time-out flag. Set when the watchdog timer times out, by a
      --  feed error, or by events associated with WDPROTECT, cleared by
      --  software. Causes a chip reset if WDRESET = 1. This flag is cleared by
      --  software writing a 0 to this bit.
      WDTOF         : MOD_WDTOF_Field := 16#0#;
      --  Watchdog interrupt flag. Set when the timer reaches the value in the
      --  WARNINT register. Cleared by software by writing a 1 to this bit.
      WDINT         : MOD_WDINT_Field := 16#0#;
      --  Watchdog update mode. This bit is Set Only.
      WDPROTECT     : MOD_ENUM_2 := Interfaces.LPC4337.WWDT.No_Lock;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED      : MOD_RESERVED_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.LPC4337.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MOD_Register use record
      WDEN          at 0 range 0 .. 0;
      WDRESET       at 0 range 1 .. 1;
      WDTOF         at 0 range 2 .. 2;
      WDINT         at 0 range 3 .. 3;
      WDPROTECT     at 0 range 4 .. 4;
      RESERVED      at 0 range 5 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TC_WDTC_Field is Interfaces.LPC4337.UInt24;
   subtype TC_RESERVED_Field is Interfaces.LPC4337.Byte;

   --  Watchdog timer constant register. This register determines the time-out
   --  value.
   type TC_Register is record
      --  Watchdog time-out value.
      WDTC     : TC_WDTC_Field := 16#FF#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : TC_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_Register use record
      WDTC     at 0 range 0 .. 23;
      RESERVED at 0 range 24 .. 31;
   end record;

   subtype FEED_Feed_Field is Interfaces.LPC4337.Byte;

   --  Watchdog feed sequence register. Writing 0xAA followed by 0x55 to this
   --  register reloads the Watchdog timer with the value contained in WDTC.
   type FEED_Register is record
      --  Write-only. Feed value should be 0xAA followed by 0x55.
      Feed          : FEED_Feed_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.LPC4337.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FEED_Register use record
      Feed          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TV_Count_Field is Interfaces.LPC4337.UInt24;
   subtype TV_RESERVED_Field is Interfaces.LPC4337.Byte;

   --  Watchdog timer value register. This register reads out the current value
   --  of the Watchdog timer.
   type TV_Register is record
      --  Read-only. Counter timer value.
      Count    : TV_Count_Field;
      --  Read-only. Reserved, user software should not write ones to reserved
      --  bits. The value read from a reserved bit is not defined.
      RESERVED : TV_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TV_Register use record
      Count    at 0 range 0 .. 23;
      RESERVED at 0 range 24 .. 31;
   end record;

   subtype WARNINT_WDWARNINT_Field is Interfaces.LPC4337.UInt10;
   subtype WARNINT_RESERVED_Field is Interfaces.LPC4337.UInt22;

   --  Watchdog warning interrupt register. This register contains the Watchdog
   --  warning interrupt compare value.
   type WARNINT_Register is record
      --  Watchdog warning interrupt compare value.
      WDWARNINT : WARNINT_WDWARNINT_Field := 16#0#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED  : WARNINT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WARNINT_Register use record
      WDWARNINT at 0 range 0 .. 9;
      RESERVED  at 0 range 10 .. 31;
   end record;

   subtype WINDOW_WDWINDOW_Field is Interfaces.LPC4337.UInt24;
   subtype WINDOW_RESERVED_Field is Interfaces.LPC4337.Byte;

   --  Watchdog timer window register. This register contains the Watchdog
   --  window value.
   type WINDOW_Register is record
      --  Watchdog window value.
      WDWINDOW : WINDOW_WDWINDOW_Field := 16#FFFFFF#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : WINDOW_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WINDOW_Register use record
      WDWINDOW at 0 range 0 .. 23;
      RESERVED at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Windowed Watchdog timer (WWDT)
   type WWDT_Peripheral is record
      --  Watchdog mode register. This register contains the basic mode and
      --  status of the Watchdog Timer.
      MOD_k   : aliased MOD_Register;
      --  Watchdog timer constant register. This register determines the
      --  time-out value.
      TC      : aliased TC_Register;
      --  Watchdog feed sequence register. Writing 0xAA followed by 0x55 to
      --  this register reloads the Watchdog timer with the value contained in
      --  WDTC.
      FEED    : aliased FEED_Register;
      --  Watchdog timer value register. This register reads out the current
      --  value of the Watchdog timer.
      TV      : aliased TV_Register;
      --  Watchdog warning interrupt register. This register contains the
      --  Watchdog warning interrupt compare value.
      WARNINT : aliased WARNINT_Register;
      --  Watchdog timer window register. This register contains the Watchdog
      --  window value.
      WINDOW  : aliased WINDOW_Register;
   end record
     with Volatile;

   for WWDT_Peripheral use record
      MOD_k   at 16#0# range 0 .. 31;
      TC      at 16#4# range 0 .. 31;
      FEED    at 16#8# range 0 .. 31;
      TV      at 16#C# range 0 .. 31;
      WARNINT at 16#14# range 0 .. 31;
      WINDOW  at 16#18# range 0 .. 31;
   end record;

   --  Windowed Watchdog timer (WWDT)
   WWDT_Periph : aliased WWDT_Peripheral
     with Import, Address => System'To_Address (16#40080000#);

end Interfaces.LPC4337.WWDT;
