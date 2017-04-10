--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.REGFILE is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  General purpose storage register

   --  General purpose storage register
   type REGFILE_Registers is array (0 .. 63) of Interfaces.LPC4337.UInt32
     with Volatile;

   -----------------
   -- Peripherals --
   -----------------

   --  RTC REGFILE
   type REGFILE_Peripheral is record
      --  General purpose storage register
      REGFILE : aliased REGFILE_Registers;
   end record
     with Volatile;

   for REGFILE_Peripheral use record
      REGFILE at 0 range 0 .. 2047;
   end record;

   --  RTC REGFILE
   REGFILE_Periph : aliased REGFILE_Peripheral
     with Import, Address => System'To_Address (16#40041000#);

end Interfaces.LPC4337.REGFILE;
