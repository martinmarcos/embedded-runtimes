--
--  Copyright (C) 2017, AdaCore
--

--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.LPC4337.C_CAN1 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Initialization
   type CNTL_ENUM is
     (
      --  Normal operation.
      Normal_Operation,
      --  Initialization is started. On reset, software needs to initialize the
      --  CAN controller.
      Initialization_Is_St)
     with Size => 1;
   for CNTL_ENUM use
     (Normal_Operation => 0,
      Initialization_Is_St => 1);

   --  Module interrupt enable
   type CNTL_ENUM_1 is
     (
      --  Disable CAN interrupts. The interrupt line is always HIGH.
      Disable_Can_Interrup,
      --  Enable CAN interrupts. The interrupt line is set to LOW and remains
      --  LOW until all pending interrupts are cleared.
      Enable_Can_Interrupt)
     with Size => 1;
   for CNTL_ENUM_1 use
     (Disable_Can_Interrup => 0,
      Enable_Can_Interrupt => 1);

   --  Status change interrupt enable
   type CNTL_ENUM_2 is
     (
      --  Disable status change interrupts. No status change interrupt will be
      --  generated.
      Disable_Status_Chang,
      --  Enable status change interrupts. A status change interrupt will be
      --  generated when a message transfer is successfully completed or a CAN
      --  bus error is detected.
      Enable_Status_Change)
     with Size => 1;
   for CNTL_ENUM_2 use
     (Disable_Status_Chang => 0,
      Enable_Status_Change => 1);

   --  Error interrupt enable
   type CNTL_ENUM_3 is
     (
      --  Disable error interrupt. No error status interrupt will be generated.
      Disable_Error_Interr,
      --  Enable error interrupt. A change in the bits BOFF or EWARN in the
      --  CANSTAT registers will generate an interrupt.
      Enable_Error_Interru)
     with Size => 1;
   for CNTL_ENUM_3 use
     (Disable_Error_Interr => 0,
      Enable_Error_Interru => 1);

   subtype CNTL_RESERVED_Field is Interfaces.LPC4337.Bit;

   --  Disable automatic retransmission
   type CNTL_ENUM_4 is
     (
      --  Automatic retransmission of disturbed messages enabled.
      Enabled,
      --  Automatic retransmission disabled.
      Disabled)
     with Size => 1;
   for CNTL_ENUM_4 use
     (Enabled => 0,
      Disabled => 1);

   --  Configuration change enable
   type CNTL_ENUM_5 is
     (
      --  The CPU has no write access to the bit timing register.
      The_Cpu_Has_No_Write,
      --  The CPU has write access to the CANBT register while the INIT bit is
      --  one.
      The_Cpu_Has_Write_Ac)
     with Size => 1;
   for CNTL_ENUM_5 use
     (The_Cpu_Has_No_Write => 0,
      The_Cpu_Has_Write_Ac => 1);

   --  Test mode enable
   type CNTL_ENUM_6 is
     (
      --  Normal operation.
      Normal_Operation,
      --  Test mode.
      Test_Mode)
     with Size => 1;
   for CNTL_ENUM_6 use
     (Normal_Operation => 0,
      Test_Mode => 1);

   subtype CNTL_RESERVED_Field_1 is Interfaces.LPC4337.UInt24;

   --  CAN control
   type CNTL_Register is record
      --  Initialization
      INIT       : CNTL_ENUM :=
                    Interfaces.LPC4337.C_CAN1.Initialization_Is_St;
      --  Module interrupt enable
      IE         : CNTL_ENUM_1 :=
                    Interfaces.LPC4337.C_CAN1.Disable_Can_Interrup;
      --  Status change interrupt enable
      SIE        : CNTL_ENUM_2 :=
                    Interfaces.LPC4337.C_CAN1.Disable_Status_Chang;
      --  Error interrupt enable
      EIE        : CNTL_ENUM_3 :=
                    Interfaces.LPC4337.C_CAN1.Disable_Error_Interr;
      --  reserved
      RESERVED   : CNTL_RESERVED_Field := 16#0#;
      --  Disable automatic retransmission
      DAR        : CNTL_ENUM_4 := Interfaces.LPC4337.C_CAN1.Enabled;
      --  Configuration change enable
      CCE        : CNTL_ENUM_5 :=
                    Interfaces.LPC4337.C_CAN1.The_Cpu_Has_No_Write;
      --  Test mode enable
      TEST       : CNTL_ENUM_6 := Interfaces.LPC4337.C_CAN1.Normal_Operation;
      --  reserved
      RESERVED_1 : CNTL_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNTL_Register use record
      INIT       at 0 range 0 .. 0;
      IE         at 0 range 1 .. 1;
      SIE        at 0 range 2 .. 2;
      EIE        at 0 range 3 .. 3;
      RESERVED   at 0 range 4 .. 4;
      DAR        at 0 range 5 .. 5;
      CCE        at 0 range 6 .. 6;
      TEST       at 0 range 7 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   --  Last error code Type of the last error to occur on the CAN bus.The LEC
   --  field holds a code which indicates the type of the last error to occur
   --  on the CAN bus. This field will be cleared to 0 when a message has been
   --  transferred (reception or transmission) without error. The unused code
   --  111 may be written by the CPU to check for updates.
   type STAT_ENUM is
     (
      --  No error.
      No_Error,
      --  Stuff error: More than 5 equal bits in a sequence have occurred in a
      --  part of a received message where this is not allowed.
      Stuff_Error_More_Th,
      --  Form error: A fixed format part of a received frame has the wrong
      --  format.
      Form_Error_A_Fixed,
      --  AckError: The message this CAN core transmitted was not acknowledged.
      Ackerror_The_Messag,
      --  Bit1Error: During the transmission of a message (with the exception
      --  of the arbitration field), the device wanted to send a HIGH/recessive
      --  level (bit of logical value 1), but the monitored bus value was
      --  LOW/dominant.
      Bit1Error_During_Th,
      --  Bit0Error: During the transmission of a message (or acknowledge bit,
      --  or active error flag, or overload flag), the device wanted to send a
      --  LOW/dominant level (data or identifier bit logical value 0), but the
      --  monitored Bus value was HIGH/recessive. During busoff recovery this
      --  status is set each time a sequence of 11 HIGH/recessive bits has been
      --  monitored. This enables the CPU to monitor the proceeding of the
      --  busoff recovery sequence (indicating the bus is not stuck at
      --  LOW/dominant or continuously disturbed).
      Bit0Error_During_Th,
      --  CRCError: The CRC checksum was incorrect in the message received.
      Crcerror_The_Crc_Ch,
      --  Unused: No CAN bus event was detected (written by the CPU).
      Unused_No_Can_Bus_E)
     with Size => 3;
   for STAT_ENUM use
     (No_Error => 0,
      Stuff_Error_More_Th => 1,
      Form_Error_A_Fixed => 2,
      Ackerror_The_Messag => 3,
      Bit1Error_During_Th => 4,
      Bit0Error_During_Th => 5,
      Crcerror_The_Crc_Ch => 6,
      Unused_No_Can_Bus_E => 7);

   --  Transmitted a message successfully This bit is reset by the CPU. It is
   --  never reset by the CAN controller.
   type STAT_ENUM_1 is
     (
      --  Since this bit was reset by the CPU, no message has been successfully
      --  transmitted.
      Nomsgtransfer,
      --  Since this bit was last reset by the CPU, a message has been
      --  successfully transmitted (error free and acknowledged by at least one
      --  other node).
      Msgtransfer)
     with Size => 1;
   for STAT_ENUM_1 use
     (Nomsgtransfer => 0,
      Msgtransfer => 1);

   --  Error passive
   type STAT_ENUM_2 is
     (
      --  The CAN controller is in the error active state.
      Active,
      --  The CAN controller is in the error passive state as defined in the
      --  CAN 2.0 specification.
      Passive)
     with Size => 1;
   for STAT_ENUM_2 use
     (Active => 0,
      Passive => 1);

   --  Warning status
   type STAT_ENUM_3 is
     (
      --  Both error counters are below the error warning limit of 96.
      Both_Error_Counters,
      --  At least one of the error counters in the EML has reached the error
      --  warning limit of 96.
      At_Least_One_Of_The)
     with Size => 1;
   for STAT_ENUM_3 use
     (Both_Error_Counters => 0,
      At_Least_One_Of_The => 1);

   --  Busoff status
   type STAT_ENUM_4 is
     (
      --  The CAN module is not in busoff.
      Nobusoff,
      --  The CAN controller is in busoff state.
      Busoff)
     with Size => 1;
   for STAT_ENUM_4 use
     (Nobusoff => 0,
      Busoff => 1);

   subtype STAT_RESERVED_Field is Interfaces.LPC4337.UInt24;

   --  Status register
   type STAT_Register is record
      --  Last error code Type of the last error to occur on the CAN bus.The
      --  LEC field holds a code which indicates the type of the last error to
      --  occur on the CAN bus. This field will be cleared to 0 when a message
      --  has been transferred (reception or transmission) without error. The
      --  unused code 111 may be written by the CPU to check for updates.
      LEC      : STAT_ENUM := Interfaces.LPC4337.C_CAN1.No_Error;
      --  Transmitted a message successfully This bit is reset by the CPU. It
      --  is never reset by the CAN controller.
      TXOK     : STAT_ENUM_1 := Interfaces.LPC4337.C_CAN1.Nomsgtransfer;
      --  Received a message successfully This bit is reset by the CPU. It is
      --  never reset by the CAN controller.
      RXOK     : STAT_ENUM_1 := Interfaces.LPC4337.C_CAN1.Nomsgtransfer;
      --  Error passive
      EPASS    : STAT_ENUM_2 := Interfaces.LPC4337.C_CAN1.Active;
      --  Warning status
      EWARN    : STAT_ENUM_3 := Interfaces.LPC4337.C_CAN1.Both_Error_Counters;
      --  Busoff status
      BOFF     : STAT_ENUM_4 := Interfaces.LPC4337.C_CAN1.Nobusoff;
      --  reserved
      RESERVED : STAT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      LEC      at 0 range 0 .. 2;
      TXOK     at 0 range 3 .. 3;
      RXOK     at 0 range 4 .. 4;
      EPASS    at 0 range 5 .. 5;
      EWARN    at 0 range 6 .. 6;
      BOFF     at 0 range 7 .. 7;
      RESERVED at 0 range 8 .. 31;
   end record;

   subtype EC_TEC_7_0_Field is Interfaces.LPC4337.Byte;
   subtype EC_REC_6_0_Field is Interfaces.LPC4337.UInt7;

   --  Receive error passive
   type EC_ENUM is
     (
      --  The receive counter is below the error passive level.
      Belowpassive,
      --  The receive counter has reached the error passive level as defined in
      --  the CAN2.0 specification.
      Passive)
     with Size => 1;
   for EC_ENUM use
     (Belowpassive => 0,
      Passive => 1);

   subtype EC_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Error counter
   type EC_Register is record
      --  Read-only. Transmit error counter Current value of the transmit error
      --  counter (maximum value 127)
      TEC_7_0  : EC_TEC_7_0_Field;
      --  Read-only. Receive error counter Current value of the receive error
      --  counter (maximum value 255).
      REC_6_0  : EC_REC_6_0_Field;
      --  Read-only. Receive error passive
      RP       : EC_ENUM;
      --  Read-only. Reserved
      RESERVED : EC_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EC_Register use record
      TEC_7_0  at 0 range 0 .. 7;
      REC_6_0  at 0 range 8 .. 14;
      RP       at 0 range 15 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype BT_BRP_Field is Interfaces.LPC4337.UInt6;
   subtype BT_SJW_Field is Interfaces.LPC4337.UInt2;
   subtype BT_TSEG1_Field is Interfaces.LPC4337.UInt4;
   subtype BT_TSEG2_Field is Interfaces.LPC4337.UInt3;
   subtype BT_RESERVED_Field is Interfaces.LPC4337.UInt17;

   --  Bit timing register
   type BT_Register is record
      --  Baud rate prescaler The value by which the oscillator frequency is
      --  divided for generating the bit time quanta. The bit time is built up
      --  from a multiple of this quanta. Valid values for the Baud Rate
      --  Prescaler are 0 to 63[1]. Valid programmed values are 0x01 - 0x3F[1].
      BRP      : BT_BRP_Field := 16#1#;
      --  (Re)synchronization jump width Valid programmed values are 0 to 3[1].
      SJW      : BT_SJW_Field := 16#0#;
      --  Time segment after the sample point Valid values are 0 to 7[1].
      TSEG1    : BT_TSEG1_Field := 16#3#;
      --  Time segment before the sample point Valid values are 1 to 15[1].
      TSEG2    : BT_TSEG2_Field := 16#2#;
      --  Reserved
      RESERVED : BT_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BT_Register use record
      BRP      at 0 range 0 .. 5;
      SJW      at 0 range 6 .. 7;
      TSEG1    at 0 range 8 .. 11;
      TSEG2    at 0 range 12 .. 14;
      RESERVED at 0 range 15 .. 31;
   end record;

   subtype INT_INTID15_0_Field is Interfaces.LPC4337.UInt16;
   subtype INT_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt register
   type INT_Register is record
      --  Read-only. 0x0000= No interrupt is pending 0x0001 to 0x0020 = Number
      --  of message object which caused the interrupt. 0x0021 to 0x7FFF =
      --  Unused 0x8000 = Status interrupt 0x8001 to 0xFFFF = Unused
      INTID15_0 : INT_INTID15_0_Field;
      --  Read-only. Reserved
      RESERVED  : INT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INT_Register use record
      INTID15_0 at 0 range 0 .. 15;
      RESERVED  at 0 range 16 .. 31;
   end record;

   subtype TEST_RESERVED_Field is Interfaces.LPC4337.UInt2;

   --  Basic mode
   type TEST_ENUM is
     (
      --  Basic mode disabled.
      Basic_Mode_Disabled,
      --  IF1 registers used as TX buffer, IF2 registers used as RX buffer.
      If1_Tx_IF2_RX)
     with Size => 1;
   for TEST_ENUM use
     (Basic_Mode_Disabled => 0,
      If1_Tx_IF2_RX => 1);

   --  Silent mode
   type TEST_ENUM_1 is
     (
      --  Normal operation.
      Normal_Operation,
      --  The module is in silent mode.
      Silent)
     with Size => 1;
   for TEST_ENUM_1 use
     (Normal_Operation => 0,
      Silent => 1);

   --  Loop back mode
   type TEST_ENUM_2 is
     (
      --  Loop back mode is disabled.
      Disabled,
      --  Loop back mode is enabled.
      Enabled)
     with Size => 1;
   for TEST_ENUM_2 use
     (Disabled => 0,
      Enabled => 1);

   --  Control of TD pins
   type TEST_ENUM_3 is
     (
      --  Level at the TD pin is controlled by the CAN controller. This is the
      --  value at reset.
      Level_At_The_Td_Pin,
      --  The sample point can be monitored at the TD pin.
      The_Sample_Point_Can,
      --  TD pin is driven LOW/dominant.
      Td_Pin_Is_Driven_Low,
      --  TD pin is driven HIGH/recessive.
      Td_Pin_Is_Driven_Hig)
     with Size => 2;
   for TEST_ENUM_3 use
     (Level_At_The_Td_Pin => 0,
      The_Sample_Point_Can => 1,
      Td_Pin_Is_Driven_Low => 2,
      Td_Pin_Is_Driven_Hig => 3);

   --  Monitors the actual value of the RD Pin
   type TEST_ENUM_4 is
     (
      --  The CAN bus is dominant (RD = 0).
      The_Can_Bus_Is_Domin,
      --  The CAN bus is recessive (RD = 1).
      The_Can_Bus_Is_Reces)
     with Size => 1;
   for TEST_ENUM_4 use
     (The_Can_Bus_Is_Domin => 0,
      The_Can_Bus_Is_Reces => 1);

   subtype TEST_RESERVED_Field_1 is Interfaces.LPC4337.UInt24;

   --  Test register
   type TEST_Register is record
      --  tbd.
      RESERVED   : TEST_RESERVED_Field := 16#0#;
      --  Basic mode
      BASIC      : TEST_ENUM := Interfaces.LPC4337.C_CAN1.Basic_Mode_Disabled;
      --  Silent mode
      SILENT     : TEST_ENUM_1 := Interfaces.LPC4337.C_CAN1.Normal_Operation;
      --  Loop back mode
      LBACK      : TEST_ENUM_2 := Interfaces.LPC4337.C_CAN1.Disabled;
      --  Control of TD pins
      TX1_0      : TEST_ENUM_3 :=
                    Interfaces.LPC4337.C_CAN1.Level_At_The_Td_Pin;
      --  Monitors the actual value of the RD Pin
      RX         : TEST_ENUM_4 :=
                    Interfaces.LPC4337.C_CAN1.The_Can_Bus_Is_Domin;
      --  Reserved
      RESERVED_1 : TEST_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TEST_Register use record
      RESERVED   at 0 range 0 .. 1;
      BASIC      at 0 range 2 .. 2;
      SILENT     at 0 range 3 .. 3;
      LBACK      at 0 range 4 .. 4;
      TX1_0      at 0 range 5 .. 6;
      RX         at 0 range 7 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   subtype BRPE_BRPE_Field is Interfaces.LPC4337.UInt4;
   subtype BRPE_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  Baud rate prescaler extension register
   type BRPE_Register is record
      --  Baud rate prescaler extension By programming BRPE the Baud Rate
      --  Prescaler can be extended to values up to 1023. Hardware interprets
      --  the value as the value of BRPE (MSBs) and BRP (LSBs) plus one.
      --  Allowed values are 0x00 to 0x0F
      BRPE     : BRPE_BRPE_Field := 16#0#;
      --  Reserved
      RESERVED : BRPE_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRPE_Register use record
      BRPE     at 0 range 0 .. 3;
      RESERVED at 0 range 4 .. 31;
   end record;

   subtype IF_CMDREQ_MESSNUM_Field is Interfaces.LPC4337.UInt6;
   subtype IF_CMDREQ_RESERVED_Field is Interfaces.LPC4337.UInt9;
   subtype IF_CMDREQ_BUSY_Field is Interfaces.LPC4337.Bit;
   subtype IF_CMDREQ_RESERVED_Field_1 is Interfaces.LPC4337.UInt16;

   --  Message interface command request
   type IF_CMDREQ_Register is record
      --  Message number 0x01 to 0x20 = Valid message numbers The message
      --  object in the message RAM is selected for data transfer. 0x00 = Not a
      --  valid message number. This value is interpreted as 0x20.[1] 0x21 to
      --  0x3F = Not a valid message number. This value is interpreted as 0x01
      --  - 0x1F.[1]
      MESSNUM    : IF_CMDREQ_MESSNUM_Field := 16#1#;
      --  Reserved
      RESERVED   : IF_CMDREQ_RESERVED_Field := 16#0#;
      --  BUSY flag. Set to one by hardware when writing to this Command
      --  request register. Set to zero by hardware when read/write action to
      --  this Command request register has finished.
      BUSY       : IF_CMDREQ_BUSY_Field := 16#0#;
      --  Reserved
      RESERVED_1 : IF_CMDREQ_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_CMDREQ_Register use record
      MESSNUM    at 0 range 0 .. 5;
      RESERVED   at 0 range 6 .. 14;
      BUSY       at 0 range 15 .. 15;
      RESERVED_1 at 0 range 16 .. 31;
   end record;

   --  Access data bytes 4-7
   type IF_CMDMSK_W0_ENUM is
     (
      --  data bytes 4-7 unchanged.
      Data_Bytes_4_7_Uncha,
      --  Transfer data bytes 4-7 to message object.
      Transfer_Data_Bytes)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM use
     (Data_Bytes_4_7_Uncha => 0,
      Transfer_Data_Bytes => 1);

   --  Access data bytes 0-3
   type IF_CMDMSK_W0_ENUM_1 is
     (
      --  data bytes 0-3 unchanged.
      Data_Bytes_0_3_Uncha,
      --  Transfer data bytes 0-3 to message object.
      Transfer_Data_Bytes)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM_1 use
     (Data_Bytes_0_3_Uncha => 0,
      Transfer_Data_Bytes => 1);

   --  Access transmission request bit
   type IF_CMDMSK_W0_ENUM_2 is
     (
      --  No transmission request. TXRQSRT bit unchanged in IF1/2_MCTRL. If a
      --  transmission is requested by programming this bit, the TXRQST bit in
      --  the CANIFn_MCTRL register is ignored.
      No_Transmission_Requ,
      --  Request a transmission. Set the TXRQST bit IF1/2_MCTRL.
      Request_A_Transmissi)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM_2 use
     (No_Transmission_Requ => 0,
      Request_A_Transmissi => 1);

   subtype IF_CMDMSK_W_CLRINTPND_Field is Interfaces.LPC4337.Bit;

   --  Access control bits
   type IF_CMDMSK_W0_ENUM_3 is
     (
      --  Control bits unchanged.
      Control_Bits_Unchang,
      --  Transfer control bits to message object
      Transfer_Control_Bit)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM_3 use
     (Control_Bits_Unchang => 0,
      Transfer_Control_Bit => 1);

   --  Access arbitration bits
   type IF_CMDMSK_W0_ENUM_4 is
     (
      --  Arbitration bits unchanged.
      Arbitration_Bits_Unc,
      --  Transfer Identifier, DIR, XTD, and MSGVAL bits to message object.
      Transfer_Identifier)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM_4 use
     (Arbitration_Bits_Unc => 0,
      Transfer_Identifier => 1);

   --  Access mask bits
   type IF_CMDMSK_W0_ENUM_5 is
     (
      --  Mask bits unchanged.
      Mask_Bits_Unchanged,
      --  Transfer Identifier MASK + MDIR + MXTD to message object.
      Transfer_Identifier)
     with Size => 1;
   for IF_CMDMSK_W0_ENUM_5 use
     (Mask_Bits_Unchanged => 0,
      Transfer_Identifier => 1);

   subtype IF_CMDMSK_W_WR_RD_Field is Interfaces.LPC4337.Bit;
   subtype IF_CMDMSK_W_RESERVED_Field is Interfaces.LPC4337.UInt24;

   --  Message interface command mask (write direction)
   type IF_CMDMSK_W_Register is record
      --  Access data bytes 4-7
      DATA_B    : IF_CMDMSK_W0_ENUM :=
                   Interfaces.LPC4337.C_CAN1.Data_Bytes_4_7_Uncha;
      --  Access data bytes 0-3
      DATA_A    : IF_CMDMSK_W0_ENUM_1 :=
                   Interfaces.LPC4337.C_CAN1.Data_Bytes_0_3_Uncha;
      --  Access transmission request bit
      TXRQST    : IF_CMDMSK_W0_ENUM_2 :=
                   Interfaces.LPC4337.C_CAN1.No_Transmission_Requ;
      --  This bit is ignored in the write direction.
      CLRINTPND : IF_CMDMSK_W_CLRINTPND_Field := 16#0#;
      --  Access control bits
      CTRL      : IF_CMDMSK_W0_ENUM_3 :=
                   Interfaces.LPC4337.C_CAN1.Control_Bits_Unchang;
      --  Access arbitration bits
      ARB       : IF_CMDMSK_W0_ENUM_4 :=
                   Interfaces.LPC4337.C_CAN1.Arbitration_Bits_Unc;
      --  Access mask bits
      MASK      : IF_CMDMSK_W0_ENUM_5 :=
                   Interfaces.LPC4337.C_CAN1.Mask_Bits_Unchanged;
      --  Write transfer Transfer data from the selected message buffer
      --  registers to the message object addressed by the command request
      --  register CANIFn_CMDREQ.
      WR_RD     : IF_CMDMSK_W_WR_RD_Field := 16#0#;
      --  reserved
      RESERVED  : IF_CMDMSK_W_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_CMDMSK_W_Register use record
      DATA_B    at 0 range 0 .. 0;
      DATA_A    at 0 range 1 .. 1;
      TXRQST    at 0 range 2 .. 2;
      CLRINTPND at 0 range 3 .. 3;
      CTRL      at 0 range 4 .. 4;
      ARB       at 0 range 5 .. 5;
      MASK      at 0 range 6 .. 6;
      WR_RD     at 0 range 7 .. 7;
      RESERVED  at 0 range 8 .. 31;
   end record;

   --  Access data bytes 4-7
   type IF_CMDMSK_R0_ENUM is
     (
      --  data bytes 4-7 unchanged.
      Data_Bytes_4_7_Uncha,
      --  Transfer data bytes 4-7 to IFx message buffer register.
      Transfer_Data_Bytes)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM use
     (Data_Bytes_4_7_Uncha => 0,
      Transfer_Data_Bytes => 1);

   --  Access data bytes 0-3
   type IF_CMDMSK_R0_ENUM_1 is
     (
      --  data bytes 0-3 unchanged.
      Data_Bytes_0_3_Uncha,
      --  Transfer data bytes 0-3 to IFx message buffer.
      Transfer_Data_Bytes)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_1 use
     (Data_Bytes_0_3_Uncha => 0,
      Transfer_Data_Bytes => 1);

   --  Access new data bit
   type IF_CMDMSK_R0_ENUM_2 is
     (
      --  NEWDAT bit remains unchanged. A read access to a message object can
      --  be combined with the reset of the control bits INTPND and NEWDAT in
      --  IF1/2_MCTRL. The values of these bits transferred to the IFx Message
      --  Control Register always reflect the status before resetting these
      --  bits.
      Newdat_Bit_Remains_U,
      --  Clear NEWDAT bit in the message object.
      Clear_Newdat_Bit_In)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_2 use
     (Newdat_Bit_Remains_U => 0,
      Clear_Newdat_Bit_In => 1);

   --  Clear interrupt pending bit.
   type IF_CMDMSK_R0_ENUM_3 is
     (
      --  INTPND bit remains unchanged.
      Intpnd_Bit_Remains_U,
      --  Clear INTPND bit in the message object.
      Clear_Intpnd_Bit_In)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_3 use
     (Intpnd_Bit_Remains_U => 0,
      Clear_Intpnd_Bit_In => 1);

   --  Access control bits
   type IF_CMDMSK_R0_ENUM_4 is
     (
      --  Control bits unchanged.
      Control_Bits_Unchang,
      --  Transfer control bits to IFx message buffer.
      Transfer_Control_Bit)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_4 use
     (Control_Bits_Unchang => 0,
      Transfer_Control_Bit => 1);

   --  Access arbitration bits
   type IF_CMDMSK_R0_ENUM_5 is
     (
      --  Arbitration bits unchanged.
      Arbitration_Bits_Unc,
      --  Transfer Identifier, DIR, XTD, and MSGVAL bits to IFx message buffer
      --  register.
      Transfer_Identifier)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_5 use
     (Arbitration_Bits_Unc => 0,
      Transfer_Identifier => 1);

   --  Access mask bits
   type IF_CMDMSK_R0_ENUM_6 is
     (
      --  Mask bits unchanged.
      Mask_Bits_Unchanged,
      --  Transfer Identifier MASK + MDIR + MXTD to IFx message buffer
      --  register.
      Transfer_Identifier)
     with Size => 1;
   for IF_CMDMSK_R0_ENUM_6 use
     (Mask_Bits_Unchanged => 0,
      Transfer_Identifier => 1);

   subtype IF_CMDMSK_R_WR_RD_Field is Interfaces.LPC4337.Bit;
   subtype IF_CMDMSK_R_RESERVED_Field is Interfaces.LPC4337.UInt24;

   --  Message interface command mask (read direction)
   type IF_CMDMSK_R_Register is record
      --  Access data bytes 4-7
      DATA_B    : IF_CMDMSK_R0_ENUM :=
                   Interfaces.LPC4337.C_CAN1.Data_Bytes_4_7_Uncha;
      --  Access data bytes 0-3
      DATA_A    : IF_CMDMSK_R0_ENUM_1 :=
                   Interfaces.LPC4337.C_CAN1.Data_Bytes_0_3_Uncha;
      --  Access new data bit
      NEWDAT    : IF_CMDMSK_R0_ENUM_2 :=
                   Interfaces.LPC4337.C_CAN1.Newdat_Bit_Remains_U;
      --  Clear interrupt pending bit.
      CLRINTPND : IF_CMDMSK_R0_ENUM_3 :=
                   Interfaces.LPC4337.C_CAN1.Intpnd_Bit_Remains_U;
      --  Access control bits
      CTRL      : IF_CMDMSK_R0_ENUM_4 :=
                   Interfaces.LPC4337.C_CAN1.Control_Bits_Unchang;
      --  Access arbitration bits
      ARB       : IF_CMDMSK_R0_ENUM_5 :=
                   Interfaces.LPC4337.C_CAN1.Arbitration_Bits_Unc;
      --  Access mask bits
      MASK      : IF_CMDMSK_R0_ENUM_6 :=
                   Interfaces.LPC4337.C_CAN1.Mask_Bits_Unchanged;
      --  Read transfer Transfer data from the message object addressed by the
      --  command request register to the selected message buffer registers
      --  CANIFn_CMDREQ.
      WR_RD     : IF_CMDMSK_R_WR_RD_Field := 16#0#;
      --  reserved
      RESERVED  : IF_CMDMSK_R_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_CMDMSK_R_Register use record
      DATA_B    at 0 range 0 .. 0;
      DATA_A    at 0 range 1 .. 1;
      NEWDAT    at 0 range 2 .. 2;
      CLRINTPND at 0 range 3 .. 3;
      CTRL      at 0 range 4 .. 4;
      ARB       at 0 range 5 .. 5;
      MASK      at 0 range 6 .. 6;
      WR_RD     at 0 range 7 .. 7;
      RESERVED  at 0 range 8 .. 31;
   end record;

   subtype IF_MSK_MSK15_0_Field is Interfaces.LPC4337.UInt16;
   subtype IF_MSK_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message interface mask 1
   type IF_MSK_Register is record
      --  Identifier mask 0 = The corresponding bit in the identifier of the
      --  message can not inhibit the match in the acceptance filtering. 1 =
      --  The corresponding identifier bit is used for acceptance filtering.
      MSK15_0  : IF_MSK_MSK15_0_Field := 16#FFFF#;
      --  reserved
      RESERVED : IF_MSK_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_MSK_Register use record
      MSK15_0  at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype IF_MSK_MSK28_16_Field is Interfaces.LPC4337.UInt13;
   subtype IF_MSK_RESERVED_Field_1 is Interfaces.LPC4337.Bit;

   --  Mask message direction
   type IF_MSK20_ENUM is
     (
      --  The message direction bit (DIR) has no effect on acceptance
      --  filtering.
      The_Message_Directio_1,
      --  The message direction bit (DIR) is used for acceptance filtering.
      The_Message_Directio)
     with Size => 1;
   for IF_MSK20_ENUM use
     (The_Message_Directio_1 => 0,
      The_Message_Directio => 1);

   --  Mask extend identifier
   type IF_MSK20_ENUM_1 is
     (
      --  The extended identifier bit (IDE) has no effect on acceptance
      --  filtering.
      The_Extended_Identif_1,
      --  The extended identifier bit (IDE) is used for acceptance filtering.
      The_Extended_Identif)
     with Size => 1;
   for IF_MSK20_ENUM_1 use
     (The_Extended_Identif_1 => 0,
      The_Extended_Identif => 1);

   --  Message interface 1 mask 2
   type IF_MSK_Register_1 is record
      --  Identifier mask 0 = The corresponding bit in the identifier of the
      --  message can not inhibit the match in the acceptance filtering. 1 =
      --  The corresponding identifier bit is used for acceptance filtering.
      MSK28_16   : IF_MSK_MSK28_16_Field := 16#1FFF#;
      --  Reserved
      RESERVED   : IF_MSK_RESERVED_Field_1 := 16#1#;
      --  Mask message direction
      MDIR       : IF_MSK20_ENUM :=
                    Interfaces.LPC4337.C_CAN1.The_Message_Directio;
      --  Mask extend identifier
      MXTD       : IF_MSK20_ENUM_1 :=
                    Interfaces.LPC4337.C_CAN1.The_Extended_Identif;
      --  Reserved
      RESERVED_1 : IF_MSK_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_MSK_Register_1 use record
      MSK28_16   at 0 range 0 .. 12;
      RESERVED   at 0 range 13 .. 13;
      MDIR       at 0 range 14 .. 14;
      MXTD       at 0 range 15 .. 15;
      RESERVED_1 at 0 range 16 .. 31;
   end record;

   subtype IF_ARB_ID15_0_Field is Interfaces.LPC4337.UInt16;
   subtype IF_ARB_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message interface 1 arbitration 1
   type IF_ARB_Register is record
      --  Message identifier 29-bit identifier (extended frame) 11-bit
      --  identifier (standard frame)
      ID15_0   : IF_ARB_ID15_0_Field := 16#0#;
      --  Reserved
      RESERVED : IF_ARB_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_ARB_Register use record
      ID15_0   at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype IF_ARB_ID28_16_Field is Interfaces.LPC4337.UInt13;

   --  Message direction
   type IF_ARB20_ENUM is
     (
      --  Direction = receive. On TXRQST, a Remote Frame with the identifier of
      --  this Message Object is transmitted. On reception of a Data Frame with
      --  matching identifier, that message is stored in this Message Object.
      Direction_Eq_Receive,
      --  Direction = transmit. On TXRQST, the respective Message Object is
      --  transmitted as a Data Frame. On reception of a Remote Frame with
      --  matching identifier, the TXRQST bit of this Message Object is set (if
      --  RMTEN = one).
      Direction_Eq_Transmit)
     with Size => 1;
   for IF_ARB20_ENUM use
     (Direction_Eq_Receive => 0,
      Direction_Eq_Transmit => 1);

   --  Extend identifier
   type IF_ARB20_ENUM_1 is
     (
      --  The 11-bit standard identifier will be used for this message object.
      The_11_Bit_Standard,
      --  The 29-bit extended identifier will be used for this message object.
      The_29_Bit_Extended)
     with Size => 1;
   for IF_ARB20_ENUM_1 use
     (The_11_Bit_Standard => 0,
      The_29_Bit_Extended => 1);

   --  Message valid The CPU must reset the MSGVAL bit of all unused Messages
   --  Objects during the initialization before it resets bit INIT in the CAN
   --  Control Register. This bit must also be reset before the identifier
   --  ID28:0, the control bits XTD, DIR, or the Data Length Code DLC3:0 are
   --  modified, or if the Messages Object is no longer required.
   type IF_ARB20_ENUM_2 is
     (
      --  The message object is ignored by the message handler.
      The_Message_Object_I_1,
      --  The message object is configured and should be considered by the
      --  message handler.
      The_Message_Object_I)
     with Size => 1;
   for IF_ARB20_ENUM_2 use
     (The_Message_Object_I_1 => 0,
      The_Message_Object_I => 1);

   --  Message interface 1 arbitration 2
   type IF_ARB_Register_1 is record
      --  Message identifier 29-bit identifier (extended frame) 11-bit
      --  identifier (standard frame)
      ID28_16  : IF_ARB_ID28_16_Field := 16#0#;
      --  Message direction
      DIR      : IF_ARB20_ENUM :=
                  Interfaces.LPC4337.C_CAN1.Direction_Eq_Receive;
      --  Extend identifier
      XTD      : IF_ARB20_ENUM_1 :=
                  Interfaces.LPC4337.C_CAN1.The_11_Bit_Standard;
      --  Message valid The CPU must reset the MSGVAL bit of all unused
      --  Messages Objects during the initialization before it resets bit INIT
      --  in the CAN Control Register. This bit must also be reset before the
      --  identifier ID28:0, the control bits XTD, DIR, or the Data Length Code
      --  DLC3:0 are modified, or if the Messages Object is no longer required.
      MSGVAL   : IF_ARB20_ENUM_2 :=
                  Interfaces.LPC4337.C_CAN1.The_Message_Object_I_1;
      --  Reserved
      RESERVED : IF_ARB_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_ARB_Register_1 use record
      ID28_16  at 0 range 0 .. 12;
      DIR      at 0 range 13 .. 13;
      XTD      at 0 range 14 .. 14;
      MSGVAL   at 0 range 15 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype IF_MCTRL_DLC3_0_Field is Interfaces.LPC4337.UInt4;
   subtype IF_MCTRL_RESERVED_Field is Interfaces.LPC4337.UInt3;

   --  End of buffer
   type IF_MCTRL0_ENUM is
     (
      --  Message object belongs to a FIFO buffer and is not the last message
      --  object of that FIFO buffer.
      Message_Object_Belon,
      --  Single message object or last message object of a FIFO buffer.
      Single_Message_Objec)
     with Size => 1;
   for IF_MCTRL0_ENUM use
     (Message_Object_Belon => 0,
      Single_Message_Objec => 1);

   --  Transmit request
   type IF_MCTRL0_ENUM_1 is
     (
      --  This message object is not waiting for transmission.
      Wait,
      --  The transmission of this message object is requested and is not yet
      --  done
      Request)
     with Size => 1;
   for IF_MCTRL0_ENUM_1 use
     (Wait => 0,
      Request => 1);

   --  Remote enable
   type IF_MCTRL0_ENUM_2 is
     (
      --  At the reception of a remote frame, TXRQST is left unchanged.
      Unchanged,
      --  At the reception of a remote frame, TXRQST is set.
      Txrqstset)
     with Size => 1;
   for IF_MCTRL0_ENUM_2 use
     (Unchanged => 0,
      Txrqstset => 1);

   --  Receive interrupt enable
   type IF_MCTRL0_ENUM_3 is
     (
      --  INTPND will be left unchanged after successful reception of a frame.
      Unchanged,
      --  INTPND will be set after successful reception of a frame.
      Intpndset)
     with Size => 1;
   for IF_MCTRL0_ENUM_3 use
     (Unchanged => 0,
      Intpndset => 1);

   --  Use acceptance mask If UMASK is set to 1, the message object's mask bits
   --  have to be programmed during initialization of the message object before
   --  MAGVAL is set to 1.
   type IF_MCTRL0_ENUM_4 is
     (
      --  Mask ignored.
      Mask_Ignored,
      --  Use mask (MSK[28:0], MXTD, and MDIR) for acceptance filtering.
      Use_Mask)
     with Size => 1;
   for IF_MCTRL0_ENUM_4 use
     (Mask_Ignored => 0,
      Use_Mask => 1);

   --  Interrupt pending
   type IF_MCTRL0_ENUM_5 is
     (
      --  This message object is not the source of an interrupt.
      Nointsource,
      --  This message object is the source of an interrupt. The Interrupt
      --  Identifier in the Interrupt Register will point to this message
      --  object if there is no other interrupt source with higher priority.
      Intsource)
     with Size => 1;
   for IF_MCTRL0_ENUM_5 use
     (Nointsource => 0,
      Intsource => 1);

   --  Message lost (only valid for message objects in the direction receive).
   type IF_MCTRL0_ENUM_6 is
     (
      --  No message lost since this bit was reset last by the CPU.
      No_Message_Lost_Sinc,
      --  The Message Handler stored a new message into this object when NEWDAT
      --  was still set, the CPU has lost a message.
      The_Message_Handler)
     with Size => 1;
   for IF_MCTRL0_ENUM_6 use
     (No_Message_Lost_Sinc => 0,
      The_Message_Handler => 1);

   --  New data
   type IF_MCTRL0_ENUM_7 is
     (
      --  No new data has been written into the data portion of this message
      --  object by the message handler since this flag was cleared last by the
      --  CPU.
      No_New_Data_Has_Been,
      --  The message handler or the CPU has written new data into the data
      --  portion of this message object.
      The_Message_Handler)
     with Size => 1;
   for IF_MCTRL0_ENUM_7 use
     (No_New_Data_Has_Been => 0,
      The_Message_Handler => 1);

   subtype IF_MCTRL_RESERVED_Field_1 is Interfaces.LPC4337.UInt16;

   --  Message interface 1 message control
   type IF_MCTRL_Register is record
      --  Data length code The Data Length Code of a Message Object must be
      --  defined the same as in all the corresponding objects with the same
      --  identifier at other nodes. When the Message Handler stores a data
      --  frame, it will write the DLC to the value given by the received
      --  message. 0000 to 1000 = Data frame has 0 - 8 data bytes. 1001 to 1111
      --  = Data frame has 8 data bytes.
      DLC3_0     : IF_MCTRL_DLC3_0_Field := 16#0#;
      --  reserved
      RESERVED   : IF_MCTRL_RESERVED_Field := 16#0#;
      --  End of buffer
      EOB        : IF_MCTRL0_ENUM :=
                    Interfaces.LPC4337.C_CAN1.Message_Object_Belon;
      --  Transmit request
      TXRQST     : IF_MCTRL0_ENUM_1 := Interfaces.LPC4337.C_CAN1.Wait;
      --  Remote enable
      RMTEN      : IF_MCTRL0_ENUM_2 := Interfaces.LPC4337.C_CAN1.Unchanged;
      --  Receive interrupt enable
      RXIE       : IF_MCTRL0_ENUM_3 := Interfaces.LPC4337.C_CAN1.Unchanged;
      --  Transmit interrupt enable
      TXIE       : IF_MCTRL0_ENUM_3 := Interfaces.LPC4337.C_CAN1.Unchanged;
      --  Use acceptance mask If UMASK is set to 1, the message object's mask
      --  bits have to be programmed during initialization of the message
      --  object before MAGVAL is set to 1.
      UMASK      : IF_MCTRL0_ENUM_4 := Interfaces.LPC4337.C_CAN1.Mask_Ignored;
      --  Interrupt pending
      INTPND     : IF_MCTRL0_ENUM_5 := Interfaces.LPC4337.C_CAN1.Nointsource;
      --  Message lost (only valid for message objects in the direction
      --  receive).
      MSGLST     : IF_MCTRL0_ENUM_6 :=
                    Interfaces.LPC4337.C_CAN1.No_Message_Lost_Sinc;
      --  New data
      NEWDAT     : IF_MCTRL0_ENUM_7 :=
                    Interfaces.LPC4337.C_CAN1.No_New_Data_Has_Been;
      --  Reserved
      RESERVED_1 : IF_MCTRL_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_MCTRL_Register use record
      DLC3_0     at 0 range 0 .. 3;
      RESERVED   at 0 range 4 .. 6;
      EOB        at 0 range 7 .. 7;
      TXRQST     at 0 range 8 .. 8;
      RMTEN      at 0 range 9 .. 9;
      RXIE       at 0 range 10 .. 10;
      TXIE       at 0 range 11 .. 11;
      UMASK      at 0 range 12 .. 12;
      INTPND     at 0 range 13 .. 13;
      MSGLST     at 0 range 14 .. 14;
      NEWDAT     at 0 range 15 .. 15;
      RESERVED_1 at 0 range 16 .. 31;
   end record;

   --  IF_DA_DATA array element
   subtype IF_DA_DATA_Element is Interfaces.LPC4337.Byte;

   --  IF_DA_DATA array
   type IF_DA_DATA_Field_Array is array (0 .. 1) of IF_DA_DATA_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for IF_DA_DATA
   type IF_DA_DATA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  DATA as an array
            Arr : IF_DA_DATA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IF_DA_DATA_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype IF_DA_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message interface data A1
   type IF_DA_Register is record
      --  Data byte 0
      DATA     : IF_DA_DATA_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : IF_DA_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_DA_Register use record
      DATA     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  IF_DA_DATA array
   type IF_DA_DATA_Field_Array_1 is array (2 .. 3) of IF_DA_DATA_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for IF_DA_DATA
   type IF_DA_DATA_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  DATA as an array
            Arr : IF_DA_DATA_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IF_DA_DATA_Field_1 use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Message interface 1 data A2
   type IF_DA_Register_1 is record
      --  Data byte 2
      DATA     : IF_DA_DATA_Field_1 := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : IF_DA_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_DA_Register_1 use record
      DATA     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  IF_DB_DATA array element
   subtype IF_DB_DATA_Element is Interfaces.LPC4337.Byte;

   --  IF_DB_DATA array
   type IF_DB_DATA_Field_Array is array (4 .. 5) of IF_DB_DATA_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for IF_DB_DATA
   type IF_DB_DATA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  DATA as an array
            Arr : IF_DB_DATA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IF_DB_DATA_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype IF_DB_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message interface 1 data B1
   type IF_DB_Register is record
      --  Data byte 4
      DATA     : IF_DB_DATA_Field := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : IF_DB_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_DB_Register use record
      DATA     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   --  IF_DB_DATA array
   type IF_DB_DATA_Field_Array_1 is array (6 .. 7) of IF_DB_DATA_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for IF_DB_DATA
   type IF_DB_DATA_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : Interfaces.LPC4337.UInt16;
         when True =>
            --  DATA as an array
            Arr : IF_DB_DATA_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IF_DB_DATA_Field_1 use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Message interface 1 data B2
   type IF_DB_Register_1 is record
      --  Data byte 6
      DATA     : IF_DB_DATA_Field_1 := (As_Array => False, Val => 16#0#);
      --  Reserved
      RESERVED : IF_DB_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IF_DB_Register_1 use record
      DATA     at 0 range 0 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype TXREQ1_TXRQST16_1_Field is Interfaces.LPC4337.UInt16;
   subtype TXREQ1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Transmission request 1
   type TXREQ1_Register is record
      --  Read-only. Transmission request bit of message objects 16 to 1. 0 =
      --  This message object is not waiting for transmission. 1 = The
      --  transmission of this message object is requested and not yet done.
      TXRQST16_1 : TXREQ1_TXRQST16_1_Field;
      --  Read-only. Reserved
      RESERVED   : TXREQ1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXREQ1_Register use record
      TXRQST16_1 at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype TXREQ2_TXRQST32_17_Field is Interfaces.LPC4337.UInt16;
   subtype TXREQ2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Transmission request 2
   type TXREQ2_Register is record
      --  Read-only. Transmission request bit of message objects 32 to 17. 0 =
      --  This message object is not waiting for transmission. 1 = The
      --  transmission of this message object is requested and not yet done.
      TXRQST32_17 : TXREQ2_TXRQST32_17_Field;
      --  Read-only. Reserved
      RESERVED    : TXREQ2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXREQ2_Register use record
      TXRQST32_17 at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype ND1_NEWDAT16_1_Field is Interfaces.LPC4337.UInt16;
   subtype ND1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  New data 1
   type ND1_Register is record
      --  Read-only. New data bits of message objects 16 to 1. 0 = No new data
      --  has been written into the data portion of this Message Object by the
      --  Message Handler since last time this flag was cleared by the CPU. 1 =
      --  The Message Handler or the CPU has written new data into the data
      --  portion of this Message Object.
      NEWDAT16_1 : ND1_NEWDAT16_1_Field;
      --  Read-only. Reserved
      RESERVED   : ND1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ND1_Register use record
      NEWDAT16_1 at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype ND2_NEWDAT32_17_Field is Interfaces.LPC4337.UInt16;
   subtype ND2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  New data 2
   type ND2_Register is record
      --  Read-only. New data bits of message objects 32 to 17. 0 = No new data
      --  has been written into the data portion of this Message Object by the
      --  Message Handler since last time this flag was cleared by the CPU. 1 =
      --  The Message Handler or the CPU has written new data into the data
      --  portion of this Message Object.
      NEWDAT32_17 : ND2_NEWDAT32_17_Field;
      --  Read-only. Reserved
      RESERVED    : ND2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ND2_Register use record
      NEWDAT32_17 at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype IR1_INTPND16_1_Field is Interfaces.LPC4337.UInt16;
   subtype IR1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt pending 1
   type IR1_Register is record
      --  Read-only. Interrupt pending bits of message objects 16 to 1. 0 =
      --  This message object is ignored by the message handler. 1 = This
      --  message object is the source of an interrupt.
      INTPND16_1 : IR1_INTPND16_1_Field;
      --  Read-only. Reserved
      RESERVED   : IR1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR1_Register use record
      INTPND16_1 at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype IR2_INTPND32_17_Field is Interfaces.LPC4337.UInt16;
   subtype IR2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Interrupt pending 2
   type IR2_Register is record
      --  Read-only. Interrupt pending bits of message objects 32 to 17. 0 =
      --  This message object is ignored by the message handler. 1 = This
      --  message object is the source of an interrupt.
      INTPND32_17 : IR2_INTPND32_17_Field;
      --  Read-only. Reserved
      RESERVED    : IR2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR2_Register use record
      INTPND32_17 at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype MSGV1_MSGVAL16_1_Field is Interfaces.LPC4337.UInt16;
   subtype MSGV1_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message valid 1
   type MSGV1_Register is record
      --  Read-only. Message valid bits of message objects 16 to 1. 0 = This
      --  message object is ignored by the message handler. 1 = This message
      --  object is configured and should be considered by the message handler.
      MSGVAL16_1 : MSGV1_MSGVAL16_1_Field;
      --  Read-only. Reserved
      RESERVED   : MSGV1_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MSGV1_Register use record
      MSGVAL16_1 at 0 range 0 .. 15;
      RESERVED   at 0 range 16 .. 31;
   end record;

   subtype MSGV2_MSGVAL32_17_Field is Interfaces.LPC4337.UInt16;
   subtype MSGV2_RESERVED_Field is Interfaces.LPC4337.UInt16;

   --  Message valid 2
   type MSGV2_Register is record
      --  Read-only. Message valid bits of message objects 32 to 17. 0 = This
      --  message object is ignored by the message handler. 1 = This message
      --  object is configured and should be considered by the message handler.
      MSGVAL32_17 : MSGV2_MSGVAL32_17_Field;
      --  Read-only. Reserved
      RESERVED    : MSGV2_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MSGV2_Register use record
      MSGVAL32_17 at 0 range 0 .. 15;
      RESERVED    at 0 range 16 .. 31;
   end record;

   subtype CLKDIV_CLKDIVVAL_Field is Interfaces.LPC4337.UInt4;
   subtype CLKDIV_RESERVED_Field is Interfaces.LPC4337.UInt28;

   --  CAN clock divider register
   type CLKDIV_Register is record
      --  								Clock divider value 								CAN_CLK = PCLK/(CLKDIVVAL +1)
      --  								 								0000: CAN_CLK = PCLK divided by 1. 								0001:
      --  CAN_CLK = PCLK divided by 2. 								0010: CAN_CLK = PCLK divided by
      --  3. 								0011: CAN_CLK = PCLK divided by 4. 								0100: CAN_CLK =
      --  PCLK divided by 5. 								... 								1111: CAN_CLK = PCLK divided
      --  by 16. 								 							
      CLKDIVVAL : CLKDIV_CLKDIVVAL_Field := 16#1#;
      --  reserved
      RESERVED  : CLKDIV_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLKDIV_Register use record
      CLKDIVVAL at 0 range 0 .. 3;
      RESERVED  at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type C_CAN0_Disc is
     (
      W0,
      R0,
      W1,
      R1);

   --  C_CAN
   type C_CAN1_Peripheral
     (Discriminent : C_CAN0_Disc := W0)
   is record
      --  CAN control
      CNTL         : aliased CNTL_Register;
      --  Status register
      STAT         : aliased STAT_Register;
      --  Error counter
      EC           : aliased EC_Register;
      --  Bit timing register
      BT           : aliased BT_Register;
      --  Interrupt register
      INT          : aliased INT_Register;
      --  Test register
      TEST         : aliased TEST_Register;
      --  Baud rate prescaler extension register
      BRPE         : aliased BRPE_Register;
      --  Message interface command request
      IF_CMDREQ0   : aliased IF_CMDREQ_Register;
      --  Message interface mask 1
      IF_MSK10     : aliased IF_MSK_Register;
      --  Message interface 1 mask 2
      IF_MSK20     : aliased IF_MSK_Register_1;
      --  Message interface 1 arbitration 1
      IF_ARB10     : aliased IF_ARB_Register;
      --  Message interface 1 arbitration 2
      IF_ARB20     : aliased IF_ARB_Register_1;
      --  Message interface 1 message control
      IF_MCTRL0    : aliased IF_MCTRL_Register;
      --  Message interface data A1
      IF_DA10      : aliased IF_DA_Register;
      --  Message interface 1 data A2
      IF_DA20      : aliased IF_DA_Register_1;
      --  Message interface 1 data B1
      IF_DB10      : aliased IF_DB_Register;
      --  Message interface 1 data B2
      IF_DB20      : aliased IF_DB_Register_1;
      --  Message interface command request
      IF_CMDREQ1   : aliased IF_CMDREQ_Register;
      --  Message interface mask 1
      IF_MSK11     : aliased IF_MSK_Register;
      --  Message interface 1 mask 2
      IF_MSK21     : aliased IF_MSK_Register_1;
      --  Message interface 1 arbitration 1
      IF_ARB11     : aliased IF_ARB_Register;
      --  Message interface 1 arbitration 2
      IF_ARB21     : aliased IF_ARB_Register_1;
      --  Message interface 1 message control
      IF_MCTRL1    : aliased IF_MCTRL_Register;
      --  Message interface data A1
      IF_DA11      : aliased IF_DA_Register;
      --  Message interface 1 data A2
      IF_DA21      : aliased IF_DA_Register_1;
      --  Message interface 1 data B1
      IF_DB11      : aliased IF_DB_Register;
      --  Message interface 1 data B2
      IF_DB21      : aliased IF_DB_Register_1;
      --  Transmission request 1
      TXREQ1       : aliased TXREQ1_Register;
      --  Transmission request 2
      TXREQ2       : aliased TXREQ2_Register;
      --  New data 1
      ND1          : aliased ND1_Register;
      --  New data 2
      ND2          : aliased ND2_Register;
      --  Interrupt pending 1
      IR1          : aliased IR1_Register;
      --  Interrupt pending 2
      IR2          : aliased IR2_Register;
      --  Message valid 1
      MSGV1        : aliased MSGV1_Register;
      --  Message valid 2
      MSGV2        : aliased MSGV2_Register;
      --  CAN clock divider register
      CLKDIV       : aliased CLKDIV_Register;
      case Discriminent is
         when W0 =>
            --  Message interface command mask (write direction)
            IF_CMDMSK_W0 : aliased IF_CMDMSK_W_Register;
         when R0 =>
            --  Message interface command mask (read direction)
            IF_CMDMSK_R0 : aliased IF_CMDMSK_R_Register;
         when W1 =>
            --  Message interface command mask (write direction)
            IF_CMDMSK_W1 : aliased IF_CMDMSK_W_Register;
         when R1 =>
            --  Message interface command mask (read direction)
            IF_CMDMSK_R1 : aliased IF_CMDMSK_R_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for C_CAN1_Peripheral use record
      CNTL         at 16#0# range 0 .. 31;
      STAT         at 16#4# range 0 .. 31;
      EC           at 16#8# range 0 .. 31;
      BT           at 16#C# range 0 .. 31;
      INT          at 16#10# range 0 .. 31;
      TEST         at 16#14# range 0 .. 31;
      BRPE         at 16#18# range 0 .. 31;
      IF_CMDREQ0   at 16#20# range 0 .. 31;
      IF_MSK10     at 16#28# range 0 .. 31;
      IF_MSK20     at 16#2C# range 0 .. 31;
      IF_ARB10     at 16#30# range 0 .. 31;
      IF_ARB20     at 16#34# range 0 .. 31;
      IF_MCTRL0    at 16#38# range 0 .. 31;
      IF_DA10      at 16#3C# range 0 .. 31;
      IF_DA20      at 16#40# range 0 .. 31;
      IF_DB10      at 16#44# range 0 .. 31;
      IF_DB20      at 16#48# range 0 .. 31;
      IF_CMDREQ1   at 16#80# range 0 .. 31;
      IF_MSK11     at 16#88# range 0 .. 31;
      IF_MSK21     at 16#8C# range 0 .. 31;
      IF_ARB11     at 16#90# range 0 .. 31;
      IF_ARB21     at 16#94# range 0 .. 31;
      IF_MCTRL1    at 16#98# range 0 .. 31;
      IF_DA11      at 16#9C# range 0 .. 31;
      IF_DA21      at 16#A0# range 0 .. 31;
      IF_DB11      at 16#A4# range 0 .. 31;
      IF_DB21      at 16#A8# range 0 .. 31;
      TXREQ1       at 16#100# range 0 .. 31;
      TXREQ2       at 16#104# range 0 .. 31;
      ND1          at 16#120# range 0 .. 31;
      ND2          at 16#124# range 0 .. 31;
      IR1          at 16#140# range 0 .. 31;
      IR2          at 16#144# range 0 .. 31;
      MSGV1        at 16#160# range 0 .. 31;
      MSGV2        at 16#164# range 0 .. 31;
      CLKDIV       at 16#180# range 0 .. 31;
      IF_CMDMSK_W0 at 16#24# range 0 .. 31;
      IF_CMDMSK_R0 at 16#24# range 0 .. 31;
      IF_CMDMSK_W1 at 16#84# range 0 .. 31;
      IF_CMDMSK_R1 at 16#84# range 0 .. 31;
   end record;

   --  C_CAN
   C_CAN0_Periph : aliased C_CAN1_Peripheral
     with Import, Address => System'To_Address (16#400E2000#);

   --  C_CAN
   C_CAN1_Periph : aliased C_CAN1_Peripheral
     with Import, Address => System'To_Address (16#400A4000#);

end Interfaces.LPC4337.C_CAN1;
