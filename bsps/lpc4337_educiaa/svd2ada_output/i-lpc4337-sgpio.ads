--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.SGPIO is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Output control of output SGPIOn. All other values are reserved.
   type OUT_MUX_CFG_ENUM is
     (
      --  dout_doutm1 (1-bit mode)
      Dout_Doutm1,
      --  dout_doutm2a (2-bit mode 2a)
      Dout_Doutm2A,
      --  dout_doutm2b (2-bit mode 2b)
      Dout_Doutm2B,
      --  dout_doutm2c (2-bit mode 2c)
      Dout_Doutm2C,
      --  gpio_out (level set by GPIO_OUTREG)
      Gpio_Out_Level_Set,
      --  dout_doutm4a (4-bit mode 4a)
      Dout_Doutm4A,
      --  dout_doutm4b (4-bit mode 4b)
      Dout_Doutm4B,
      --  dout_doutm4c (4-bit mode 4c)
      Dout_Doutm4C,
      --  clk_out
      Clk_Out,
      --  dout_doutm8a (8-bit mode 8a)
      Dout_Doutm8A,
      --  dout_doutm8b (8-bit mode 8b)
      Dout_Doutm8B,
      --  dout_doutm8c (8-bit mode 8c)
      Dout_Doutm8C)
     with Size => 4;
   for OUT_MUX_CFG_ENUM use
     (Dout_Doutm1 => 0,
      Dout_Doutm2A => 1,
      Dout_Doutm2B => 2,
      Dout_Doutm2C => 3,
      Gpio_Out_Level_Set => 4,
      Dout_Doutm4A => 5,
      Dout_Doutm4B => 6,
      Dout_Doutm4C => 7,
      Clk_Out => 8,
      Dout_Doutm8A => 9,
      Dout_Doutm8B => 10,
      Dout_Doutm8C => 11);

   --  Output enable source. All other values are reserved.
   type OUT_MUX_CFG_ENUM_1 is
     (
      --  gpio_oe (state set by GPIO_OEREG)
      Gpio_Oe_State_Set_B,
      --  dout_oem1 (1-bit mode)
      Dout_Oem1_1_Bit_Mod,
      --  dout_oem2 (2-bit mode)
      Dout_Oem2_2_Bit_Mod,
      --  dout_oem4 (4-bit mode)
      Dout_Oem4_4_Bit_Mod,
      --  dout_oem8 (8-bit mode)
      Dout_Oem8_8_Bit_Mod)
     with Size => 3;
   for OUT_MUX_CFG_ENUM_1 use
     (Gpio_Oe_State_Set_B => 0,
      Dout_Oem1_1_Bit_Mod => 4,
      Dout_Oem2_2_Bit_Mod => 5,
      Dout_Oem4_4_Bit_Mod => 6,
      Dout_Oem8_8_Bit_Mod => 7);

   subtype OUT_MUX_CFG_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Pin multiplexer configuration registers.
   type OUT_MUX_CFG_Register is record
      --  Output control of output SGPIOn. All other values are reserved.
      P_OUT_CFG : OUT_MUX_CFG_ENUM := Interfaces.LPC4337.SGPIO.Dout_Doutm1;
      --  Output enable source. All other values are reserved.
      P_OE_CFG  : OUT_MUX_CFG_ENUM_1 :=
                   Interfaces.LPC4337.SGPIO.Gpio_Oe_State_Set_B;
      --  Reserved.
      RESERVED  : OUT_MUX_CFG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OUT_MUX_CFG_Register use record
      P_OUT_CFG at 0 range 0 .. 3;
      P_OE_CFG  at 0 range 4 .. 6;
      RESERVED  at 0 range 7 .. 31;
   end record;

   --  Pin multiplexer configuration registers.
   type OUT_MUX_CFG_Registers is array (0 .. 15) of OUT_MUX_CFG_Register
     with Volatile;

   --  Select clock signal.
   type SGPIO_MUX_CFG_ENUM is
     (
      --  Internal clock signal (slice)
      Internal_Clock_Signa,
      --  External clock signal (pin)
      External_Clock_Signa)
     with Size => 1;
   for SGPIO_MUX_CFG_ENUM use
     (Internal_Clock_Signa => 0,
      External_Clock_Signa => 1);

   --  Select source clock pin.
   type SGPIO_MUX_CFG_ENUM_1 is
     (
      --  SGPIO8
      Sgpio8,
      --  SGPIO9
      Sgpio9,
      --  SGPIO10
      Sgpio10,
      --  SGPIO11
      Sgpio11)
     with Size => 2;
   for SGPIO_MUX_CFG_ENUM_1 use
     (Sgpio8 => 0,
      Sgpio9 => 1,
      Sgpio10 => 2,
      Sgpio11 => 3);

   --  Select clock source slice. Note that slices D, H, O and P do not support
   --  this mode.
   type SGPIO_MUX_CFG_ENUM_2 is
     (
      --  Slice D
      Slice_D,
      --  Slice H
      Slice_H,
      --  Slice O
      Slice_O,
      --  Slice P
      Slice_P)
     with Size => 2;
   for SGPIO_MUX_CFG_ENUM_2 use
     (Slice_D => 0,
      Slice_H => 1,
      Slice_O => 2,
      Slice_P => 3);

   --  Select qualifier mode.
   type SGPIO_MUX_CFG_ENUM_3 is
     (
      --  Enable
      Enable,
      --  Disable
      Disable,
      --  Slice (see bits QUALIFIER_SLICE_MODE in this register)
      Slice_See_Bits_Qual,
      --  External SGPIO pin (SGPIO8, SGPIO9, SGPIO10, or SGPIO11)
      External_Sgpio_Pin)
     with Size => 2;
   for SGPIO_MUX_CFG_ENUM_3 use
     (Enable => 0,
      Disable => 1,
      Slice_See_Bits_Qual => 2,
      External_Sgpio_Pin => 3);

   --  Select qualifier slice.
   type SGPIO_MUX_CFG_ENUM_4 is
     (
      --  Slice A, but for slice A slice D is used.
      Slice_A,
      --  Slice H, but for slice H slice O is used.
      Slice_H,
      --  Slice I, but for slice I slice D is used.
      Slice_I,
      --  Slice P, but for slice P slice O is used.
      Slice_P)
     with Size => 2;
   for SGPIO_MUX_CFG_ENUM_4 use
     (Slice_A => 0,
      Slice_H => 1,
      Slice_I => 2,
      Slice_P => 3);

   --  Enable concatenation.
   type SGPIO_MUX_CFG_ENUM_5 is
     (
      --  External data pin
      External_Data_Pin,
      --  Concatenate data
      Concatenate_Data)
     with Size => 1;
   for SGPIO_MUX_CFG_ENUM_5 use
     (External_Data_Pin => 0,
      Concatenate_Data => 1);

   --  Select concatenation order
   type SGPIO_MUX_CFG_ENUM_6 is
     (
      --  Self-loop
      Self_Loop,
      --  2 slices
      SGPIO_MUX_CFG_ENUM_2_Slices,
      --  4 slices
      SGPIO_MUX_CFG_ENUM_4_Slices,
      --  8 slices
      SGPIO_MUX_CFG_ENUM_8_Slices)
     with Size => 2;
   for SGPIO_MUX_CFG_ENUM_6 use
     (Self_Loop => 0,
      SGPIO_MUX_CFG_ENUM_2_Slices => 1,
      SGPIO_MUX_CFG_ENUM_4_Slices => 2,
      SGPIO_MUX_CFG_ENUM_8_Slices => 3);

   subtype SGPIO_MUX_CFG_RESERVED_Field is Interfaces.LPC4337.UInt18;

   --  SGPIO multiplexer configuration registers.
   type SGPIO_MUX_CFG_Register is record
      --  Select clock signal.
      EXT_CLK_ENABLE        : SGPIO_MUX_CFG_ENUM :=
                               Interfaces.LPC4337.SGPIO.Internal_Clock_Signa;
      --  Select source clock pin.
      CLK_SOURCE_PIN_MODE   : SGPIO_MUX_CFG_ENUM_1 :=
                               Interfaces.LPC4337.SGPIO.Sgpio8;
      --  Select clock source slice. Note that slices D, H, O and P do not
      --  support this mode.
      CLK_SOURCE_SLICE_MODE : SGPIO_MUX_CFG_ENUM_2 :=
                               Interfaces.LPC4337.SGPIO.Slice_D;
      --  Select qualifier mode.
      QUALIFIER_MODE        : SGPIO_MUX_CFG_ENUM_3 :=
                               Interfaces.LPC4337.SGPIO.Enable;
      --  Select qualifier pin.
      QUALIFIER_PIN_MODE    : SGPIO_MUX_CFG_ENUM_1 :=
                               Interfaces.LPC4337.SGPIO.Sgpio8;
      --  Select qualifier slice.
      QUALIFIER_SLICE_MODE  : SGPIO_MUX_CFG_ENUM_4 :=
                               Interfaces.LPC4337.SGPIO.Slice_A;
      --  Enable concatenation.
      CONCAT_ENABLE         : SGPIO_MUX_CFG_ENUM_5 :=
                               Interfaces.LPC4337.SGPIO.External_Data_Pin;
      --  Select concatenation order
      CONCAT_ORDER          : SGPIO_MUX_CFG_ENUM_6 :=
                               Interfaces.LPC4337.SGPIO.Self_Loop;
      --  Reserved
      RESERVED              : SGPIO_MUX_CFG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SGPIO_MUX_CFG_Register use record
      EXT_CLK_ENABLE        at 0 range 0 .. 0;
      CLK_SOURCE_PIN_MODE   at 0 range 1 .. 2;
      CLK_SOURCE_SLICE_MODE at 0 range 3 .. 4;
      QUALIFIER_MODE        at 0 range 5 .. 6;
      QUALIFIER_PIN_MODE    at 0 range 7 .. 8;
      QUALIFIER_SLICE_MODE  at 0 range 9 .. 10;
      CONCAT_ENABLE         at 0 range 11 .. 11;
      CONCAT_ORDER          at 0 range 12 .. 13;
      RESERVED              at 0 range 14 .. 31;
   end record;

   --  SGPIO multiplexer configuration registers.
   type SGPIO_MUX_CFG_Registers is array (0 .. 15) of SGPIO_MUX_CFG_Register
     with Volatile;

   --  Match mode. Selects whether the match filter is active or whether data
   --  is captured.
   type SLICE_MUX_CFG_ENUM is
     (
      --  Do not match data.
      Do_Not_Match_Data,
      --  Match data.
      Match_Data)
     with Size => 1;
   for SLICE_MUX_CFG_ENUM use
     (Do_Not_Match_Data => 0,
      Match_Data => 1);

   --  Capture clock mode
   type SLICE_MUX_CFG_ENUM_1 is
     (
      --  Use rising clock edge.
      Use_Rising_Clock_Edg,
      --  Use falling clock edge.
      Use_Falling_Clock_Ed)
     with Size => 1;
   for SLICE_MUX_CFG_ENUM_1 use
     (Use_Rising_Clock_Edg => 0,
      Use_Falling_Clock_Ed => 1);

   --  Clock generation mode. Selects the clock generated by the slice counter
   --  or by an external pin or other slice as shift clock.
   type SLICE_MUX_CFG_ENUM_2 is
     (
      --  Use clock internally generated by COUNTER.
      Use_Clock_Internally,
      --  Use external clock from a pin or other slice.
      Use_External_Clock_F)
     with Size => 1;
   for SLICE_MUX_CFG_ENUM_2 use
     (Use_Clock_Internally => 0,
      Use_External_Clock_F => 1);

   --  Invert output clock
   type SLICE_MUX_CFG_ENUM_3 is
     (
      --  Normal clock.
      Normal_Clock,
      --  Inverted clock.
      Inverted_Clock)
     with Size => 1;
   for SLICE_MUX_CFG_ENUM_3 use
     (Normal_Clock => 0,
      Inverted_Clock => 1);

   --  Condition for input bit match interrupt
   type SLICE_MUX_CFG_ENUM_4 is
     (
      --  Detect rising edge.
      Detect_Rising_Edge,
      --  Detect falling edge.
      Detect_Falling_Edge,
      --  Detect LOW level.
      Detect_Low_Level,
      --  Detect HIGH level.
      Detect_High_Level)
     with Size => 2;
   for SLICE_MUX_CFG_ENUM_4 use
     (Detect_Rising_Edge => 0,
      Detect_Falling_Edge => 1,
      Detect_Low_Level => 2,
      Detect_High_Level => 3);

   --  Parallel mode
   type SLICE_MUX_CFG_ENUM_5 is
     (
      --  Shift 1 bit per clock.
      Shift_1_Bit_Per_Cloc,
      --  Shift 2 bits per clock.
      Shift_2_Bits_Per_Clo,
      --  Shift 4 bits per clock.
      Shift_4_Bits_Per_Clo,
      --  Shift 1 byte per clock.
      Shift_1_Byte_Per_Clo)
     with Size => 2;
   for SLICE_MUX_CFG_ENUM_5 use
     (Shift_1_Bit_Per_Cloc => 0,
      Shift_2_Bits_Per_Clo => 1,
      Shift_4_Bits_Per_Clo => 2,
      Shift_1_Byte_Per_Clo => 3);

   --  Inversion qualifier
   type SLICE_MUX_CFG_ENUM_6 is
     (
      --  Use normal qualifier.
      Use_Normal_Qualifier,
      --  Use inverted qualifier.
      Use_Inverted_Qualifi)
     with Size => 1;
   for SLICE_MUX_CFG_ENUM_6 use
     (Use_Normal_Qualifier => 0,
      Use_Inverted_Qualifi => 1);

   subtype SLICE_MUX_CFG_RESERVED_Field is Interfaces.LPC4337.UInt23;

   --  Slice multiplexer configuration registers.
   type SLICE_MUX_CFG_Register is record
      --  Match mode. Selects whether the match filter is active or whether
      --  data is captured.
      MATCH_MODE        : SLICE_MUX_CFG_ENUM :=
                           Interfaces.LPC4337.SGPIO.Do_Not_Match_Data;
      --  Capture clock mode
      CLK_CAPTURE_MODE  : SLICE_MUX_CFG_ENUM_1 :=
                           Interfaces.LPC4337.SGPIO.Use_Rising_Clock_Edg;
      --  Clock generation mode. Selects the clock generated by the slice
      --  counter or by an external pin or other slice as shift clock.
      CLKGEN_MODE       : SLICE_MUX_CFG_ENUM_2 :=
                           Interfaces.LPC4337.SGPIO.Use_Clock_Internally;
      --  Invert output clock
      INV_OUT_CLK       : SLICE_MUX_CFG_ENUM_3 :=
                           Interfaces.LPC4337.SGPIO.Normal_Clock;
      --  Condition for input bit match interrupt
      DATA_CAPTURE_MODE : SLICE_MUX_CFG_ENUM_4 :=
                           Interfaces.LPC4337.SGPIO.Detect_Rising_Edge;
      --  Parallel mode
      PARALLEL_MODE     : SLICE_MUX_CFG_ENUM_5 :=
                           Interfaces.LPC4337.SGPIO.Shift_1_Bit_Per_Cloc;
      --  Inversion qualifier
      INV_QUALIFIER     : SLICE_MUX_CFG_ENUM_6 :=
                           Interfaces.LPC4337.SGPIO.Use_Normal_Qualifier;
      --  Reserved.
      RESERVED          : SLICE_MUX_CFG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLICE_MUX_CFG_Register use record
      MATCH_MODE        at 0 range 0 .. 0;
      CLK_CAPTURE_MODE  at 0 range 1 .. 1;
      CLKGEN_MODE       at 0 range 2 .. 2;
      INV_OUT_CLK       at 0 range 3 .. 3;
      DATA_CAPTURE_MODE at 0 range 4 .. 5;
      PARALLEL_MODE     at 0 range 6 .. 7;
      INV_QUALIFIER     at 0 range 8 .. 8;
      RESERVED          at 0 range 9 .. 31;
   end record;

   --  Slice multiplexer configuration registers.
   type SLICE_MUX_CFG_Registers is array (0 .. 15) of SLICE_MUX_CFG_Register
     with Volatile;

   --  Slice data registers. Each time COUNT0 reaches 0x0 the register shifts loading bit 31 with data captured from DIN(n). DOUT(n) is set to REG(0)

   --  Slice data registers. Each time COUNT0 reaches 0x0 the register shifts
   --  loading bit 31 with data captured from DIN(n). DOUT(n) is set to REG(0)
   type REG_Registers is array (0 .. 15) of Interfaces.LPC4337.UInt32
     with Volatile;

   --  Slice data shadow registers. Each time POS reaches 0x0 the contents of REG_SS is exchanged with the content of REG

   --  Slice data shadow registers. Each time POS reaches 0x0 the contents of
   --  REG_SS is exchanged with the content of REG
   type REG_SS_Registers is array (0 .. 15) of Interfaces.LPC4337.UInt32
     with Volatile;

   subtype PRESET_PRESET_Field is Interfaces.LPC4337.UInt12;
   subtype PRESET_RESERVED_Field is Interfaces.LPC4337.UInt20;

   --  Reload value of COUNT0, loaded when COUNT0 reaches 0x0
   type PRESET_Register is record
      --  Counter reload value; loaded when COUNT reaches 0x0.
      PRESET   : PRESET_PRESET_Field := 16#0#;
      --  Reserved.
      RESERVED : PRESET_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRESET_Register use record
      PRESET   at 0 range 0 .. 11;
      RESERVED at 0 range 12 .. 31;
   end record;

   --  Reload value of COUNT0, loaded when COUNT0 reaches 0x0
   type PRESET_Registers is array (0 .. 15) of PRESET_Register
     with Volatile;

   subtype COUNT_COUNT_Field is Interfaces.LPC4337.UInt12;
   subtype COUNT_RESERVED_Field is Interfaces.LPC4337.UInt20;

   --  Down counter, counts down each clock cycle.
   type COUNT_Register is record
      --  Down counter, counts down each shift clock cycle. Next count after
      --  0x0 is PRESET.
      COUNT    : COUNT_COUNT_Field := 16#0#;
      --  Reserved.
      RESERVED : COUNT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COUNT_Register use record
      COUNT    at 0 range 0 .. 11;
      RESERVED at 0 range 12 .. 31;
   end record;

   --  Down counter, counts down each clock cycle.
   type COUNT_Registers is array (0 .. 15) of COUNT_Register
     with Volatile;

   subtype POS_POS_Field is Interfaces.LPC4337.Byte;
   subtype POS_POS_RESET_Field is Interfaces.LPC4337.Byte;
   subtype POS_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Each time COUNT0 reaches 0x0 POS counts down.
   type POS_Register is record
      --  Each time COUNT reaches 0x0 POS counts down.
      POS       : POS_POS_Field := 16#0#;
      --  Reload value for POS after POS reaches 0x0.
      POS_RESET : POS_POS_RESET_Field := 16#0#;
      --  Reserved.
      RESERVED  : POS_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POS_Register use record
      POS       at 0 range 0 .. 7;
      POS_RESET at 0 range 8 .. 15;
      RESERVED  at 0 range 16 .. 31;
   end record;

   --  Each time COUNT0 reaches 0x0 POS counts down.
   type POS_Registers is array (0 .. 15) of POS_Register
     with Volatile;

   subtype GPIO_INREG_GPIO_INi_Field is Interfaces.LPC4337.UInt16;
   subtype GPIO_INREG_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  GPIO input status register
   type GPIO_INREG_Register is record
      --  Read-only. Bit i reflects the input state of SGPIO pin i . 0 = LOW 1
      --  = HIGH
      GPIO_INi : GPIO_INREG_GPIO_INi_Field;
      --  Read-only. Reserved.
      RESERVED : GPIO_INREG_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_INREG_Register use record
      GPIO_INi at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype GPIO_OUTREG_GPIO_OUT_Field is Interfaces.LPC4337.UInt16;
   subtype GPIO_OUTREG_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  GPIO output control register
   type GPIO_OUTREG_Register is record
      --  GPIO output register. Bit i sets the output of SGPIO pin i. 0 = LOW 1
      --  = HIGH
      GPIO_OUT : GPIO_OUTREG_GPIO_OUT_Field := 16#0#;
      --  Reserved.
      RESERVED : GPIO_OUTREG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_OUTREG_Register use record
      GPIO_OUT at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype GPIO_OENREG_GPIO_OE_Field is Interfaces.LPC4337.UInt16;
   subtype GPIO_OENREG_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  GPIO OE control register
   type GPIO_OENREG_Register is record
      --  Bit i selects the output enable state of SGPIO pin i. 0 = GPIO output
      --  i is tri-stated . 1 = GPIO output i is active.
      GPIO_OE  : GPIO_OENREG_GPIO_OE_Field := 16#0#;
      --  Reserved.
      RESERVED : GPIO_OENREG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_OENREG_Register use record
      GPIO_OE  at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype CTRL_ENABLE_CTRL_EN_Field is Interfaces.LPC4337.UInt16;
   subtype CTRL_ENABLE_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Enables the slice COUNT counter
   type CTRL_ENABLE_Register is record
      --  Slice count enable. Bit n controls slice n (0 = slice A, ..., 15 =
      --  slice P). 0 = Disables slice shift clock. 1 = Starts COUNTn or
      --  external shift clock.
      CTRL_EN  : CTRL_ENABLE_CTRL_EN_Field := 16#0#;
      --  Reserved.
      RESERVED : CTRL_ENABLE_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_ENABLE_Register use record
      CTRL_EN  at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype CTRL_DISABLE_CTRL_DIS_Field is Interfaces.LPC4337.UInt16;
   subtype CTRL_DISABLE_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Disables the slice POS counter
   type CTRL_DISABLE_Register is record
      --  Slice count disable. Bit n controls slice n, (0 = slice A, ..., 15 =
      --  slice P). 0 = Enables COUNT and POS counters. The counters start
      --  counting when the CTRL_EN bit or bits are set in the CTRL_ENABLED
      --  register. 1 = Disables POS counter of slice n.
      CTRL_DIS : CTRL_DISABLE_CTRL_DIS_Field := 16#0#;
      --  Reserved.
      RESERVED : CTRL_DISABLE_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_DISABLE_Register use record
      CTRL_DIS at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype CLR_EN_0_CLR_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_EN_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt clear mask
   type CLR_EN_0_Register is record
      --  Write-only. 1 = Shift clock interrupt clear mask of slice n.
      CLR_SCI  : CLR_EN_0_CLR_SCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED : CLR_EN_0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN_0_Register use record
      CLR_SCI  at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype SET_EN_0_SET_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_EN_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt set mask
   type SET_EN_0_Register is record
      --  Write-only. 1 = Shift clock interrupt set mask of slice n.
      SET_SCI  : SET_EN_0_SET_SCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED : SET_EN_0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN_0_Register use record
      SET_SCI  at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype ENABLE_0_ENABLE_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype ENABLE_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt enable
   type ENABLE_0_Register is record
      --  Read-only. 1 = Shift clock interrupt enable of slice n.
      ENABLE_SCI : ENABLE_0_ENABLE_SCI_Field;
      --  Read-only. Reserved.
      RESERVED   : ENABLE_0_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_0_Register use record
      ENABLE_SCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype STATUS_0_STATUS_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype STATUS_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt status
   type STATUS_0_Register is record
      --  Read-only. Shift clock interrupt status of slice n.
      STATUS_SCI : STATUS_0_STATUS_SCI_Field;
      --  Read-only. Reserved.
      RESERVED   : STATUS_0_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_0_Register use record
      STATUS_SCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype CLR_STATUS_0_CLR_STATUS_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_STATUS_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt clear status
   type CLR_STATUS_0_Register is record
      --  Write-only. Shift clock interrupt clear status of slice n.
      CLR_STATUS_SCI : CLR_STATUS_0_CLR_STATUS_SCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : CLR_STATUS_0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STATUS_0_Register use record
      CLR_STATUS_SCI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype SET_STATUS_0_SET_STATUS_SCI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_STATUS_0_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Shift clock interrupt set status
   type SET_STATUS_0_Register is record
      --  Write-only. Shift clock interrupt set status of slice n.
      SET_STATUS_SCI : SET_STATUS_0_SET_STATUS_SCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : SET_STATUS_0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STATUS_0_Register use record
      SET_STATUS_SCI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype CLR_EN_1_CLR_EN_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_EN_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt clear mask
   type CLR_EN_1_Register is record
      --  Write-only. 1 = Exchange clock interrupt clear mask of slice n.
      CLR_EN_CCI : CLR_EN_1_CLR_EN_CCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED   : CLR_EN_1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN_1_Register use record
      CLR_EN_CCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype SET_EN_1_SET_EN_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_EN_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt set mask
   type SET_EN_1_Register is record
      --  Write-only. 1 = Exchange clock interrupt set mask of slice n.
      SET_EN_CCI : SET_EN_1_SET_EN_CCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED   : SET_EN_1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN_1_Register use record
      SET_EN_CCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype ENABLE_1_ENABLE_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype ENABLE_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt enable
   type ENABLE_1_Register is record
      --  Read-only. Exchange clock interrupt enable of slice n.
      ENABLE_CCI : ENABLE_1_ENABLE_CCI_Field;
      --  Read-only. Reserved.
      RESERVED   : ENABLE_1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_1_Register use record
      ENABLE_CCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype STATUS_1_STATUS_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype STATUS_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt status
   type STATUS_1_Register is record
      --  Read-only. Exchange clock interrupt status of slice n.
      STATUS_CCI : STATUS_1_STATUS_CCI_Field;
      --  Read-only. Reserved.
      RESERVED   : STATUS_1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_1_Register use record
      STATUS_CCI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype CLR_STATUS_1_CLR_STATUS_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_STATUS_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt clear status
   type CLR_STATUS_1_Register is record
      --  Write-only. Exchange clock interrupt clear status of slice n.
      CLR_STATUS_CCI : CLR_STATUS_1_CLR_STATUS_CCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : CLR_STATUS_1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STATUS_1_Register use record
      CLR_STATUS_CCI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype SET_STATUS_1_SET_STATUS_CCI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_STATUS_1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Exchange clock interrupt set status
   type SET_STATUS_1_Register is record
      --  Write-only. Exchange clock interrupt set status of slice n.
      SET_STATUS_CCI : SET_STATUS_1_SET_STATUS_CCI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : SET_STATUS_1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STATUS_1_Register use record
      SET_STATUS_CCI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype CLR_EN_2_CLR_EN2_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_EN_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt clear mask
   type CLR_EN_2_Register is record
      --  Write-only. 1 = Match interrupt clear mask of slice n.
      CLR_EN2_PMI : CLR_EN_2_CLR_EN2_PMI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED    : CLR_EN_2_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN_2_Register use record
      CLR_EN2_PMI at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype SET_EN_2_SET_EN_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_EN_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt set mask
   type SET_EN_2_Register is record
      --  Write-only. 1 = Match interrupt set mask of slice n.
      SET_EN_PMI : SET_EN_2_SET_EN_PMI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED   : SET_EN_2_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN_2_Register use record
      SET_EN_PMI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype ENABLE_2_ENABLE_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype ENABLE_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt enable
   type ENABLE_2_Register is record
      --  Read-only. Match interrupt enable of slice n.
      ENABLE_PMI : ENABLE_2_ENABLE_PMI_Field;
      --  Read-only. Reserved.
      RESERVED   : ENABLE_2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_2_Register use record
      ENABLE_PMI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype STATUS_2_STATUS_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype STATUS_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt status
   type STATUS_2_Register is record
      --  Read-only. Match interrupt status of slice n.
      STATUS_PMI : STATUS_2_STATUS_PMI_Field;
      --  Read-only. Reserved.
      RESERVED   : STATUS_2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_2_Register use record
      STATUS_PMI at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype CLR_STATUS_2_CLR_STATUS_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_STATUS_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt clear status
   type CLR_STATUS_2_Register is record
      --  Write-only. Match interrupt clear status of slice n.
      CLR_STATUS_PMI : CLR_STATUS_2_CLR_STATUS_PMI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : CLR_STATUS_2_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STATUS_2_Register use record
      CLR_STATUS_PMI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype SET_STATUS_2_SET_STATUS_PMI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_STATUS_2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Pattern match interrupt set status
   type SET_STATUS_2_Register is record
      --  Write-only. Match interrupt set status of slice n.
      SET_STATUS_PMI : SET_STATUS_2_SET_STATUS_PMI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED       : SET_STATUS_2_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STATUS_2_Register use record
      SET_STATUS_PMI at 0 range 0 .. 15;
      RESERVED       at 0 range 16 .. 31;
   end record;

   subtype CLR_EN_3_CLR_EN_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_EN_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input interrupt clear mask
   type CLR_EN_3_Register is record
      --  Write-only. 1 = Input interrupt clear mask of slice n.
      CLR_EN_INPI : CLR_EN_3_CLR_EN_INPI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED    : CLR_EN_3_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN_3_Register use record
      CLR_EN_INPI at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype SET_EN_3_SET_EN_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_EN_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input bit match interrupt set mask
   type SET_EN_3_Register is record
      --  Write-only. 1 = Input interrupt set mask of slice n.
      SET_EN_INPI : SET_EN_3_SET_EN_INPI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED    : SET_EN_3_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN_3_Register use record
      SET_EN_INPI at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype ENABLE_3_ENABLE3_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype ENABLE_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input bit match interrupt enable
   type ENABLE_3_Register is record
      --  Read-only. Input interrupt enable of slice n.
      ENABLE3_INPI : ENABLE_3_ENABLE3_INPI_Field;
      --  Read-only. Reserved.
      RESERVED     : ENABLE_3_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_3_Register use record
      ENABLE3_INPI at 0 range 0 .. 15;
      RESERVED     at 0 range 16 .. 31;
   end record;

   subtype STATUS_3_STATUS_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype STATUS_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input bit match interrupt status
   type STATUS_3_Register is record
      --  Read-only. Input interrupt status of slice n.
      STATUS_INPI : STATUS_3_STATUS_INPI_Field;
      --  Read-only. Reserved.
      RESERVED    : STATUS_3_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_3_Register use record
      STATUS_INPI at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype CLR_STATUS_3_CLR_STATUS_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype CLR_STATUS_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input bit match interrupt clear status
   type CLR_STATUS_3_Register is record
      --  Write-only. Input interrupt clear status of slice n.
      CLR_STATUS_INPI : CLR_STATUS_3_CLR_STATUS_INPI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED        : CLR_STATUS_3_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STATUS_3_Register use record
      CLR_STATUS_INPI at 0 range 0 .. 15;
      RESERVED        at 0 range 16 .. 31;
   end record;

   subtype SET_STATUS_3_SET_STATUS_INPI_Field is Interfaces.LPC4337.UInt16;
   subtype SET_STATUS_3_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Input bit match interrupt set status
   type SET_STATUS_3_Register is record
      --  Write-only. Shift interrupt set status of slice n.
      SET_STATUS_INPI : SET_STATUS_3_SET_STATUS_INPI_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED        : SET_STATUS_3_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STATUS_3_Register use record
      SET_STATUS_INPI at 0 range 0 .. 15;
      RESERVED        at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Serial GPIO (SGPIO)
   type SGPIO_Peripheral is record
      --  Pin multiplexer configuration registers.
      OUT_MUX_CFG   : aliased OUT_MUX_CFG_Registers;
      --  SGPIO multiplexer configuration registers.
      SGPIO_MUX_CFG : aliased SGPIO_MUX_CFG_Registers;
      --  Slice multiplexer configuration registers.
      SLICE_MUX_CFG : aliased SLICE_MUX_CFG_Registers;
      --  Slice data registers. Each time COUNT0 reaches 0x0 the register
      --  shifts loading bit 31 with data captured from DIN(n). DOUT(n) is set
      --  to REG(0)
      REG           : aliased REG_Registers;
      --  Slice data shadow registers. Each time POS reaches 0x0 the contents
      --  of REG_SS is exchanged with the content of REG
      REG_SS        : aliased REG_SS_Registers;
      --  Reload value of COUNT0, loaded when COUNT0 reaches 0x0
      PRESET        : aliased PRESET_Registers;
      --  Down counter, counts down each clock cycle.
      COUNT         : aliased COUNT_Registers;
      --  Each time COUNT0 reaches 0x0 POS counts down.
      POS           : aliased POS_Registers;
      --  Mask for pattern match function of slice A
      MASK_A        : aliased Interfaces.LPC4337.UInt32;
      --  Mask for pattern match function of slice H
      MASK_H        : aliased Interfaces.LPC4337.UInt32;
      --  Mask for pattern match function of slice I
      MASK_I        : aliased Interfaces.LPC4337.UInt32;
      --  Mask for pattern match function of slice P
      MASK_P        : aliased Interfaces.LPC4337.UInt32;
      --  GPIO input status register
      GPIO_INREG    : aliased GPIO_INREG_Register;
      --  GPIO output control register
      GPIO_OUTREG   : aliased GPIO_OUTREG_Register;
      --  GPIO OE control register
      GPIO_OENREG   : aliased GPIO_OENREG_Register;
      --  Enables the slice COUNT counter
      CTRL_ENABLE   : aliased CTRL_ENABLE_Register;
      --  Disables the slice POS counter
      CTRL_DISABLE  : aliased CTRL_DISABLE_Register;
      --  Shift clock interrupt clear mask
      CLR_EN_0      : aliased CLR_EN_0_Register;
      --  Shift clock interrupt set mask
      SET_EN_0      : aliased SET_EN_0_Register;
      --  Shift clock interrupt enable
      ENABLE_0      : aliased ENABLE_0_Register;
      --  Shift clock interrupt status
      STATUS_0      : aliased STATUS_0_Register;
      --  Shift clock interrupt clear status
      CLR_STATUS_0  : aliased CLR_STATUS_0_Register;
      --  Shift clock interrupt set status
      SET_STATUS_0  : aliased SET_STATUS_0_Register;
      --  Exchange clock interrupt clear mask
      CLR_EN_1      : aliased CLR_EN_1_Register;
      --  Exchange clock interrupt set mask
      SET_EN_1      : aliased SET_EN_1_Register;
      --  Exchange clock interrupt enable
      ENABLE_1      : aliased ENABLE_1_Register;
      --  Exchange clock interrupt status
      STATUS_1      : aliased STATUS_1_Register;
      --  Exchange clock interrupt clear status
      CLR_STATUS_1  : aliased CLR_STATUS_1_Register;
      --  Exchange clock interrupt set status
      SET_STATUS_1  : aliased SET_STATUS_1_Register;
      --  Pattern match interrupt clear mask
      CLR_EN_2      : aliased CLR_EN_2_Register;
      --  Pattern match interrupt set mask
      SET_EN_2      : aliased SET_EN_2_Register;
      --  Pattern match interrupt enable
      ENABLE_2      : aliased ENABLE_2_Register;
      --  Pattern match interrupt status
      STATUS_2      : aliased STATUS_2_Register;
      --  Pattern match interrupt clear status
      CLR_STATUS_2  : aliased CLR_STATUS_2_Register;
      --  Pattern match interrupt set status
      SET_STATUS_2  : aliased SET_STATUS_2_Register;
      --  Input interrupt clear mask
      CLR_EN_3      : aliased CLR_EN_3_Register;
      --  Input bit match interrupt set mask
      SET_EN_3      : aliased SET_EN_3_Register;
      --  Input bit match interrupt enable
      ENABLE_3      : aliased ENABLE_3_Register;
      --  Input bit match interrupt status
      STATUS_3      : aliased STATUS_3_Register;
      --  Input bit match interrupt clear status
      CLR_STATUS_3  : aliased CLR_STATUS_3_Register;
      --  Input bit match interrupt set status
      SET_STATUS_3  : aliased SET_STATUS_3_Register;
   end record
     with Volatile;

   for SGPIO_Peripheral use record
      OUT_MUX_CFG   at 16#0# range 0 .. 511;
      SGPIO_MUX_CFG at 16#40# range 0 .. 511;
      SLICE_MUX_CFG at 16#80# range 0 .. 511;
      REG           at 16#C0# range 0 .. 511;
      REG_SS        at 16#100# range 0 .. 511;
      PRESET        at 16#140# range 0 .. 511;
      COUNT         at 16#180# range 0 .. 511;
      POS           at 16#1C0# range 0 .. 511;
      MASK_A        at 16#200# range 0 .. 31;
      MASK_H        at 16#204# range 0 .. 31;
      MASK_I        at 16#208# range 0 .. 31;
      MASK_P        at 16#20C# range 0 .. 31;
      GPIO_INREG    at 16#210# range 0 .. 31;
      GPIO_OUTREG   at 16#214# range 0 .. 31;
      GPIO_OENREG   at 16#218# range 0 .. 31;
      CTRL_ENABLE   at 16#21C# range 0 .. 31;
      CTRL_DISABLE  at 16#220# range 0 .. 31;
      CLR_EN_0      at 16#F00# range 0 .. 31;
      SET_EN_0      at 16#F04# range 0 .. 31;
      ENABLE_0      at 16#F08# range 0 .. 31;
      STATUS_0      at 16#F0C# range 0 .. 31;
      CLR_STATUS_0  at 16#F10# range 0 .. 31;
      SET_STATUS_0  at 16#F14# range 0 .. 31;
      CLR_EN_1      at 16#F20# range 0 .. 31;
      SET_EN_1      at 16#F24# range 0 .. 31;
      ENABLE_1      at 16#F28# range 0 .. 31;
      STATUS_1      at 16#F2C# range 0 .. 31;
      CLR_STATUS_1  at 16#F30# range 0 .. 31;
      SET_STATUS_1  at 16#F34# range 0 .. 31;
      CLR_EN_2      at 16#F40# range 0 .. 31;
      SET_EN_2      at 16#F44# range 0 .. 31;
      ENABLE_2      at 16#F48# range 0 .. 31;
      STATUS_2      at 16#F4C# range 0 .. 31;
      CLR_STATUS_2  at 16#F50# range 0 .. 31;
      SET_STATUS_2  at 16#F54# range 0 .. 31;
      CLR_EN_3      at 16#F60# range 0 .. 31;
      SET_EN_3      at 16#F64# range 0 .. 31;
      ENABLE_3      at 16#F68# range 0 .. 31;
      STATUS_3      at 16#F6C# range 0 .. 31;
      CLR_STATUS_3  at 16#F70# range 0 .. 31;
      SET_STATUS_3  at 16#F74# range 0 .. 31;
   end record;

   --  Serial GPIO (SGPIO)
   SGPIO_Periph : aliased SGPIO_Peripheral
     with Import, Address => System'To_Address (16#40101000#);

end Interfaces.LPC4337.SGPIO;
