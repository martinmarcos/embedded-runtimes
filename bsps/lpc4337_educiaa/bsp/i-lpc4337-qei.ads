--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.QEI is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CON_RESP_Field is Interfaces.LPC4337.Bit;
   subtype CON_RESPI_Field is Interfaces.LPC4337.Bit;
   subtype CON_RESV_Field is Interfaces.LPC4337.Bit;
   subtype CON_RESI_Field is Interfaces.LPC4337.Bit;
   subtype CON_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  Control register
   type CON_Register is record
      --  Write-only. Reset position counter. When set = 1, resets the position
      --  counter to all zeros. Autoclears when the position counter is
      --  cleared.
      RESP     : CON_RESP_Field := 16#0#;
      --  Write-only. Reset position counter on index. When set = 1, resets the
      --  position counter to all zeros when an index pulse occurs. Autoclears
      --  when the position counter is cleared.
      RESPI    : CON_RESPI_Field := 16#0#;
      --  Write-only. Reset velocity. When set = 1, resets the velocity counter
      --  to all zeros and reloads the velocity timer. Autoclears when the
      --  velocity counter is cleared.
      RESV     : CON_RESV_Field := 16#0#;
      --  Write-only. Reset index counter. When set = 1, resets the index
      --  counter to all zeros. Autoclears when the index counter is cleared.
      RESI     : CON_RESI_Field := 16#0#;
      --  Write-only. reserved
      RESERVED : CON_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CON_Register use record
      RESP     at 0 range 0 .. 0;
      RESPI    at 0 range 1 .. 1;
      RESV     at 0 range 2 .. 2;
      RESI     at 0 range 3 .. 3;
      RESERVED at 0 range 4 .. 31;
   end record;

   subtype STAT_DIR_Field is Interfaces.LPC4337.Bit;
   subtype STAT_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  Encoder status register
   type STAT_Register is record
      --  Read-only. Direction bit. In combination with DIRINV bit indicates
      --  forward or reverse direction. See Table 516.
      DIR      : STAT_DIR_Field;
      --  Read-only. reserved
      RESERVED : STAT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      DIR      at 0 range 0 .. 0;
      RESERVED at 0 range 1 .. 31;
   end record;

   subtype CONF_DIRINV_Field is Interfaces.LPC4337.Bit;
   subtype CONF_SIGMODE_Field is Interfaces.LPC4337.Bit;
   subtype CONF_CAPMODE_Field is Interfaces.LPC4337.Bit;
   subtype CONF_INVINX_Field is Interfaces.LPC4337.Bit;
   subtype CONF_CRESPI_Field is Interfaces.LPC4337.Bit;
   subtype CONF_RESERVED_Field is Interfaces.LPC4337.UInt11;
   subtype CONF_INXGATE_Field is Interfaces.LPC4337.UInt4;
   subtype CONF_RESERVED_Field_1 is Interfaces.LPC4337.UInt12;

   --  Configuration register
   type CONF_Register is record
      --  Direction invert. When = 1, complements the DIR bit.
      DIRINV     : CONF_DIRINV_Field := 16#0#;
      --  Signal Mode. When = 0, PhA and PhB function as quadrature encoder
      --  inputs. When = 1, PhA functions as the direction signal and PhB
      --  functions as the clock signal.
      SIGMODE    : CONF_SIGMODE_Field := 16#0#;
      --  Capture Mode. When = 0, only PhA edges are counted (2X). When = 1,
      --  BOTH PhA and PhB edges are counted (4X), increasing resolution but
      --  decreasing range.
      CAPMODE    : CONF_CAPMODE_Field := 16#0#;
      --  Invert Index. When set, inverts the sense of the index input.
      INVINX     : CONF_INVINX_Field := 16#0#;
      --  Continuously reset position counter on index. When set = 1, resets
      --  the position counter to all zeros when an index pulse occurs at the
      --  next position increase (recalibration). Auto-clears when the position
      --  counter is cleared.
      CRESPI     : CONF_CRESPI_Field := 16#0#;
      --  Reserved
      RESERVED   : CONF_RESERVED_Field := 16#0#;
      --  Index gating configuration: when INXGATE(19)=1, pass the index when
      --  Pha=0 and Phb=0, else block. when INXGATE(18)=1, pass the index when
      --  Pha=0 and Phb=1, else block. when INXGATE(17)=1, pass the index when
      --  Pha=1 and Phb=1, else block. when INXGATE(16)=1, pass the index when
      --  Pha=1 and Phb=0, else block.
      INXGATE    : CONF_INXGATE_Field := 16#F#;
      --  reserved
      RESERVED_1 : CONF_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONF_Register use record
      DIRINV     at 0 range 0 .. 0;
      SIGMODE    at 0 range 1 .. 1;
      CAPMODE    at 0 range 2 .. 2;
      INVINX     at 0 range 3 .. 3;
      CRESPI     at 0 range 4 .. 4;
      RESERVED   at 0 range 5 .. 15;
      INXGATE    at 0 range 16 .. 19;
      RESERVED_1 at 0 range 20 .. 31;
   end record;

   subtype IEC_INX_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_TIM_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_VELC_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_DIR_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_ERR_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_ENCLK_EN_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_POS2REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype IEC_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt enable clear register
   type IEC_Register is record
      --  Write-only. Indicates that an index pulse was detected.
      INX_EN      : IEC_INX_EN_Field := 16#0#;
      --  Write-only. Indicates that a velocity timer overflow occurred
      TIM_EN      : IEC_TIM_EN_Field := 16#0#;
      --  Write-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_EN     : IEC_VELC_EN_Field := 16#0#;
      --  Write-only. Indicates that a change of direction was detected.
      DIR_EN      : IEC_DIR_EN_Field := 16#0#;
      --  Write-only. Indicates that an encoder phase error was detected.
      ERR_EN      : IEC_ERR_EN_Field := 16#0#;
      --  Write-only. Indicates that and encoder clock pulse was detected.
      ENCLK_EN    : IEC_ENCLK_EN_Field := 16#0#;
      --  Write-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int    : IEC_POS0_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 1compare value is equal to
      --  the current position.
      POS1_Int    : IEC_POS1_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int    : IEC_POS2_Int_Field := 16#0#;
      --  Write-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int     : IEC_REV_Int_Field := 16#0#;
      --  Write-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int : IEC_POS0REV_Int_Field := 16#0#;
      --  Write-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int : IEC_POS1REV_Int_Field := 16#0#;
      --  Write-only. Combined position 2 and revolution count interrupt. Set
      --  when both the POS2_Int bit is set and the REV_Int is set.
      POS2REV_Int : IEC_POS2REV_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int    : IEC_REV1_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int    : IEC_REV2_Int_Field := 16#0#;
      --  Write-only. Indicates that the current position count goes through
      --  the MAXPOS value to zero in forward direction, or through zero to
      --  MAXPOS in backward direction.
      MAXPOS_Int  : IEC_MAXPOS_Int_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED    : IEC_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IEC_Register use record
      INX_EN      at 0 range 0 .. 0;
      TIM_EN      at 0 range 1 .. 1;
      VELC_EN     at 0 range 2 .. 2;
      DIR_EN      at 0 range 3 .. 3;
      ERR_EN      at 0 range 4 .. 4;
      ENCLK_EN    at 0 range 5 .. 5;
      POS0_Int    at 0 range 6 .. 6;
      POS1_Int    at 0 range 7 .. 7;
      POS2_Int    at 0 range 8 .. 8;
      REV_Int     at 0 range 9 .. 9;
      POS0REV_Int at 0 range 10 .. 10;
      POS1REV_Int at 0 range 11 .. 11;
      POS2REV_Int at 0 range 12 .. 12;
      REV1_Int    at 0 range 13 .. 13;
      REV2_Int    at 0 range 14 .. 14;
      MAXPOS_Int  at 0 range 15 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype IES_INX_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_TIM_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_VELC_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_DIR_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_ERR_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_ENCLK_EN_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_POS2REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype IES_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt enable set register
   type IES_Register is record
      --  Write-only. Indicates that an index pulse was detected.
      INX_EN      : IES_INX_EN_Field := 16#0#;
      --  Write-only. Indicates that a velocity timer overflow occurred
      TIM_EN      : IES_TIM_EN_Field := 16#0#;
      --  Write-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_EN     : IES_VELC_EN_Field := 16#0#;
      --  Write-only. Indicates that a change of direction was detected.
      DIR_EN      : IES_DIR_EN_Field := 16#0#;
      --  Write-only. Indicates that an encoder phase error was detected.
      ERR_EN      : IES_ERR_EN_Field := 16#0#;
      --  Write-only. Indicates that and encoder clock pulse was detected.
      ENCLK_EN    : IES_ENCLK_EN_Field := 16#0#;
      --  Write-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int    : IES_POS0_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 1compare value is equal to
      --  the current position.
      POS1_Int    : IES_POS1_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int    : IES_POS2_Int_Field := 16#0#;
      --  Write-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int     : IES_REV_Int_Field := 16#0#;
      --  Write-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int : IES_POS0REV_Int_Field := 16#0#;
      --  Write-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int : IES_POS1REV_Int_Field := 16#0#;
      --  Write-only. Combined position 2 and revolution count interrupt. Set
      --  when both the POS2_Int bit is set and the REV_Int is set.
      POS2REV_Int : IES_POS2REV_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int    : IES_REV1_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int    : IES_REV2_Int_Field := 16#0#;
      --  Write-only. Indicates that the current position count goes through
      --  the MAXPOS value to zero in forward direction, or through zero to
      --  MAXPOS in backward direction.
      MAXPOS_Int  : IES_MAXPOS_Int_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED    : IES_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IES_Register use record
      INX_EN      at 0 range 0 .. 0;
      TIM_EN      at 0 range 1 .. 1;
      VELC_EN     at 0 range 2 .. 2;
      DIR_EN      at 0 range 3 .. 3;
      ERR_EN      at 0 range 4 .. 4;
      ENCLK_EN    at 0 range 5 .. 5;
      POS0_Int    at 0 range 6 .. 6;
      POS1_Int    at 0 range 7 .. 7;
      POS2_Int    at 0 range 8 .. 8;
      REV_Int     at 0 range 9 .. 9;
      POS0REV_Int at 0 range 10 .. 10;
      POS1REV_Int at 0 range 11 .. 11;
      POS2REV_Int at 0 range 12 .. 12;
      REV1_Int    at 0 range 13 .. 13;
      REV2_Int    at 0 range 14 .. 14;
      MAXPOS_Int  at 0 range 15 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype INTSTAT_INX_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_TIM_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_VELC_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_DIR_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_ERR_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_ENCLK_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_POS2REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype INTSTAT_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt status register
   type INTSTAT_Register is record
      --  Read-only. Indicates that an index pulse was detected.
      INX_Int     : INTSTAT_INX_Int_Field;
      --  Read-only. Indicates that a velocity timer overflow occurred
      TIM_Int     : INTSTAT_TIM_Int_Field;
      --  Read-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_Int    : INTSTAT_VELC_Int_Field;
      --  Read-only. Indicates that a change of direction was detected.
      DIR_Int     : INTSTAT_DIR_Int_Field;
      --  Read-only. Indicates that an encoder phase error was detected.
      ERR_Int     : INTSTAT_ERR_Int_Field;
      --  Read-only. Indicates that and encoder clock pulse was detected.
      ENCLK_Int   : INTSTAT_ENCLK_Int_Field;
      --  Read-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int    : INTSTAT_POS0_Int_Field;
      --  Read-only. Indicates that the position 1compare value is equal to the
      --  current position.
      POS1_Int    : INTSTAT_POS1_Int_Field;
      --  Read-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int    : INTSTAT_POS2_Int_Field;
      --  Read-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int     : INTSTAT_REV_Int_Field;
      --  Read-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int : INTSTAT_POS0REV_Int_Field;
      --  Read-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int : INTSTAT_POS1REV_Int_Field;
      --  Read-only. Combined position 2 and revolution count interrupt. Set
      --  when both the POS2_Int bit is set and the REV_Int is set.
      POS2REV_Int : INTSTAT_POS2REV_Int_Field;
      --  Read-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int    : INTSTAT_REV1_Int_Field;
      --  Read-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int    : INTSTAT_REV2_Int_Field;
      --  Read-only. Indicates that the current position count goes through the
      --  MAXPOS value to zero in forward direction, or through zero to MAXPOS
      --  in backward direction.
      MAXPOS_Int  : INTSTAT_MAXPOS_Int_Field;
      --  Read-only. Reserved
      RESERVED    : INTSTAT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTSTAT_Register use record
      INX_Int     at 0 range 0 .. 0;
      TIM_Int     at 0 range 1 .. 1;
      VELC_Int    at 0 range 2 .. 2;
      DIR_Int     at 0 range 3 .. 3;
      ERR_Int     at 0 range 4 .. 4;
      ENCLK_Int   at 0 range 5 .. 5;
      POS0_Int    at 0 range 6 .. 6;
      POS1_Int    at 0 range 7 .. 7;
      POS2_Int    at 0 range 8 .. 8;
      REV_Int     at 0 range 9 .. 9;
      POS0REV_Int at 0 range 10 .. 10;
      POS1REV_Int at 0 range 11 .. 11;
      POS2REV_Int at 0 range 12 .. 12;
      REV1_Int    at 0 range 13 .. 13;
      REV2_Int    at 0 range 14 .. 14;
      MAXPOS_Int  at 0 range 15 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype IE_INX_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_TIM_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_VELC_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_DIR_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_ERR_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_ENCLK_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_POS2REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype IE_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt enable register
   type IE_Register is record
      --  Read-only. Indicates that an index pulse was detected.
      INX_Int     : IE_INX_Int_Field;
      --  Read-only. Indicates that a velocity timer overflow occurred
      TIM_Int     : IE_TIM_Int_Field;
      --  Read-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_Int    : IE_VELC_Int_Field;
      --  Read-only. Indicates that a change of direction was detected.
      DIR_Int     : IE_DIR_Int_Field;
      --  Read-only. Indicates that an encoder phase error was detected.
      ERR_Int     : IE_ERR_Int_Field;
      --  Read-only. Indicates that and encoder clock pulse was detected.
      ENCLK_Int   : IE_ENCLK_Int_Field;
      --  Read-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int    : IE_POS0_Int_Field;
      --  Read-only. Indicates that the position 1compare value is equal to the
      --  current position.
      POS1_Int    : IE_POS1_Int_Field;
      --  Read-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int    : IE_POS2_Int_Field;
      --  Read-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int     : IE_REV_Int_Field;
      --  Read-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int : IE_POS0REV_Int_Field;
      --  Read-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int : IE_POS1REV_Int_Field;
      --  Read-only. Combined position 2 and revolution count interrupt. Set
      --  when both the POS2_Int bit is set and the REV_Int is set.
      POS2REV_Int : IE_POS2REV_Int_Field;
      --  Read-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int    : IE_REV1_Int_Field;
      --  Read-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int    : IE_REV2_Int_Field;
      --  Read-only. Indicates that the current position count goes through the
      --  MAXPOS value to zero in forward direction, or through zero to MAXPOS
      --  in backward direction.
      MAXPOS_Int  : IE_MAXPOS_Int_Field;
      --  Read-only. Reserved
      RESERVED    : IE_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IE_Register use record
      INX_Int     at 0 range 0 .. 0;
      TIM_Int     at 0 range 1 .. 1;
      VELC_Int    at 0 range 2 .. 2;
      DIR_Int     at 0 range 3 .. 3;
      ERR_Int     at 0 range 4 .. 4;
      ENCLK_Int   at 0 range 5 .. 5;
      POS0_Int    at 0 range 6 .. 6;
      POS1_Int    at 0 range 7 .. 7;
      POS2_Int    at 0 range 8 .. 8;
      REV_Int     at 0 range 9 .. 9;
      POS0REV_Int at 0 range 10 .. 10;
      POS1REV_Int at 0 range 11 .. 11;
      POS2REV_Int at 0 range 12 .. 12;
      REV1_Int    at 0 range 13 .. 13;
      REV2_Int    at 0 range 14 .. 14;
      MAXPOS_Int  at 0 range 15 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype CLR_INX_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_TIM_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_VELC_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_DIR_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_ERR_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_ENCLK_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype CLR_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt status clear register
   type CLR_Register is record
      --  Write-only. Indicates that an index pulse was detected.
      INX_Int        : CLR_INX_Int_Field := 16#0#;
      --  Write-only. Indicates that a velocity timer overflow occurred
      TIM_Int        : CLR_TIM_Int_Field := 16#0#;
      --  Write-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_Int       : CLR_VELC_Int_Field := 16#0#;
      --  Write-only. Indicates that a change of direction was detected.
      DIR_Int        : CLR_DIR_Int_Field := 16#0#;
      --  Write-only. Indicates that an encoder phase error was detected.
      ERR_Int        : CLR_ERR_Int_Field := 16#0#;
      --  Write-only. Indicates that and encoder clock pulse was detected.
      ENCLK_Int      : CLR_ENCLK_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int       : CLR_POS0_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 1compare value is equal to
      --  the current position.
      POS1_Int       : CLR_POS1_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int       : CLR_POS2_Int_Field := 16#0#;
      --  Write-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int        : CLR_REV_Int_Field := 16#0#;
      --  Write-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int    : CLR_POS0REV_Int_Field := 16#0#;
      --  Write-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int    : CLR_POS1REV_Int_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : Interfaces.LPC4337.Bit := 16#0#;
      --  Write-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int       : CLR_REV1_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int       : CLR_REV2_Int_Field := 16#0#;
      --  Write-only. Indicates that the current position count goes through
      --  the MAXPOS value to zero in forward direction, or through zero to
      --  MAXPOS in backward direction.
      MAXPOS_Int     : CLR_MAXPOS_Int_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED       : CLR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_Register use record
      INX_Int        at 0 range 0 .. 0;
      TIM_Int        at 0 range 1 .. 1;
      VELC_Int       at 0 range 2 .. 2;
      DIR_Int        at 0 range 3 .. 3;
      ERR_Int        at 0 range 4 .. 4;
      ENCLK_Int      at 0 range 5 .. 5;
      POS0_Int       at 0 range 6 .. 6;
      POS1_Int       at 0 range 7 .. 7;
      POS2_Int       at 0 range 8 .. 8;
      REV_Int        at 0 range 9 .. 9;
      POS0REV_Int    at 0 range 10 .. 10;
      POS1REV_Int    at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      REV1_Int       at 0 range 13 .. 13;
      REV2_Int       at 0 range 14 .. 14;
      MAXPOS_Int     at 0 range 15 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype SET_INX_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_TIM_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_VELC_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_DIR_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_ERR_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_ENCLK_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS0_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS1_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS2_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS0REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS1REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_POS2REV_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_REV1_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_REV2_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_MAXPOS_Int_Field is Interfaces.LPC4337.Bit;
   subtype SET_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt status set register
   type SET_Register is record
      --  Write-only. Indicates that an index pulse was detected.
      INX_Int     : SET_INX_Int_Field := 16#0#;
      --  Write-only. Indicates that a velocity timer overflow occurred
      TIM_Int     : SET_TIM_Int_Field := 16#0#;
      --  Write-only. Indicates that captured velocity is less than compare
      --  velocity.
      VELC_Int    : SET_VELC_Int_Field := 16#0#;
      --  Write-only. Indicates that a change of direction was detected.
      DIR_Int     : SET_DIR_Int_Field := 16#0#;
      --  Write-only. Indicates that an encoder phase error was detected.
      ERR_Int     : SET_ERR_Int_Field := 16#0#;
      --  Write-only. Indicates that and encoder clock pulse was detected.
      ENCLK_Int   : SET_ENCLK_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 0 compare value is equal to
      --  the current position.
      POS0_Int    : SET_POS0_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 1compare value is equal to
      --  the current position.
      POS1_Int    : SET_POS1_Int_Field := 16#0#;
      --  Write-only. Indicates that the position 2 compare value is equal to
      --  the current position.
      POS2_Int    : SET_POS2_Int_Field := 16#0#;
      --  Write-only. Indicates that the index compare value is equal to the
      --  current index count.
      REV_Int     : SET_REV_Int_Field := 16#0#;
      --  Write-only. Combined position 0 and revolution count interrupt. Set
      --  when both the POS0_Int bit is set and the REV_Int is set.
      POS0REV_Int : SET_POS0REV_Int_Field := 16#0#;
      --  Write-only. Combined position 1 and revolution count interrupt. Set
      --  when both the POS1_Int bit is set and the REV_Int is set.
      POS1REV_Int : SET_POS1REV_Int_Field := 16#0#;
      --  Write-only. Combined position 2 and revolution count interrupt. Set
      --  when both the POS2_Int bit is set and the REV_Int is set.
      POS2REV_Int : SET_POS2REV_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 1 compare value is equal to the
      --  current index count.
      REV1_Int    : SET_REV1_Int_Field := 16#0#;
      --  Write-only. Indicates that the index 2 compare value is equal to the
      --  current index count.
      REV2_Int    : SET_REV2_Int_Field := 16#0#;
      --  Write-only. Indicates that the current position count goes through
      --  the MAXPOS value to zero in forward direction, or through zero to
      --  MAXPOS in backward direction.
      MAXPOS_Int  : SET_MAXPOS_Int_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED    : SET_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_Register use record
      INX_Int     at 0 range 0 .. 0;
      TIM_Int     at 0 range 1 .. 1;
      VELC_Int    at 0 range 2 .. 2;
      DIR_Int     at 0 range 3 .. 3;
      ERR_Int     at 0 range 4 .. 4;
      ENCLK_Int   at 0 range 5 .. 5;
      POS0_Int    at 0 range 6 .. 6;
      POS1_Int    at 0 range 7 .. 7;
      POS2_Int    at 0 range 8 .. 8;
      REV_Int     at 0 range 9 .. 9;
      POS0REV_Int at 0 range 10 .. 10;
      POS1REV_Int at 0 range 11 .. 11;
      POS2REV_Int at 0 range 12 .. 12;
      REV1_Int    at 0 range 13 .. 13;
      REV2_Int    at 0 range 14 .. 14;
      MAXPOS_Int  at 0 range 15 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Quadrature Encoder Interface (QEI)
   type QEI_Peripheral is record
      --  Control register
      CON       : aliased CON_Register;
      --  Encoder status register
      STAT      : aliased STAT_Register;
      --  Configuration register
      CONF      : aliased CONF_Register;
      --  Position register
      POS       : aliased Interfaces.LPC4337.UInt32;
      --  Maximum position register
      MAXPOS    : aliased Interfaces.LPC4337.UInt32;
      --  position compare register 0
      CMPOS0    : aliased Interfaces.LPC4337.UInt32;
      --  position compare register 1
      CMPOS1    : aliased Interfaces.LPC4337.UInt32;
      --  position compare register 2
      CMPOS2    : aliased Interfaces.LPC4337.UInt32;
      --  Index count register
      INXCNT    : aliased Interfaces.LPC4337.UInt32;
      --  Index compare register 0
      INXCMP0   : aliased Interfaces.LPC4337.UInt32;
      --  Velocity timer reload register
      LOAD      : aliased Interfaces.LPC4337.UInt32;
      --  Velocity timer register
      TIME      : aliased Interfaces.LPC4337.UInt32;
      --  Velocity counter register
      VEL       : aliased Interfaces.LPC4337.UInt32;
      --  Velocity capture register
      CAP       : aliased Interfaces.LPC4337.UInt32;
      --  Velocity compare register
      VELCOMP   : aliased Interfaces.LPC4337.UInt32;
      --  Digital filter register on input phase A (QEI_A)
      FILTERPHA : aliased Interfaces.LPC4337.UInt32;
      --  Digital filter register on input phase B (QEI_B)
      FILTERPHB : aliased Interfaces.LPC4337.UInt32;
      --  Digital filter register on input index (QEI_IDX)
      FILTERINX : aliased Interfaces.LPC4337.UInt32;
      --  Index acceptance window register
      WINDOW    : aliased Interfaces.LPC4337.UInt32;
      --  Index compare register 1
      INXCMP1   : aliased Interfaces.LPC4337.UInt32;
      --  Index compare register 2
      INXCMP2   : aliased Interfaces.LPC4337.UInt32;
      --  Interrupt enable clear register
      IEC       : aliased IEC_Register;
      --  Interrupt enable set register
      IES       : aliased IES_Register;
      --  Interrupt status register
      INTSTAT   : aliased INTSTAT_Register;
      --  Interrupt enable register
      IE        : aliased IE_Register;
      --  Interrupt status clear register
      CLR       : aliased CLR_Register;
      --  Interrupt status set register
      SET       : aliased SET_Register;
   end record
     with Volatile;

   for QEI_Peripheral use record
      CON       at 16#0# range 0 .. 31;
      STAT      at 16#4# range 0 .. 31;
      CONF      at 16#8# range 0 .. 31;
      POS       at 16#C# range 0 .. 31;
      MAXPOS    at 16#10# range 0 .. 31;
      CMPOS0    at 16#14# range 0 .. 31;
      CMPOS1    at 16#18# range 0 .. 31;
      CMPOS2    at 16#1C# range 0 .. 31;
      INXCNT    at 16#20# range 0 .. 31;
      INXCMP0   at 16#24# range 0 .. 31;
      LOAD      at 16#28# range 0 .. 31;
      TIME      at 16#2C# range 0 .. 31;
      VEL       at 16#30# range 0 .. 31;
      CAP       at 16#34# range 0 .. 31;
      VELCOMP   at 16#38# range 0 .. 31;
      FILTERPHA at 16#3C# range 0 .. 31;
      FILTERPHB at 16#40# range 0 .. 31;
      FILTERINX at 16#44# range 0 .. 31;
      WINDOW    at 16#48# range 0 .. 31;
      INXCMP1   at 16#4C# range 0 .. 31;
      INXCMP2   at 16#50# range 0 .. 31;
      IEC       at 16#FD8# range 0 .. 31;
      IES       at 16#FDC# range 0 .. 31;
      INTSTAT   at 16#FE0# range 0 .. 31;
      IE        at 16#FE4# range 0 .. 31;
      CLR       at 16#FE8# range 0 .. 31;
      SET       at 16#FEC# range 0 .. 31;
   end record;

   --  Quadrature Encoder Interface (QEI)
   QEI_Periph : aliased QEI_Peripheral
     with Import, Address => System'To_Address (16#400C6000#);

end Interfaces.LPC4337.QEI;
