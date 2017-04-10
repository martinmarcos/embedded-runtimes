--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.ADCHS is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype FLUSH_FIFO_FLUSH_Field is Interfaces.LPC4337.Bit;
   subtype FLUSH_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  Flushes FIFO
   type FLUSH_Register is record
      --  Write-only. 1= fifo is cleared
      FIFO_FLUSH : FLUSH_FIFO_FLUSH_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED   : FLUSH_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FLUSH_Register use record
      FIFO_FLUSH at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 31;
   end record;

   subtype DMA_REQ_DMA_REQ_WR_Field is Interfaces.LPC4337.Bit;
   subtype DMA_REQ_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  Set or clear DMA write request
   type DMA_REQ_Register is record
      --  1 = Dma_req_wr is set (initially used to fill second table), 0 =
      --  Dma_req_wr is cleared
      DMA_REQ_WR : DMA_REQ_DMA_REQ_WR_Field := 16#1#;
      --  Reserved.
      RESERVED   : DMA_REQ_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_REQ_Register use record
      DMA_REQ_WR at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 31;
   end record;

   subtype FIFO_STS_LEVEL_Field is Interfaces.LPC4337.UInt5;
   subtype FIFO_STS_RESERVED_Field is Interfaces.LPC4337.UInt27;

   --  Indicates FIFO fill level status
   type FIFO_STS_Register is record
      --  Read-only. 0 = FIFO is empty 1...15 = FIFO is partially full 16 =
      --  FIFO is full
      LEVEL    : FIFO_STS_LEVEL_Field;
      --  Read-only. Reserved.
      RESERVED : FIFO_STS_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFO_STS_Register use record
      LEVEL    at 0 range 0 .. 4;
      RESERVED at 0 range 5 .. 31;
   end record;

   subtype FIFO_CFG_PACKED_READ_Field is Interfaces.LPC4337.Bit;
   subtype FIFO_CFG_LEVEL_Field is Interfaces.LPC4337.UInt5;
   subtype FIFO_CFG_RESERVED_Field is Interfaces.LPC4337.UInt26;

   --  Configures FIFO fill level that triggers interrupt and packing 1 or 2
   --  samples per word.
   type FIFO_CFG_Register is record
      --  0 = one sample is packed in one 32-bit read cycle 1 = two samples are
      --  packed in one 32-bit read cycle
      PACKED_READ : FIFO_CFG_PACKED_READ_Field := 16#0#;
      --  When the FIFO contains more or equal than FIFO_LEVEL samples
      --  interrupt flag FIFO_FULL interrupt will be set and DMA_Read_Req will
      --  be raised.
      LEVEL       : FIFO_CFG_LEVEL_Field := 16#8#;
      --  Reserved
      RESERVED    : FIFO_CFG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFO_CFG_Register use record
      PACKED_READ at 0 range 0 .. 0;
      LEVEL       at 0 range 1 .. 5;
      RESERVED    at 0 range 6 .. 31;
   end record;

   subtype TRIGGER_SW_TRIGGER_Field is Interfaces.LPC4337.Bit;
   subtype TRIGGER_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  Enable software trigger to start descriptor processing
   type TRIGGER_Register is record
      --  Write-only. Auto cleared
      SW_TRIGGER : TRIGGER_SW_TRIGGER_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED   : TRIGGER_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRIGGER_Register use record
      SW_TRIGGER at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 31;
   end record;

   subtype DSCR_STS_ACT_TABLE_Field is Interfaces.LPC4337.Bit;
   subtype DSCR_STS_ACT_DESCRIPTOR_Field is Interfaces.LPC4337.UInt3;
   subtype DSCR_STS_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  Indicates active descriptor table and descriptor entry
   type DSCR_STS_Register is record
      --  0 = table 0 is active 1 = table 1 is active.
      ACT_TABLE      : DSCR_STS_ACT_TABLE_Field := 16#0#;
      --  ID of the descriptor that is active.
      ACT_DESCRIPTOR : DSCR_STS_ACT_DESCRIPTOR_Field := 16#0#;
      --  Reserved
      RESERVED       : DSCR_STS_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSCR_STS_Register use record
      ACT_TABLE      at 0 range 0 .. 0;
      ACT_DESCRIPTOR at 0 range 1 .. 3;
      RESERVED       at 0 range 4 .. 31;
   end record;

   subtype POWER_DOWN_PD_CTRL_Field is Interfaces.LPC4337.Bit;
   subtype POWER_DOWN_RESERVED_Field is Interfaces.LPC4337.UInt31;

   --  Set or clear power down mode
   type POWER_DOWN_Register is record
      --  0 = disable power down mode. Register holds value until set by
      --  writing 1 to this bit or by descriptor processor when descriptor
      --  field POWER_DOWN is set. 1 = enable power down mode. Register holds
      --  value until cleared by writing 0 to this bit or by descriptor
      --  processor when waking up RECOVERY_TIME before a conversion.
      PD_CTRL  : POWER_DOWN_PD_CTRL_Field := 16#1#;
      --  Reserved
      RESERVED : POWER_DOWN_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_DOWN_Register use record
      PD_CTRL  at 0 range 0 .. 0;
      RESERVED at 0 range 1 .. 31;
   end record;

   subtype CONFIG_TRIGGER_MASK_Field is Interfaces.LPC4337.UInt2;
   subtype CONFIG_TRIGGER_MODE_Field is Interfaces.LPC4337.UInt2;
   subtype CONFIG_TRIGGER_SYNC_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_CHANNEL_ID_EN_Field is Interfaces.LPC4337.Bit;
   subtype CONFIG_RECOVERY_TIME_Field is Interfaces.LPC4337.Byte;
   subtype CONFIG_RESERVED_Field is Interfaces.LPC4337.UInt18;

   --  Configures external trigger mode, store channel ID in FIFO and walk-up
   --  recovery time from power down.
   type CONFIG_Register is record
      --  00 = triggers off 01 = software trigger only 10 = external trigger
      --  only 11 = both triggers allowed
      TRIGGER_MASK  : CONFIG_TRIGGER_MASK_Field := 16#0#;
      --  00 = rising external trigger 01 = falling external trigger 10 = low
      --  external trigger 11 = high external trigger
      TRIGGER_MODE  : CONFIG_TRIGGER_MODE_Field := 16#0#;
      --  0 = do not synchronize external trigger input 1 = synchronize
      --  external trigger input
      TRIGGER_SYNC  : CONFIG_TRIGGER_SYNC_Field := 16#0#;
      --  0 = do not add channel ID to FIFO output data 1 = add channel ID to
      --  FIFO output data
      CHANNEL_ID_EN : CONFIG_CHANNEL_ID_EN_Field := 16#0#;
      --  ADC recovery time from power down
      RECOVERY_TIME : CONFIG_RECOVERY_TIME_Field := 16#90#;
      --  Reserved
      RESERVED      : CONFIG_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      TRIGGER_MASK  at 0 range 0 .. 1;
      TRIGGER_MODE  at 0 range 2 .. 3;
      TRIGGER_SYNC  at 0 range 4 .. 4;
      CHANNEL_ID_EN at 0 range 5 .. 5;
      RECOVERY_TIME at 0 range 6 .. 13;
      RESERVED      at 0 range 14 .. 31;
   end record;

   subtype THR_A_THR_LOW_A_Field is Interfaces.LPC4337.UInt12;
   subtype THR_A_THR_HIGH_A_Field is Interfaces.LPC4337.UInt12;
   subtype THR_A_RESERVED_Field is Interfaces.LPC4337.UInt4;

   --  Configures window comparator A levels.
   type THR_A_Register is record
      --  Low Compare Threshold Register A: Contains the lower threshold level
      --  for automatic threshold comparison for any channels linked to
      --  threshold pair A.
      THR_LOW_A      : THR_A_THR_LOW_A_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.LPC4337.UInt4 := 16#0#;
      --  High Compare Threshold Register A: Contains the upper threshold level
      --  for automatic threshold comparison for any channels linked to
      --  threshold pair A.
      THR_HIGH_A     : THR_A_THR_HIGH_A_Field := 16#FFF#;
      --  Reserved.
      RESERVED       : THR_A_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for THR_A_Register use record
      THR_LOW_A      at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      THR_HIGH_A     at 0 range 16 .. 27;
      RESERVED       at 0 range 28 .. 31;
   end record;

   subtype THR_B_THR_LOW_B_Field is Interfaces.LPC4337.UInt12;
   subtype THR_B_THR_HIGH_B_Field is Interfaces.LPC4337.UInt12;
   subtype THR_B_RESERVED_Field is Interfaces.LPC4337.UInt4;

   --  Configures window comparator B levels.
   type THR_B_Register is record
      --  Low Compare Threshold Register B: Contains the lower threshold level
      --  for automatic threshold comparison for any channels linked to
      --  threshold pair A.
      THR_LOW_B      : THR_B_THR_LOW_B_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.LPC4337.UInt4 := 16#0#;
      --  High Compare Threshold Register B: Contains the upper threshold level
      --  for automatic threshold comparison for any channels linked to
      --  threshold pair A.
      THR_HIGH_B     : THR_B_THR_HIGH_B_Field := 16#FFF#;
      --  Reserved.
      RESERVED       : THR_B_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for THR_B_Register use record
      THR_LOW_B      at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      THR_HIGH_B     at 0 range 16 .. 27;
      RESERVED       at 0 range 28 .. 31;
   end record;

   subtype LAST_SAMPLE_DONE_Field is Interfaces.LPC4337.Bit;
   subtype LAST_SAMPLE_OVERRUN_Field is Interfaces.LPC4337.Bit;
   subtype LAST_SAMPLE_THCMP_RANGE_Field is Interfaces.LPC4337.UInt2;
   subtype LAST_SAMPLE_THCMP_CROSS_Field is Interfaces.LPC4337.UInt2;
   subtype LAST_SAMPLE_SAMPLE_Field is Interfaces.LPC4337.UInt12;
   subtype LAST_SAMPLE_RESERVED_Field is Interfaces.LPC4337.UInt11;

   --  Contains last converted sample of input M [M=0..5) and result of window
   --  comparator.
   type LAST_SAMPLE_Register is record
      --  Read-only. This bit is set to 1 when an A/D conversion on this
      --  channel completes. This bit is cleared whenever this register is
      --  read.
      DONE           : LAST_SAMPLE_DONE_Field;
      --  Read-only. This bit will be set to a 1 if a new conversion on this
      --  channel completes and overwrites the previous contents of the RESULT
      --  field before it has been read - i.e. while the DONE bit is set. This
      --  bit is cleared, along with the DONE bit, whenever this register is
      --  read. This bit (in any of the registers) will cause an overrun
      --  interrupt request to be asserted if the overrun interrupt is enabled.
      OVERRUN        : LAST_SAMPLE_OVERRUN_Field;
      --  Read-only. Threshold Range Comparison result 00: In Range 01: Below
      --  Range 10: Above Range 11: Reserved
      THCMP_RANGE    : LAST_SAMPLE_THCMP_RANGE_Field;
      --  Read-only. Threshold Crossing Comparison result 00: No Threshold
      --  Crossing detected 01: Downward Threshold Crossing detected 10: Upward
      --  Threshold Crossing detected 11: Reserved
      THCMP_CROSS    : LAST_SAMPLE_THCMP_CROSS_Field;
      --  Read-only. 12-Bit value of last converted sample for this channel
      SAMPLE         : LAST_SAMPLE_SAMPLE_Field;
      --  unspecified
      Reserved_18_20 : Interfaces.LPC4337.UInt3;
      --  Read-only. Reserved
      RESERVED       : LAST_SAMPLE_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LAST_SAMPLE_Register use record
      DONE           at 0 range 0 .. 0;
      OVERRUN        at 0 range 1 .. 1;
      THCMP_RANGE    at 0 range 2 .. 3;
      THCMP_CROSS    at 0 range 4 .. 5;
      SAMPLE         at 0 range 6 .. 17;
      Reserved_18_20 at 0 range 18 .. 20;
      RESERVED       at 0 range 21 .. 31;
   end record;

   --  Contains last converted sample of input M [M=0..5) and result of window
   --  comparator.
   type LAST_SAMPLE_Registers is array (0 .. 5) of LAST_SAMPLE_Register
     with Volatile;

   --  ADC_SPEED_DGEC array element
   subtype ADC_SPEED_DGEC_Element is Interfaces.LPC4337.UInt4;

   --  ADC_SPEED_DGEC array
   type ADC_SPEED_DGEC_Field_Array is array (0 .. 5)
     of ADC_SPEED_DGEC_Element
     with Component_Size => 4, Size => 24;

   --  Type definition for ADC_SPEED_DGEC
   type ADC_SPEED_DGEC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DGEC as a value
            Val : Interfaces.LPC4337.UInt24;
         when True =>
            --  DGEC as an array
            Arr : ADC_SPEED_DGEC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 24;

   for ADC_SPEED_DGEC_Field use record
      Val at 0 range 0 .. 23;
      Arr at 0 range 0 .. 23;
   end record;

   subtype ADC_SPEED_RESERVED_Field is Interfaces.LPC4337.Byte;

   --  ADC speed control
   type ADC_SPEED_Register is record
      --  Speed0
      DGEC     : ADC_SPEED_DGEC_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : ADC_SPEED_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADC_SPEED_Register use record
      DGEC     at 0 range 0 .. 23;
      RESERVED at 0 range 24 .. 31;
   end record;

   subtype POWER_CONTROL_CRS_Field is Interfaces.LPC4337.UInt4;
   subtype POWER_CONTROL_DCINNEG_Field is Interfaces.LPC4337.UInt6;
   subtype POWER_CONTROL_DCINPOS_Field is Interfaces.LPC4337.UInt6;
   subtype POWER_CONTROL_TWOS_Field is Interfaces.LPC4337.Bit;
   subtype POWER_CONTROL_POWER_SWITCH_Field is Interfaces.LPC4337.Bit;
   subtype POWER_CONTROL_BGAP_SWITCH_Field is Interfaces.LPC4337.Bit;
   subtype POWER_CONTROL_RESERVED_Field is Interfaces.LPC4337.UInt13;

   --  Configures ADC power vs. speed, DC-in biasing, output format and power
   --  gating.
   type POWER_CONTROL_Register is record
      --  current setting for power versus speed programming
      CRS          : POWER_CONTROL_CRS_Field := 16#0#;
      --  AC-DC coupling selection 0 = No dc bias 1 = DC bias on vin_neg side
      DCINNEG      : POWER_CONTROL_DCINNEG_Field := 16#0#;
      --  AC-DC coupling selection 0 = No dc bias 1 = DC bias on vin_pos side
      DCINPOS      : POWER_CONTROL_DCINPOS_Field := 16#0#;
      --  Output data format selection 0 = offset binary 1 = two's complement
      TWOS         : POWER_CONTROL_TWOS_Field := 16#0#;
      --  0 = ADC is powered down 1 = ADC is active
      POWER_SWITCH : POWER_CONTROL_POWER_SWITCH_Field := 16#0#;
      --  0 = ADC band gap reference is powered down 1 = ADC band gap reference
      --  is active
      BGAP_SWITCH  : POWER_CONTROL_BGAP_SWITCH_Field := 16#0#;
      --  Reserved
      RESERVED     : POWER_CONTROL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_CONTROL_Register use record
      CRS          at 0 range 0 .. 3;
      DCINNEG      at 0 range 4 .. 9;
      DCINPOS      at 0 range 10 .. 15;
      TWOS         at 0 range 16 .. 16;
      POWER_SWITCH at 0 range 17 .. 17;
      BGAP_SWITCH  at 0 range 18 .. 18;
      RESERVED     at 0 range 19 .. 31;
   end record;

   subtype FIFO_OUTPUT_SAMPLE_Field is Interfaces.LPC4337.UInt12;
   subtype FIFO_OUTPUT_CHAN_ID_Field is Interfaces.LPC4337.UInt3;
   subtype FIFO_OUTPUT_EMPTY_Field is Interfaces.LPC4337.Bit;
   subtype FIFO_OUTPUT_SAMPLE2_Field is Interfaces.LPC4337.UInt12;
   subtype FIFO_OUTPUT_CHAN_ID2_Field is Interfaces.LPC4337.UInt3;
   subtype FIFO_OUTPUT_EMPTY2_Field is Interfaces.LPC4337.Bit;

   --  FIFO output mapped to 16 consecutive address locations. An output
   --  contains the value and input channel ID of one or two converted samples
   type FIFO_OUTPUT_Register is record
      --  Read-only. Value of first converted sample
      SAMPLE   : FIFO_OUTPUT_SAMPLE_Field;
      --  Read-only. Channel number of first converted sample: 000: channel _0
      --  or CHANNEL_ID_EN =0 001: channel _1 010: channel _2 011: channel _3
      --  100: channel _4 101: channel _5 110: reserved 111: recovery_ error
      CHAN_ID  : FIFO_OUTPUT_CHAN_ID_Field;
      --  Read-only. 0: FIFO not empty 1: FIFO empty
      EMPTY    : FIFO_OUTPUT_EMPTY_Field;
      --  Read-only. Value of second converted sample. This field is only valid
      --  if PACKED_READ is set else it is 0x0
      SAMPLE2  : FIFO_OUTPUT_SAMPLE2_Field;
      --  Read-only. Channel number of second converted sample This field is
      --  only valid if CHANNEL_ID_EN and PACKED_READ are set else it is 0x0
      CHAN_ID2 : FIFO_OUTPUT_CHAN_ID2_Field;
      --  Read-only. 0: FIFO not empty 1: FIFO empty and PACKED_READ is set
      EMPTY2   : FIFO_OUTPUT_EMPTY2_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFO_OUTPUT_Register use record
      SAMPLE   at 0 range 0 .. 11;
      CHAN_ID  at 0 range 12 .. 14;
      EMPTY    at 0 range 15 .. 15;
      SAMPLE2  at 0 range 16 .. 27;
      CHAN_ID2 at 0 range 28 .. 30;
      EMPTY2   at 0 range 31 .. 31;
   end record;

   --  FIFO output mapped to 16 consecutive address locations. An output
   --  contains the value and input channel ID of one or two converted samples
   type FIFO_OUTPUT_Registers is array (0 .. 15) of FIFO_OUTPUT_Register
     with Volatile;

   subtype DESCRIPTOR_CHANNEL_NR_Field is Interfaces.LPC4337.UInt3;
   subtype DESCRIPTOR_HALT_Field is Interfaces.LPC4337.Bit;
   subtype DESCRIPTOR_INTERRUPT_Field is Interfaces.LPC4337.Bit;
   subtype DESCRIPTOR_POWER_DOWN_Field is Interfaces.LPC4337.Bit;
   subtype DESCRIPTOR_BRANCH_Field is Interfaces.LPC4337.UInt2;
   subtype DESCRIPTOR_MATCH_VALUE_Field is Interfaces.LPC4337.UInt14;
   subtype DESCRIPTOR_THRESHOLD_SEL_Field is Interfaces.LPC4337.UInt2;
   subtype DESCRIPTOR_RESET_TIMER_Field is Interfaces.LPC4337.Bit;
   subtype DESCRIPTOR_RESERVED_Field is Interfaces.LPC4337.UInt6;
   subtype DESCRIPTOR_UPDATE_TABLE_Field is Interfaces.LPC4337.Bit;

   --  Table 0 descriptor n, n= 0 to 7
   type DESCRIPTOR_Register is record
      --  0: convert input 0 1: convert input 1 2: convert input 2 3: convert
      --  input 3 4: convert input 4 5: convert input 5 6,7: reserved
      CHANNEL_NR    : DESCRIPTOR_CHANNEL_NR_Field := 16#0#;
      --  0: After this descriptor continue with the next descriptor. 1: halt
      --  after this descriptor is processed. Restart at a new trigger.
      HALT          : DESCRIPTOR_HALT_Field := 16#0#;
      --  1: Raise interrupt when ADC result is available
      INTERRUPT     : DESCRIPTOR_INTERRUPT_Field := 16#0#;
      --  1: Power down after this conversion.
      POWER_DOWN    : DESCRIPTOR_POWER_DOWN_Field := 16#1#;
      --  00: Continue with next descriptor (wraps around after top). 01:
      --  Branch to the first descriptor in this table. 10: Swap tables and
      --  branch to the first descriptor of the new table. 11: reserved (do not
      --  store sample). Continue with next descriptor (wraps around after
      --  top).
      BRANCH        : DESCRIPTOR_BRANCH_Field := 16#3#;
      --  Evaluate this descriptor when descriptor timer value is equal to
      --  match value.
      MATCH_VALUE   : DESCRIPTOR_MATCH_VALUE_Field := 16#90#;
      --  Indicates which threshold comparison level register set is to be
      --  used: 00: no comparison, 01: THR_A. 10: THR_B. 11: Reserved
      THRESHOLD_SEL : DESCRIPTOR_THRESHOLD_SEL_Field := 16#0#;
      --  1: reset descriptor timer.
      RESET_TIMER   : DESCRIPTOR_RESET_TIMER_Field := 16#0#;
      --  Reserved
      RESERVED      : DESCRIPTOR_RESERVED_Field := 16#0#;
      --  1: Update table with all 8 descriptors of this table. Descriptors of
      --  this table that are written without this bit set are not updated
      --  until any descriptor of this table is written with this bit set. This
      --  field is write only. A read returns 0x0.
      UPDATE_TABLE  : DESCRIPTOR_UPDATE_TABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DESCRIPTOR_Register use record
      CHANNEL_NR    at 0 range 0 .. 2;
      HALT          at 0 range 3 .. 3;
      INTERRUPT     at 0 range 4 .. 4;
      POWER_DOWN    at 0 range 5 .. 5;
      BRANCH        at 0 range 6 .. 7;
      MATCH_VALUE   at 0 range 8 .. 21;
      THRESHOLD_SEL at 0 range 22 .. 23;
      RESET_TIMER   at 0 range 24 .. 24;
      RESERVED      at 0 range 25 .. 30;
      UPDATE_TABLE  at 0 range 31 .. 31;
   end record;

   --  Table 0 descriptor n, n= 0 to 7
   type DESCRIPTOR_Registers is array (0 .. 7) of DESCRIPTOR_Register
     with Volatile;

   subtype CLR_EN0_CEN0_Field is Interfaces.LPC4337.UInt7;
   subtype CLR_EN0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 clear mask
   type CLR_EN0_Register is record
      --  Write-only. Interrupt clear enable
      CEN0     : CLR_EN0_CEN0_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : CLR_EN0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN0_Register use record
      CEN0     at 0 range 0 .. 6;
      RESERVED at 0 range 7 .. 31;
   end record;

   subtype SET_EN0_SEN0_Field is Interfaces.LPC4337.UInt7;
   subtype SET_EN0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 set mask
   type SET_EN0_Register is record
      --  Write-only. Interrupt set enable
      SEN0     : SET_EN0_SEN0_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : SET_EN0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN0_Register use record
      SEN0     at 0 range 0 .. 6;
      RESERVED at 0 range 7 .. 31;
   end record;

   subtype MASK0_M0_Field is Interfaces.LPC4337.UInt7;
   subtype MASK0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 mask
   type MASK0_Register is record
      --  Read-only. Interrupt enable
      M0       : MASK0_M0_Field;
      --  Read-only. Reserved
      RESERVED : MASK0_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MASK0_Register use record
      M0       at 0 range 0 .. 6;
      RESERVED at 0 range 7 .. 31;
   end record;

   subtype STATUS0_FIFO_FULL_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_FIFO_EMPTY_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_FIFO_OVERFLOW_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_DSCR_DONE_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_DSCR_ERROR_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_ADC_OVF_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_ADC_UNF_Field is Interfaces.LPC4337.Bit;
   subtype STATUS0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 status. Interrupt 0 contains FIFO fill level, descriptor
   --  status and ADC range under/overflow
   type STATUS0_Register is record
      --  Read-only. 0: number of samples in FIFO less than or equal to
      --  FIFO_LEVEL 1: number of samples in FIFO is more than FIFO_LEVEL
      FIFO_FULL     : STATUS0_FIFO_FULL_Field;
      --  Read-only. 0: FIFO is not empty 1: FIFO is empty
      FIFO_EMPTY    : STATUS0_FIFO_EMPTY_Field;
      --  Read-only. FIFO was full; conversion sample is not stored and lost
      FIFO_OVERFLOW : STATUS0_FIFO_OVERFLOW_Field;
      --  Read-only. The descriptor INTERRUPT field was enabled and its sample
      --  is converted.
      DSCR_DONE     : STATUS0_DSCR_DONE_Field;
      --  Read-only. The ADC was not fully woken up when a sample was converted
      --  and the conversion results is unreliable
      DSCR_ERROR    : STATUS0_DSCR_ERROR_Field;
      --  Read-only. Converted sample value was over range of the 12 bit output
      --  code.
      ADC_OVF       : STATUS0_ADC_OVF_Field;
      --  Read-only. Converted sample value was under range of the 12 bit
      --  output code.
      ADC_UNF       : STATUS0_ADC_UNF_Field;
      --  Read-only. Reserved
      RESERVED      : STATUS0_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS0_Register use record
      FIFO_FULL     at 0 range 0 .. 0;
      FIFO_EMPTY    at 0 range 1 .. 1;
      FIFO_OVERFLOW at 0 range 2 .. 2;
      DSCR_DONE     at 0 range 3 .. 3;
      DSCR_ERROR    at 0 range 4 .. 4;
      ADC_OVF       at 0 range 5 .. 5;
      ADC_UNF       at 0 range 6 .. 6;
      RESERVED      at 0 range 7 .. 31;
   end record;

   subtype CLR_STAT0_CSTAT0_Field is Interfaces.LPC4337.UInt7;
   subtype CLR_STAT0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 clear status
   type CLR_STAT0_Register is record
      --  Write-only. Interrupt clear status
      CSTAT0   : CLR_STAT0_CSTAT0_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : CLR_STAT0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STAT0_Register use record
      CSTAT0   at 0 range 0 .. 6;
      RESERVED at 0 range 7 .. 31;
   end record;

   subtype SET_STAT0_SSTAT0_Field is Interfaces.LPC4337.UInt7;
   subtype SET_STAT0_RESERVED_Field is Interfaces.LPC4337.UInt25;

   --  Interrupt 0 set status
   type SET_STAT0_Register is record
      --  Write-only. Interrupt set status
      SSTAT0   : SET_STAT0_SSTAT0_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : SET_STAT0_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STAT0_Register use record
      SSTAT0   at 0 range 0 .. 6;
      RESERVED at 0 range 7 .. 31;
   end record;

   subtype CLR_EN1_CEN1_Field is Interfaces.LPC4337.UInt30;
   subtype CLR_EN1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 mask clear enable.
   type CLR_EN1_Register is record
      --  Write-only. Interrupt clear enable
      CEN1     : CLR_EN1_CEN1_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : CLR_EN1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_EN1_Register use record
      CEN1     at 0 range 0 .. 29;
      RESERVED at 0 range 30 .. 31;
   end record;

   subtype SET_EN1_SEN1_Field is Interfaces.LPC4337.UInt30;
   subtype SET_EN1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 mask set enable
   type SET_EN1_Register is record
      --  Write-only. Interrupt set enable
      SEN1     : SET_EN1_SEN1_Field := 16#0#;
      --  Write-only. Reserved
      RESERVED : SET_EN1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_EN1_Register use record
      SEN1     at 0 range 0 .. 29;
      RESERVED at 0 range 30 .. 31;
   end record;

   subtype MASK1_M1_Field is Interfaces.LPC4337.UInt30;
   subtype MASK1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 mask
   type MASK1_Register is record
      --  Read-only. Interrupt enable
      M1       : MASK1_M1_Field;
      --  Read-only. Reserved
      RESERVED : MASK1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MASK1_Register use record
      M1       at 0 range 0 .. 29;
      RESERVED at 0 range 30 .. 31;
   end record;

   subtype STATUS1_THCMP_BRANGE0_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE0_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS0_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS0_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_0_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_BRANGE1_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE1_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS1_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS1_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_1_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_BRANGE2_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE2_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS2_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS2_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_2_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_BRANGE3_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE3_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS3_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS3_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_3_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_BRANGE4_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE4_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS4_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS4_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_4_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_BRANGE5_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_ARANGE5_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_DCROSS5_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_THCMP_UCROSS5_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_OVERRUN_5_Field is Interfaces.LPC4337.Bit;
   subtype STATUS1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 status. Interrupt 1 contains window comparator results and
   --  register last LAST_SAMPLE[M] overrun.
   type STATUS1_Register is record
      --  Read-only. Input channel 0 result below range
      THCMP_BRANGE0 : STATUS1_THCMP_BRANGE0_Field;
      --  Read-only. Input channel 0 result above range
      THCMP_ARANGE0 : STATUS1_THCMP_ARANGE0_Field;
      --  Read-only. Input channel 0 result downward threshold crossing
      --  detected
      THCMP_DCROSS0 : STATUS1_THCMP_DCROSS0_Field;
      --  Read-only. Input channel 0 result upward threshold crossing detected
      THCMP_UCROSS0 : STATUS1_THCMP_UCROSS0_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [0] before
      --  it has been read
      OVERRUN_0     : STATUS1_OVERRUN_0_Field;
      --  Read-only. Input channel 1 result below range
      THCMP_BRANGE1 : STATUS1_THCMP_BRANGE1_Field;
      --  Read-only. Input channel 1 result above range
      THCMP_ARANGE1 : STATUS1_THCMP_ARANGE1_Field;
      --  Read-only. Input channel 1 result downward threshold crossing
      --  detected
      THCMP_DCROSS1 : STATUS1_THCMP_DCROSS1_Field;
      --  Read-only. Input channel 1 result upward threshold crossing detected
      THCMP_UCROSS1 : STATUS1_THCMP_UCROSS1_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [1] before
      --  it has been read
      OVERRUN_1     : STATUS1_OVERRUN_1_Field;
      --  Read-only. Input channel 2 result below range
      THCMP_BRANGE2 : STATUS1_THCMP_BRANGE2_Field;
      --  Read-only. Input channel 2 result above range
      THCMP_ARANGE2 : STATUS1_THCMP_ARANGE2_Field;
      --  Read-only. Input channel 2 result downward threshold crossing
      --  detected
      THCMP_DCROSS2 : STATUS1_THCMP_DCROSS2_Field;
      --  Read-only. Input channel 2 result upward threshold crossing detected
      THCMP_UCROSS2 : STATUS1_THCMP_UCROSS2_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [2] before
      --  it has been read
      OVERRUN_2     : STATUS1_OVERRUN_2_Field;
      --  Read-only. Input channel 3 result below range
      THCMP_BRANGE3 : STATUS1_THCMP_BRANGE3_Field;
      --  Read-only. Input channel 3 result above range
      THCMP_ARANGE3 : STATUS1_THCMP_ARANGE3_Field;
      --  Read-only. Input channel 3 result downward threshold crossing
      --  detected
      THCMP_DCROSS3 : STATUS1_THCMP_DCROSS3_Field;
      --  Read-only. Input channel 3 result upward threshold crossing detected
      THCMP_UCROSS3 : STATUS1_THCMP_UCROSS3_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [3] before
      --  it has been read
      OVERRUN_3     : STATUS1_OVERRUN_3_Field;
      --  Read-only. Input channel 4 result below range
      THCMP_BRANGE4 : STATUS1_THCMP_BRANGE4_Field;
      --  Read-only. Input channel 4 result above range
      THCMP_ARANGE4 : STATUS1_THCMP_ARANGE4_Field;
      --  Read-only. Input channel 4 result downward threshold crossing
      --  detected
      THCMP_DCROSS4 : STATUS1_THCMP_DCROSS4_Field;
      --  Read-only. Input channel 4 result upward threshold crossing detected
      THCMP_UCROSS4 : STATUS1_THCMP_UCROSS4_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [4] before
      --  it has been read
      OVERRUN_4     : STATUS1_OVERRUN_4_Field;
      --  Read-only. Input channel 5 result below range
      THCMP_BRANGE5 : STATUS1_THCMP_BRANGE5_Field;
      --  Read-only. Input channel 5 result above range
      THCMP_ARANGE5 : STATUS1_THCMP_ARANGE5_Field;
      --  Read-only. Input channel 5 result downward threshold crossing
      --  detected
      THCMP_DCROSS5 : STATUS1_THCMP_DCROSS5_Field;
      --  Read-only. Input channel 5 result upward threshold crossing detected
      THCMP_UCROSS5 : STATUS1_THCMP_UCROSS5_Field;
      --  Read-only. A new conversion on channel m completed and has
      --  overwritten the previous contents of register LAST_SAMPLE [5] before
      --  it has been read
      OVERRUN_5     : STATUS1_OVERRUN_5_Field;
      --  Read-only. Reserved.
      RESERVED      : STATUS1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS1_Register use record
      THCMP_BRANGE0 at 0 range 0 .. 0;
      THCMP_ARANGE0 at 0 range 1 .. 1;
      THCMP_DCROSS0 at 0 range 2 .. 2;
      THCMP_UCROSS0 at 0 range 3 .. 3;
      OVERRUN_0     at 0 range 4 .. 4;
      THCMP_BRANGE1 at 0 range 5 .. 5;
      THCMP_ARANGE1 at 0 range 6 .. 6;
      THCMP_DCROSS1 at 0 range 7 .. 7;
      THCMP_UCROSS1 at 0 range 8 .. 8;
      OVERRUN_1     at 0 range 9 .. 9;
      THCMP_BRANGE2 at 0 range 10 .. 10;
      THCMP_ARANGE2 at 0 range 11 .. 11;
      THCMP_DCROSS2 at 0 range 12 .. 12;
      THCMP_UCROSS2 at 0 range 13 .. 13;
      OVERRUN_2     at 0 range 14 .. 14;
      THCMP_BRANGE3 at 0 range 15 .. 15;
      THCMP_ARANGE3 at 0 range 16 .. 16;
      THCMP_DCROSS3 at 0 range 17 .. 17;
      THCMP_UCROSS3 at 0 range 18 .. 18;
      OVERRUN_3     at 0 range 19 .. 19;
      THCMP_BRANGE4 at 0 range 20 .. 20;
      THCMP_ARANGE4 at 0 range 21 .. 21;
      THCMP_DCROSS4 at 0 range 22 .. 22;
      THCMP_UCROSS4 at 0 range 23 .. 23;
      OVERRUN_4     at 0 range 24 .. 24;
      THCMP_BRANGE5 at 0 range 25 .. 25;
      THCMP_ARANGE5 at 0 range 26 .. 26;
      THCMP_DCROSS5 at 0 range 27 .. 27;
      THCMP_UCROSS5 at 0 range 28 .. 28;
      OVERRUN_5     at 0 range 29 .. 29;
      RESERVED      at 0 range 30 .. 31;
   end record;

   subtype CLR_STAT1_CSTAT1_Field is Interfaces.LPC4337.UInt30;
   subtype CLR_STAT1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 clear status
   type CLR_STAT1_Register is record
      --  Write-only. Interrupt clear status
      CSTAT1   : CLR_STAT1_CSTAT1_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED : CLR_STAT1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_STAT1_Register use record
      CSTAT1   at 0 range 0 .. 29;
      RESERVED at 0 range 30 .. 31;
   end record;

   subtype SET_STAT1_SSTAT1_Field is Interfaces.LPC4337.UInt30;
   subtype SET_STAT1_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Interrupt 1 set status
   type SET_STAT1_Register is record
      --  Write-only. Interrupt set status
      SSTAT1   : SET_STAT1_SSTAT1_Field := 16#0#;
      --  Write-only. Reserved.
      RESERVED : SET_STAT1_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SET_STAT1_Register use record
      SSTAT1   at 0 range 0 .. 29;
      RESERVED at 0 range 30 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  12-bit Analog-to-Digital Converter High-Speed (ADCHS)
   type ADCHS_Peripheral is record
      --  Flushes FIFO
      FLUSH         : aliased FLUSH_Register;
      --  Set or clear DMA write request
      DMA_REQ       : aliased DMA_REQ_Register;
      --  Indicates FIFO fill level status
      FIFO_STS      : aliased FIFO_STS_Register;
      --  Configures FIFO fill level that triggers interrupt and packing 1 or 2
      --  samples per word.
      FIFO_CFG      : aliased FIFO_CFG_Register;
      --  Enable software trigger to start descriptor processing
      TRIGGER       : aliased TRIGGER_Register;
      --  Indicates active descriptor table and descriptor entry
      DSCR_STS      : aliased DSCR_STS_Register;
      --  Set or clear power down mode
      POWER_DOWN    : aliased POWER_DOWN_Register;
      --  Configures external trigger mode, store channel ID in FIFO and
      --  walk-up recovery time from power down.
      CONFIG        : aliased CONFIG_Register;
      --  Configures window comparator A levels.
      THR_A         : aliased THR_A_Register;
      --  Configures window comparator B levels.
      THR_B         : aliased THR_B_Register;
      --  Contains last converted sample of input M [M=0..5) and result of
      --  window comparator.
      LAST_SAMPLE   : aliased LAST_SAMPLE_Registers;
      --  ADC speed control
      ADC_SPEED     : aliased ADC_SPEED_Register;
      --  Configures ADC power vs. speed, DC-in biasing, output format and
      --  power gating.
      POWER_CONTROL : aliased POWER_CONTROL_Register;
      --  FIFO output mapped to 16 consecutive address locations. An output
      --  contains the value and input channel ID of one or two converted
      --  samples
      FIFO_OUTPUT   : aliased FIFO_OUTPUT_Registers;
      --  Table 0 descriptor n, n= 0 to 7
      DESCRIPTOR0   : aliased DESCRIPTOR_Registers;
      --  Table 1 descriptors n, n=0 to 7
      DESCRIPTOR1   : aliased DESCRIPTOR_Registers;
      --  Interrupt 0 clear mask
      CLR_EN0       : aliased CLR_EN0_Register;
      --  Interrupt 0 set mask
      SET_EN0       : aliased SET_EN0_Register;
      --  Interrupt 0 mask
      MASK0         : aliased MASK0_Register;
      --  Interrupt 0 status. Interrupt 0 contains FIFO fill level, descriptor
      --  status and ADC range under/overflow
      STATUS0       : aliased STATUS0_Register;
      --  Interrupt 0 clear status
      CLR_STAT0     : aliased CLR_STAT0_Register;
      --  Interrupt 0 set status
      SET_STAT0     : aliased SET_STAT0_Register;
      --  Interrupt 1 mask clear enable.
      CLR_EN1       : aliased CLR_EN1_Register;
      --  Interrupt 1 mask set enable
      SET_EN1       : aliased SET_EN1_Register;
      --  Interrupt 1 mask
      MASK1         : aliased MASK1_Register;
      --  Interrupt 1 status. Interrupt 1 contains window comparator results
      --  and register last LAST_SAMPLE[M] overrun.
      STATUS1       : aliased STATUS1_Register;
      --  Interrupt 1 clear status
      CLR_STAT1     : aliased CLR_STAT1_Register;
      --  Interrupt 1 set status
      SET_STAT1     : aliased SET_STAT1_Register;
   end record
     with Volatile;

   for ADCHS_Peripheral use record
      FLUSH         at 16#0# range 0 .. 31;
      DMA_REQ       at 16#4# range 0 .. 31;
      FIFO_STS      at 16#8# range 0 .. 31;
      FIFO_CFG      at 16#C# range 0 .. 31;
      TRIGGER       at 16#10# range 0 .. 31;
      DSCR_STS      at 16#14# range 0 .. 31;
      POWER_DOWN    at 16#18# range 0 .. 31;
      CONFIG        at 16#1C# range 0 .. 31;
      THR_A         at 16#20# range 0 .. 31;
      THR_B         at 16#24# range 0 .. 31;
      LAST_SAMPLE   at 16#28# range 0 .. 191;
      ADC_SPEED     at 16#104# range 0 .. 31;
      POWER_CONTROL at 16#108# range 0 .. 31;
      FIFO_OUTPUT   at 16#200# range 0 .. 511;
      DESCRIPTOR0   at 16#300# range 0 .. 255;
      DESCRIPTOR1   at 16#320# range 0 .. 255;
      CLR_EN0       at 16#F00# range 0 .. 31;
      SET_EN0       at 16#F04# range 0 .. 31;
      MASK0         at 16#F08# range 0 .. 31;
      STATUS0       at 16#F0C# range 0 .. 31;
      CLR_STAT0     at 16#F10# range 0 .. 31;
      SET_STAT0     at 16#F14# range 0 .. 31;
      CLR_EN1       at 16#F20# range 0 .. 31;
      SET_EN1       at 16#F24# range 0 .. 31;
      MASK1         at 16#F28# range 0 .. 31;
      STATUS1       at 16#F2C# range 0 .. 31;
      CLR_STAT1     at 16#F30# range 0 .. 31;
      SET_STAT1     at 16#F34# range 0 .. 31;
   end record;

   --  12-bit Analog-to-Digital Converter High-Speed (ADCHS)
   ADCHS_Periph : aliased ADCHS_Peripheral
     with Import, Address => System'To_Address (16#400F0000#);

end Interfaces.LPC4337.ADCHS;
