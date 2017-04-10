--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.EEPROM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CMD_CMD_Field is Interfaces.LPC4337.UInt3;
   subtype CMD_RESERVED_Field is Interfaces.LPC4337.UInt29;

   --  EEPROM command register
   type CMD_Register is record
      --  Command. Read data shows the last command executed on the EEPROM. 110
      --  = erase/program page All other values are reserved.
      CMD      : CMD_CMD_Field := 16#0#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED : CMD_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMD_Register use record
      CMD      at 0 range 0 .. 2;
      RESERVED at 0 range 3 .. 31;
   end record;

   subtype RWSTATE_RPHASE2_Field is Interfaces.LPC4337.Byte;
   subtype RWSTATE_RPHASE1_Field is Interfaces.LPC4337.Byte;
   subtype RWSTATE_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  EEPROM read wait state register
   type RWSTATE_Register is record
      --  Wait states 2 (minus 1 encoded). The number of system clock periods
      --  to meet the read operations TRPHASE2 duration.
      RPHASE2  : RWSTATE_RPHASE2_Field := 16#5#;
      --  Wait states 1 (minus 1 encoded). The number of system clock periods
      --  to meet a duration equal to TRPHASE1.
      RPHASE1  : RWSTATE_RPHASE1_Field := 16#9#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED : RWSTATE_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RWSTATE_Register use record
      RPHASE2  at 0 range 0 .. 7;
      RPHASE1  at 0 range 8 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype AUTOPROG_AUTOPROG_Field is Interfaces.LPC4337.UInt2;
   subtype AUTOPROG_RESERVED_Field is Interfaces.LPC4337.UInt30;

   --  EEPROM auto programming register
   type AUTOPROG_Register is record
      --  Auto programming mode: 00 = auto programming off 01 = erase/program
      --  cycle is triggered after 1 word is written 10 = erase/program cycle
      --  is triggered after a write to AHB address ending with ......1111100
      --  (last word of a page)
      AUTOPROG : AUTOPROG_AUTOPROG_Field := 16#0#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED : AUTOPROG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AUTOPROG_Register use record
      AUTOPROG at 0 range 0 .. 1;
      RESERVED at 0 range 2 .. 31;
   end record;

   subtype WSTATE_PHASE3_Field is Interfaces.LPC4337.Byte;
   subtype WSTATE_PHASE2_Field is Interfaces.LPC4337.Byte;
   subtype WSTATE_PHASE1_Field is Interfaces.LPC4337.Byte;
   subtype WSTATE_RESERVED_Field is Interfaces.LPC4337.UInt7;
   subtype WSTATE_LCK_PARWEP_Field is Interfaces.LPC4337.Bit;

   --  EEPROM wait state register
   type WSTATE_Register is record
      --  Wait states for phase 3 (minus 1 encoded). The number of system clock
      --  periods to meet a duration equal to TPHASE3.
      PHASE3     : WSTATE_PHASE3_Field := 16#2#;
      --  Wait states for phase 2 (minus 1 encoded). The number of system clock
      --  periods to meet a duration equal to TPHASE2.
      PHASE2     : WSTATE_PHASE2_Field := 16#6#;
      --  Wait states for phase 1 (minus 1 encoded). The number of system clock
      --  periods to meet a duration equal to TPHASE1.
      PHASE1     : WSTATE_PHASE1_Field := 16#2#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED   : WSTATE_RESERVED_Field := 16#0#;
      --  Lock timing parameters for write, erase and program operation 0 =
      --  WSTATE and CLKDIV registers have R/W access 1 = WSTATE and CLKDIV
      --  registers have R only access
      LCK_PARWEP : WSTATE_LCK_PARWEP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WSTATE_Register use record
      PHASE3     at 0 range 0 .. 7;
      PHASE2     at 0 range 8 .. 15;
      PHASE1     at 0 range 16 .. 23;
      RESERVED   at 0 range 24 .. 30;
      LCK_PARWEP at 0 range 31 .. 31;
   end record;

   subtype CLKDIV_CLKDIV_Field is Interfaces.LPC4337.UInt16;
   subtype CLKDIV_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  EEPROM clock divider register
   type CLKDIV_Register is record
      --  Division factor (minus 1 encoded).
      CLKDIV   : CLKDIV_CLKDIV_Field := 16#63#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED : CLKDIV_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLKDIV_Register use record
      CLKDIV   at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype PWRDWN_PWRDWN_Field is Interfaces.LPC4337.Bit;
   subtype PWRDWN_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  EEPROM power-down register
   type PWRDWN_Register is record
      --  Power down mode bit. 0 = not in power down mode. 1 = power down mode.
      PWRDWN   : PWRDWN_PWRDWN_Field := 16#0#;
      --  Reserved. Read value is undefined, only zero should be written.
      RESERVED : PWRDWN_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWRDWN_Register use record
      PWRDWN   at 0 range 0 .. 0;
      RESERVED at 0 range 1 .. 31;
   end record;

   subtype INTENCLR_RESERVED_Field is Interfaces.LPC4337.UInt2;
   subtype INTENCLR_PROG_CLR_EN_Field is Interfaces.LPC4337.Bit;
   subtype INTENCLR_RESERVED_Field_1 is Interfaces.LPC4337.UInt29;

   --  EEPROM interrupt enable clear
   type INTENCLR_Register is record
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED    : INTENCLR_RESERVED_Field := 16#0#;
      --  Write-only. Clear program operation finished interrupt enable bit for
      --  EEPROM. 0 = leave corresponding bit unchanged. 1 = clear
      --  corresponding bit.
      PROG_CLR_EN : INTENCLR_PROG_CLR_EN_Field := 16#0#;
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED_1  : INTENCLR_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      RESERVED    at 0 range 0 .. 1;
      PROG_CLR_EN at 0 range 2 .. 2;
      RESERVED_1  at 0 range 3 .. 31;
   end record;

   subtype INTENSET_RESERVED_Field is Interfaces.LPC4337.UInt2;
   subtype INTENSET_PROG_SET_EN_Field is Interfaces.LPC4337.Bit;
   subtype INTENSET_RESERVED_Field_1 is Interfaces.LPC4337.UInt29;

   --  EEPROM interrupt enable set
   type INTENSET_Register is record
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED    : INTENSET_RESERVED_Field := 16#0#;
      --  Write-only. Set program operation finished interrupt enable bit for
      --  EEPROM device 1. 0 = leave corresponding bit unchanged. 1 = set
      --  corresponding bit.
      PROG_SET_EN : INTENSET_PROG_SET_EN_Field := 16#0#;
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED_1  : INTENSET_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      RESERVED    at 0 range 0 .. 1;
      PROG_SET_EN at 0 range 2 .. 2;
      RESERVED_1  at 0 range 3 .. 31;
   end record;

   subtype INTSTAT_RESERVED_Field is Interfaces.LPC4337.UInt2;
   subtype INTSTAT_END_OF_PROG_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_RESERVED_Field_1 is Interfaces.LPC4337.UInt29;

   --  EEPROM interrupt status
   type INTSTAT_Register is record
      --  Read-only. Reserved. The value read from a reserved bit is not
      --  defined.
      RESERVED    : INTSTAT_RESERVED_Field;
      --  Read-only. EEPROM program operation finished interrupt status bit.
      --  Bit is: - set when this operation has finished OR when one is written
      --  to the corresponding bit of the INTSTATSET register. - cleared when
      --  one is written to the corresponding bit of the INTSTATCLR register.
      END_OF_PROG : INTSTAT_END_OF_PROG_Field;
      --  Read-only. Reserved. The value read from a reserved bit is not
      --  defined.
      RESERVED_1  : INTSTAT_RESERVED_Field_1;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTSTAT_Register use record
      RESERVED    at 0 range 0 .. 1;
      END_OF_PROG at 0 range 2 .. 2;
      RESERVED_1  at 0 range 3 .. 31;
   end record;

   subtype INTEN_RESERVED_Field is Interfaces.LPC4337.UInt2;
   subtype INTEN_EE_PROG_DONE_Field is Interfaces.LPC4337.Bit;
   subtype INTEN_RESERVED_Field_1 is Interfaces.LPC4337.UInt29;

   --  EEPROM interrupt enable
   type INTEN_Register is record
      --  Read-only. Reserved. The value read from a reserved bit is not
      --  defined.
      RESERVED     : INTEN_RESERVED_Field;
      --  Read-only. EEPROM program operation finished interrupt enable bit.
      --  Bit is: - set when one is written in the corresponding bit of the
      --  INTENSET register. - cleared when one is written to the corresponding
      --  bit of the INTENCLR register.
      EE_PROG_DONE : INTEN_EE_PROG_DONE_Field;
      --  Read-only. Reserved. The value read from a reserved bit is not
      --  defined.
      RESERVED_1   : INTEN_RESERVED_Field_1;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTEN_Register use record
      RESERVED     at 0 range 0 .. 1;
      EE_PROG_DONE at 0 range 2 .. 2;
      RESERVED_1   at 0 range 3 .. 31;
   end record;

   subtype INTSTATCLR_RESERVED_Field is Interfaces.LPC4337.UInt2;
   subtype INTSTATCLR_PROG_CLR_ST_Field is Interfaces.LPC4337.Bit;
   subtype INTSTATCLR_RESERVED_Field_1 is Interfaces.LPC4337.UInt29;

   --  EEPROM interrupt status clear
   type INTSTATCLR_Register is record
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED    : INTSTATCLR_RESERVED_Field := 16#0#;
      --  Write-only. Clear program operation finished interrupt status bit for
      --  EEPROM device. 0 = leave corresponding bit unchanged. 1 = clear
      --  corresponding bit.
      PROG_CLR_ST : INTSTATCLR_PROG_CLR_ST_Field := 16#0#;
      --  Write-only. Reserved. Read value is undefined, only zero should be
      --  written.
      RESERVED_1  : INTSTATCLR_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTSTATCLR_Register use record
      RESERVED    at 0 range 0 .. 1;
      PROG_CLR_ST at 0 range 2 .. 2;
      RESERVED_1  at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  EEPROM
   type EEPROM_Peripheral is record
      --  EEPROM command register
      CMD        : aliased CMD_Register;
      --  EEPROM read wait state register
      RWSTATE    : aliased RWSTATE_Register;
      --  EEPROM auto programming register
      AUTOPROG   : aliased AUTOPROG_Register;
      --  EEPROM wait state register
      WSTATE     : aliased WSTATE_Register;
      --  EEPROM clock divider register
      CLKDIV     : aliased CLKDIV_Register;
      --  EEPROM power-down register
      PWRDWN     : aliased PWRDWN_Register;
      --  EEPROM interrupt enable clear
      INTENCLR   : aliased INTENCLR_Register;
      --  EEPROM interrupt enable set
      INTENSET   : aliased INTENSET_Register;
      --  EEPROM interrupt status
      INTSTAT    : aliased INTSTAT_Register;
      --  EEPROM interrupt enable
      INTEN      : aliased INTEN_Register;
      --  EEPROM interrupt status clear
      INTSTATCLR : aliased INTSTATCLR_Register;
   end record
     with Volatile;

   for EEPROM_Peripheral use record
      CMD        at 16#0# range 0 .. 31;
      RWSTATE    at 16#8# range 0 .. 31;
      AUTOPROG   at 16#C# range 0 .. 31;
      WSTATE     at 16#10# range 0 .. 31;
      CLKDIV     at 16#14# range 0 .. 31;
      PWRDWN     at 16#18# range 0 .. 31;
      INTENCLR   at 16#FD8# range 0 .. 31;
      INTENSET   at 16#FDC# range 0 .. 31;
      INTSTAT    at 16#FE0# range 0 .. 31;
      INTEN      at 16#FE4# range 0 .. 31;
      INTSTATCLR at 16#FE8# range 0 .. 31;
   end record;

   --  EEPROM
   EEPROM_Periph : aliased EEPROM_Peripheral
     with Import, Address => System'To_Address (16#4000E000#);

end Interfaces.LPC4337.EEPROM;
