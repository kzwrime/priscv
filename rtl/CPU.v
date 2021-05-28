

module Adder(
  input  [31:0] io_inputx,
  input  [31:0] io_inputy,
  output [31:0] io_result
);
  assign io_result = io_inputx + io_inputy; // @[OuterV.scala 146:26]
endmodule
module StageReg(
  input         clock,
  input         reset,
  input  [31:0] io_in_instr,
  input  [31:0] io_in_pc,
  input  [31:0] io_in_pcPlus4,
  input         io_flush,
  input         io_valid,
  output [31:0] io_data_instr,
  output [31:0] io_data_pc,
  output [31:0] io_data_pcPlus4
);
  reg [31:0] reg_instr; // @[stage-register.scala 29:21]
  reg [31:0] reg_pc; // @[stage-register.scala 29:21]
  reg [31:0] reg_pcPlus4; // @[stage-register.scala 29:21]
  assign io_data_instr = reg_instr; // @[stage-register.scala 30:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 30:11]
  assign io_data_pcPlus4 = reg_pcPlus4; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_instr <= 32'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_instr <= 32'h0; // @[stage-register.scala 35:9]
    end else if (io_valid) begin // @[stage-register.scala 31:19]
      reg_instr <= io_in_instr; // @[stage-register.scala 32:9]
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_pc <= 32'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_pc <= 32'h0; // @[stage-register.scala 35:9]
    end else if (io_valid) begin // @[stage-register.scala 31:19]
      reg_pc <= io_in_pc; // @[stage-register.scala 32:9]
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 35:9]
    end else if (io_valid) begin // @[stage-register.scala 31:19]
      reg_pcPlus4 <= io_in_pcPlus4; // @[stage-register.scala 32:9]
    end
  end
// Register and memory initialization
endmodule
module StageReg_1(
  input         clock,
  input         reset,
  input  [4:0]  io_in_regWAddr,
  input  [6:0]  io_in_funct7,
  input  [2:0]  io_in_funct3,
  input  [31:0] io_in_imm,
  input  [31:0] io_in_regRData2,
  input  [31:0] io_in_regRData1,
  input  [31:0] io_in_pc,
  input  [31:0] io_in_pcPlus4,
  input  [4:0]  io_in_rs1,
  input  [4:0]  io_in_rs2,
  output [4:0]  io_data_regWAddr,
  output [6:0]  io_data_funct7,
  output [2:0]  io_data_funct3,
  output [31:0] io_data_imm,
  output [31:0] io_data_regRData2,
  output [31:0] io_data_regRData1,
  output [31:0] io_data_pc,
  output [31:0] io_data_pcPlus4,
  output [4:0]  io_data_rs1,
  output [4:0]  io_data_rs2
);
  reg [4:0] reg_regWAddr; // @[stage-register.scala 29:21]
  reg [6:0] reg_funct7; // @[stage-register.scala 29:21]
  reg [2:0] reg_funct3; // @[stage-register.scala 29:21]
  reg [31:0] reg_imm; // @[stage-register.scala 29:21]
  reg [31:0] reg_regRData2; // @[stage-register.scala 29:21]
  reg [31:0] reg_regRData1; // @[stage-register.scala 29:21]
  reg [31:0] reg_pc; // @[stage-register.scala 29:21]
  reg [31:0] reg_pcPlus4; // @[stage-register.scala 29:21]
  reg [4:0] reg_rs1; // @[stage-register.scala 29:21]
  reg [4:0] reg_rs2; // @[stage-register.scala 29:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 30:11]
  assign io_data_funct7 = reg_funct7; // @[stage-register.scala 30:11]
  assign io_data_funct3 = reg_funct3; // @[stage-register.scala 30:11]
  assign io_data_imm = reg_imm; // @[stage-register.scala 30:11]
  assign io_data_regRData2 = reg_regRData2; // @[stage-register.scala 30:11]
  assign io_data_regRData1 = reg_regRData1; // @[stage-register.scala 30:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 30:11]
  assign io_data_pcPlus4 = reg_pcPlus4; // @[stage-register.scala 30:11]
  assign io_data_rs1 = reg_rs1; // @[stage-register.scala 30:11]
  assign io_data_rs2 = reg_rs2; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regWAddr <= io_in_regWAddr;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_funct7 <= 7'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_funct7 <= io_in_funct7;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_funct3 <= 3'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_funct3 <= io_in_funct3;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_imm <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_imm <= io_in_imm;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regRData2 <= io_in_regRData2;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regRData1 <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regRData1 <= io_in_regRData1;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_pc <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_pc <= io_in_pc;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_pcPlus4 <= io_in_pcPlus4;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_rs1 <= 5'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_rs1 <= io_in_rs1;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_rs2 <= 5'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_rs2 <= io_in_rs2;
    end
  end
// Register and memory initialization
endmodule
module StageReg_2(
  input        clock,
  input        reset,
  input  [1:0] io_in_ex_ctrl_aluCtrlOp,
  input  [1:0] io_in_ex_ctrl_resultSel,
  input        io_in_ex_ctrl_aluSrc,
  input        io_in_ex_ctrl_pcAdd,
  input        io_in_ex_ctrl_branch,
  input  [1:0] io_in_ex_ctrl_jump,
  input        io_in_mem_ctrl_memRead,
  input        io_in_mem_ctrl_memWrite,
  input  [1:0] io_in_mem_ctrl_maskMode,
  input        io_in_mem_ctrl_sext,
  input        io_in_wb_ctrl_toReg,
  input        io_in_wb_ctrl_regWrite,
  input        io_flush,
  output [1:0] io_data_ex_ctrl_aluCtrlOp,
  output [1:0] io_data_ex_ctrl_resultSel,
  output       io_data_ex_ctrl_aluSrc,
  output       io_data_ex_ctrl_pcAdd,
  output       io_data_ex_ctrl_branch,
  output [1:0] io_data_ex_ctrl_jump,
  output       io_data_mem_ctrl_memRead,
  output       io_data_mem_ctrl_memWrite,
  output [1:0] io_data_mem_ctrl_maskMode,
  output       io_data_mem_ctrl_sext,
  output       io_data_wb_ctrl_toReg,
  output       io_data_wb_ctrl_regWrite
);
  reg [1:0] reg_ex_ctrl_aluCtrlOp; // @[stage-register.scala 29:21]
  reg [1:0] reg_ex_ctrl_resultSel; // @[stage-register.scala 29:21]
  reg  reg_ex_ctrl_aluSrc; // @[stage-register.scala 29:21]
  reg  reg_ex_ctrl_pcAdd; // @[stage-register.scala 29:21]
  reg  reg_ex_ctrl_branch; // @[stage-register.scala 29:21]
  reg [1:0] reg_ex_ctrl_jump; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_memRead; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_memWrite; // @[stage-register.scala 29:21]
  reg [1:0] reg_mem_ctrl_maskMode; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_sext; // @[stage-register.scala 29:21]
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 29:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 29:21]
  assign io_data_ex_ctrl_aluCtrlOp = reg_ex_ctrl_aluCtrlOp; // @[stage-register.scala 30:11]
  assign io_data_ex_ctrl_resultSel = reg_ex_ctrl_resultSel; // @[stage-register.scala 30:11]
  assign io_data_ex_ctrl_aluSrc = reg_ex_ctrl_aluSrc; // @[stage-register.scala 30:11]
  assign io_data_ex_ctrl_pcAdd = reg_ex_ctrl_pcAdd; // @[stage-register.scala 30:11]
  assign io_data_ex_ctrl_branch = reg_ex_ctrl_branch; // @[stage-register.scala 30:11]
  assign io_data_ex_ctrl_jump = reg_ex_ctrl_jump; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_memRead = reg_mem_ctrl_memRead; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_memWrite = reg_mem_ctrl_memWrite; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_maskMode = reg_mem_ctrl_maskMode; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_sext = reg_mem_ctrl_sext; // @[stage-register.scala 30:11]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 30:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_aluCtrlOp <= 2'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_aluCtrlOp <= 2'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_aluCtrlOp <= io_in_ex_ctrl_aluCtrlOp;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_resultSel <= 2'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_resultSel <= 2'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_resultSel <= io_in_ex_ctrl_resultSel;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_aluSrc <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_aluSrc <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_aluSrc <= io_in_ex_ctrl_aluSrc;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_pcAdd <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_pcAdd <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_pcAdd <= io_in_ex_ctrl_pcAdd;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_branch <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_branch <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_branch <= io_in_ex_ctrl_branch;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_ex_ctrl_jump <= 2'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_ex_ctrl_jump <= 2'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_ex_ctrl_jump <= io_in_ex_ctrl_jump;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_memRead <= io_in_mem_ctrl_memRead;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_memWrite <= io_in_mem_ctrl_memWrite;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_maskMode <= io_in_mem_ctrl_maskMode;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_sext <= io_in_mem_ctrl_sext;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite;
    end
  end
// Register and memory initialization
endmodule
module StageReg_3(
  input         clock,
  input         reset,
  input  [4:0]  io_in_regWAddr,
  input  [31:0] io_in_regRData2,
  input  [31:0] io_in_result,
  input  [31:0] io_in_nextpc,
  output [4:0]  io_data_regWAddr,
  output [31:0] io_data_regRData2,
  output [31:0] io_data_result,
  output [31:0] io_data_nextpc
);
  reg [4:0] reg_regWAddr; // @[stage-register.scala 29:21]
  reg [31:0] reg_regRData2; // @[stage-register.scala 29:21]
  reg [31:0] reg_result; // @[stage-register.scala 29:21]
  reg [31:0] reg_nextpc; // @[stage-register.scala 29:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 30:11]
  assign io_data_regRData2 = reg_regRData2; // @[stage-register.scala 30:11]
  assign io_data_result = reg_result; // @[stage-register.scala 30:11]
  assign io_data_nextpc = reg_nextpc; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regWAddr <= io_in_regWAddr;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regRData2 <= io_in_regRData2;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_result <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_result <= io_in_result;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_nextpc <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_nextpc <= io_in_nextpc;
    end
  end
// Register and memory initialization
endmodule
module StageReg_4(
  input        clock,
  input        reset,
  input        io_in_mem_ctrl_memRead,
  input        io_in_mem_ctrl_memWrite,
  input        io_in_mem_ctrl_taken,
  input  [1:0] io_in_mem_ctrl_maskMode,
  input        io_in_mem_ctrl_sext,
  input        io_in_wb_ctrl_toReg,
  input        io_in_wb_ctrl_regWrite,
  input        io_flush,
  output       io_data_mem_ctrl_memRead,
  output       io_data_mem_ctrl_memWrite,
  output       io_data_mem_ctrl_taken,
  output [1:0] io_data_mem_ctrl_maskMode,
  output       io_data_mem_ctrl_sext,
  output       io_data_wb_ctrl_toReg,
  output       io_data_wb_ctrl_regWrite
);
  reg  reg_mem_ctrl_memRead; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_memWrite; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_taken; // @[stage-register.scala 29:21]
  reg [1:0] reg_mem_ctrl_maskMode; // @[stage-register.scala 29:21]
  reg  reg_mem_ctrl_sext; // @[stage-register.scala 29:21]
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 29:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 29:21]
  assign io_data_mem_ctrl_memRead = reg_mem_ctrl_memRead; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_memWrite = reg_mem_ctrl_memWrite; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_taken = reg_mem_ctrl_taken; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_maskMode = reg_mem_ctrl_maskMode; // @[stage-register.scala 30:11]
  assign io_data_mem_ctrl_sext = reg_mem_ctrl_sext; // @[stage-register.scala 30:11]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 30:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_memRead <= io_in_mem_ctrl_memRead;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_memWrite <= io_in_mem_ctrl_memWrite;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_taken <= io_in_mem_ctrl_taken;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_maskMode <= io_in_mem_ctrl_maskMode;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_mem_ctrl_sext <= io_in_mem_ctrl_sext;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 29:21]
    end else if (io_flush) begin // @[stage-register.scala 34:19]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 35:9]
    end else begin
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite;
    end
  end
// Register and memory initialization
endmodule
module StageReg_5(
  input         clock,
  input         reset,
  input  [4:0]  io_in_regWAddr,
  input  [31:0] io_in_result,
  input  [31:0] io_in_readData,
  output [4:0]  io_data_regWAddr,
  output [31:0] io_data_result,
  output [31:0] io_data_readData
);
  reg [4:0] reg_regWAddr; // @[stage-register.scala 29:21]
  reg [31:0] reg_result; // @[stage-register.scala 29:21]
  reg [31:0] reg_readData; // @[stage-register.scala 29:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 30:11]
  assign io_data_result = reg_result; // @[stage-register.scala 30:11]
  assign io_data_readData = reg_readData; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_regWAddr <= io_in_regWAddr;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_result <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_result <= io_in_result;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_readData <= 32'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_readData <= io_in_readData;
    end
  end
// Register and memory initialization
endmodule
module StageReg_6(
  input   clock,
  input   reset,
  input   io_in_wb_ctrl_toReg,
  input   io_in_wb_ctrl_regWrite,
  output  io_data_wb_ctrl_toReg,
  output  io_data_wb_ctrl_regWrite
);
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 29:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 29:21]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 30:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 30:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg;
    end
    if (reset) begin // @[stage-register.scala 29:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 29:21]
    end else begin
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite;
    end
  end
// Register and memory initialization
endmodule
module CPU(
  input         clock,
  input         reset,
  output [31:0] io_imem_addr,
  output        io_imem_valid,
  input         io_imem_good,
  input  [31:0] io_imem_instr,
  output [31:0] io_dmem_addr,
  output        io_dmem_valid,
  input         io_dmem_good,
  output [31:0] io_dmem_writeData,
  output        io_dmem_memRead,
  output        io_dmem_memWrite,
  output [1:0]  io_dmem_maskMode,
  output        io_dmem_sext,
  input  [31:0] io_dmem_readData
);
  wire [31:0] decode_instr; // @[CPU.scala 97:26]
  wire  decode_branch; // @[CPU.scala 97:26]
  wire [1:0] decode_jump; // @[CPU.scala 97:26]
  wire  decode_memRead; // @[CPU.scala 97:26]
  wire  decode_memWrite; // @[CPU.scala 97:26]
  wire  decode_regWrite; // @[CPU.scala 97:26]
  wire  decode_toReg; // @[CPU.scala 97:26]
  wire [1:0] decode_resultSel; // @[CPU.scala 97:26]
  wire  decode_aluSrc; // @[CPU.scala 97:26]
  wire  decode_pcAdd; // @[CPU.scala 97:26]
  wire [6:0] decode_types; // @[CPU.scala 97:26]
  wire [1:0] decode_aluCtrlOp; // @[CPU.scala 97:26]
  wire  decode_validInst; // @[CPU.scala 97:26]
  wire [31:0] decode_imm; // @[CPU.scala 97:26]
  wire  regs_clk; // @[CPU.scala 98:26]
  wire  regs_reset; // @[CPU.scala 98:26]
  wire  regs_wen; // @[CPU.scala 98:26]
  wire [4:0] regs_regRAddr1; // @[CPU.scala 98:26]
  wire [4:0] regs_regRAddr2; // @[CPU.scala 98:26]
  wire [4:0] regs_regWAddr; // @[CPU.scala 98:26]
  wire [31:0] regs_regWData; // @[CPU.scala 98:26]
  wire [31:0] regs_regRData1; // @[CPU.scala 98:26]
  wire [31:0] regs_regRData2; // @[CPU.scala 98:26]
  wire [2:0] aluControl_funct3; // @[CPU.scala 99:26]
  wire [6:0] aluControl_funct7; // @[CPU.scala 99:26]
  wire [1:0] aluControl_aluCtrlOp; // @[CPU.scala 99:26]
  wire [3:0] aluControl_aluOp; // @[CPU.scala 99:26]
  wire [31:0] alu_aluIn1; // @[CPU.scala 100:26]
  wire [31:0] alu_aluIn2; // @[CPU.scala 100:26]
  wire [3:0] alu_aluOp; // @[CPU.scala 100:26]
  wire [31:0] alu_aluOut; // @[CPU.scala 100:26]
  wire [31:0] pcPlus4_io_inputx; // @[CPU.scala 101:23]
  wire [31:0] pcPlus4_io_inputy; // @[CPU.scala 101:23]
  wire [31:0] pcPlus4_io_result; // @[CPU.scala 101:23]
  wire [31:0] branchAdd_io_inputx; // @[CPU.scala 102:26]
  wire [31:0] branchAdd_io_inputy; // @[CPU.scala 102:26]
  wire [31:0] branchAdd_io_result; // @[CPU.scala 102:26]
  wire [4:0] forwarding_rs1; // @[CPU.scala 103:26]
  wire [4:0] forwarding_rs2; // @[CPU.scala 103:26]
  wire [4:0] forwarding_exMemRd; // @[CPU.scala 103:26]
  wire  forwarding_exMemRw; // @[CPU.scala 103:26]
  wire [4:0] forwarding_memWBRd; // @[CPU.scala 103:26]
  wire  forwarding_memWBRw; // @[CPU.scala 103:26]
  wire [1:0] forwarding_forwardA; // @[CPU.scala 103:26]
  wire [1:0] forwarding_forwardB; // @[CPU.scala 103:26]
  wire [4:0] hazard_rs1; // @[CPU.scala 104:26]
  wire [4:0] hazard_rs2; // @[CPU.scala 104:26]
  wire  hazard_ID_EX_memRead; // @[CPU.scala 104:26]
  wire [4:0] hazard_ID_EX_rd; // @[CPU.scala 104:26]
  wire  hazard_EX_MEM_taken; // @[CPU.scala 104:26]
  wire  hazard_pcFromTaken; // @[CPU.scala 104:26]
  wire  hazard_pcStall; // @[CPU.scala 104:26]
  wire  hazard_IF_ID_stall; // @[CPU.scala 104:26]
  wire  hazard_ID_EX_flush; // @[CPU.scala 104:26]
  wire  hazard_EX_MEM_flush; // @[CPU.scala 104:26]
  wire  hazard_IF_ID_flush; // @[CPU.scala 104:26]
  wire  if_id_clock; // @[CPU.scala 108:27]
  wire  if_id_reset; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_in_instr; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_in_pc; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_in_pcPlus4; // @[CPU.scala 108:27]
  wire  if_id_io_flush; // @[CPU.scala 108:27]
  wire  if_id_io_valid; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_data_instr; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_data_pc; // @[CPU.scala 108:27]
  wire [31:0] if_id_io_data_pcPlus4; // @[CPU.scala 108:27]
  wire  id_ex_clock; // @[CPU.scala 110:27]
  wire  id_ex_reset; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_in_regWAddr; // @[CPU.scala 110:27]
  wire [6:0] id_ex_io_in_funct7; // @[CPU.scala 110:27]
  wire [2:0] id_ex_io_in_funct3; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_in_imm; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_in_regRData2; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_in_regRData1; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_in_pc; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_in_pcPlus4; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_in_rs1; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_in_rs2; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_data_regWAddr; // @[CPU.scala 110:27]
  wire [6:0] id_ex_io_data_funct7; // @[CPU.scala 110:27]
  wire [2:0] id_ex_io_data_funct3; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_data_imm; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_data_regRData2; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_data_regRData1; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_data_pc; // @[CPU.scala 110:27]
  wire [31:0] id_ex_io_data_pcPlus4; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_data_rs1; // @[CPU.scala 110:27]
  wire [4:0] id_ex_io_data_rs2; // @[CPU.scala 110:27]
  wire  id_ex_ctrl_clock; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_reset; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_resultSel; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_aluSrc; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_pcAdd; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_branch; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_jump; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_memRead; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_memWrite; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_in_mem_ctrl_maskMode; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_sext; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_flush; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_resultSel; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_aluSrc; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_pcAdd; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_branch; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_jump; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 111:27]
  wire [1:0] id_ex_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 111:27]
  wire  id_ex_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 111:27]
  wire  ex_mem_clock; // @[CPU.scala 113:27]
  wire  ex_mem_reset; // @[CPU.scala 113:27]
  wire [4:0] ex_mem_io_in_regWAddr; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_in_regRData2; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_in_result; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_in_nextpc; // @[CPU.scala 113:27]
  wire [4:0] ex_mem_io_data_regWAddr; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_data_regRData2; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_data_result; // @[CPU.scala 113:27]
  wire [31:0] ex_mem_io_data_nextpc; // @[CPU.scala 113:27]
  wire  ex_mem_ctrl_clock; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_reset; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_memRead; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_memWrite; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_taken; // @[CPU.scala 114:27]
  wire [1:0] ex_mem_ctrl_io_in_mem_ctrl_maskMode; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_sext; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_flush; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_taken; // @[CPU.scala 114:27]
  wire [1:0] ex_mem_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 114:27]
  wire  ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 114:27]
  wire  mem_wb_clock; // @[CPU.scala 116:27]
  wire  mem_wb_reset; // @[CPU.scala 116:27]
  wire [4:0] mem_wb_io_in_regWAddr; // @[CPU.scala 116:27]
  wire [31:0] mem_wb_io_in_result; // @[CPU.scala 116:27]
  wire [31:0] mem_wb_io_in_readData; // @[CPU.scala 116:27]
  wire [4:0] mem_wb_io_data_regWAddr; // @[CPU.scala 116:27]
  wire [31:0] mem_wb_io_data_result; // @[CPU.scala 116:27]
  wire [31:0] mem_wb_io_data_readData; // @[CPU.scala 116:27]
  wire  mem_wb_ctrl_clock; // @[CPU.scala 119:27]
  wire  mem_wb_ctrl_reset; // @[CPU.scala 119:27]
  wire  mem_wb_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 119:27]
  wire  mem_wb_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 119:27]
  wire  mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 119:27]
  wire  mem_wb_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 119:27]
  reg [31:0] pc; // @[CPU.scala 96:27]
  wire [31:0] next_pc = ex_mem_io_data_nextpc; // @[CPU.scala 124:26 CPU.scala 317:11]
  wire  _forward_input1_T = forwarding_forwardA == 2'h0; // @[CPU.scala 240:52]
  wire  _forward_input1_T_1 = forwarding_forwardA == 2'h1; // @[CPU.scala 241:52]
  wire  _forward_input1_T_2 = forwarding_forwardA == 2'h2; // @[CPU.scala 242:52]
  wire  _regWData_T = ~mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 347:63]
  wire  _regWData_T_1 = mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 348:63]
  wire [31:0] _regWData_T_2 = _regWData_T_1 ? mem_wb_io_data_readData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] regWData = _regWData_T ? mem_wb_io_data_result : _regWData_T_2; // @[Mux.scala 98:16]
  wire [31:0] _forward_input1_T_3 = _forward_input1_T_2 ? regWData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _forward_input1_T_4 = _forward_input1_T_1 ? ex_mem_io_data_result : _forward_input1_T_3; // @[Mux.scala 98:16]
  wire [31:0] forward_input1 = _forward_input1_T ? id_ex_io_data_regRData1 : _forward_input1_T_4; // @[Mux.scala 98:16]
  wire  _forward_input2_T = forwarding_forwardB == 2'h0; // @[CPU.scala 252:52]
  wire  _forward_input2_T_1 = forwarding_forwardB == 2'h1; // @[CPU.scala 253:52]
  wire  _forward_input2_T_2 = forwarding_forwardB == 2'h2; // @[CPU.scala 254:52]
  wire [31:0] _forward_input2_T_3 = _forward_input2_T_2 ? regWData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _forward_input2_T_4 = _forward_input2_T_1 ? ex_mem_io_data_result : _forward_input2_T_3; // @[Mux.scala 98:16]
  wire [31:0] forward_input2 = _forward_input2_T ? id_ex_io_data_regRData2 : _forward_input2_T_4; // @[Mux.scala 98:16]
  wire  _ex_mem_io_in_result_T = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h0; // @[CPU.scala 287:66]
  wire  _ex_mem_io_in_result_T_1 = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h1; // @[CPU.scala 288:66]
  wire  _ex_mem_io_in_result_T_2 = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h2; // @[CPU.scala 289:66]
  wire [31:0] _ex_mem_io_in_result_T_3 = _ex_mem_io_in_result_T_2 ? id_ex_io_data_pcPlus4 : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _ex_mem_io_in_result_T_4 = _ex_mem_io_in_result_T_1 ? id_ex_io_data_imm : _ex_mem_io_in_result_T_3; // @[Mux.scala 98:16]
  Decode decode ( // @[CPU.scala 97:26]
    .instr(decode_instr),
    .branch(decode_branch),
    .jump(decode_jump),
    .memRead(decode_memRead),
    .memWrite(decode_memWrite),
    .regWrite(decode_regWrite),
    .toReg(decode_toReg),
    .resultSel(decode_resultSel),
    .aluSrc(decode_aluSrc),
    .pcAdd(decode_pcAdd),
    .types(decode_types),
    .aluCtrlOp(decode_aluCtrlOp),
    .validInst(decode_validInst),
    .imm(decode_imm)
  );
  RegFile regs ( // @[CPU.scala 98:26]
    .clk(regs_clk),
    .reset(regs_reset),
    .wen(regs_wen),
    .regRAddr1(regs_regRAddr1),
    .regRAddr2(regs_regRAddr2),
    .regWAddr(regs_regWAddr),
    .regWData(regs_regWData),
    .regRData1(regs_regRData1),
    .regRData2(regs_regRData2)
  );
  ALUCtrl aluControl ( // @[CPU.scala 99:26]
    .funct3(aluControl_funct3),
    .funct7(aluControl_funct7),
    .aluCtrlOp(aluControl_aluCtrlOp),
    .aluOp(aluControl_aluOp)
  );
  ALU alu ( // @[CPU.scala 100:26]
    .aluIn1(alu_aluIn1),
    .aluIn2(alu_aluIn2),
    .aluOp(alu_aluOp),
    .aluOut(alu_aluOut)
  );
  Adder pcPlus4 ( // @[CPU.scala 101:23]
    .io_inputx(pcPlus4_io_inputx),
    .io_inputy(pcPlus4_io_inputy),
    .io_result(pcPlus4_io_result)
  );
  Adder branchAdd ( // @[CPU.scala 102:26]
    .io_inputx(branchAdd_io_inputx),
    .io_inputy(branchAdd_io_inputy),
    .io_result(branchAdd_io_result)
  );
  ForwardingUnit forwarding ( // @[CPU.scala 103:26]
    .rs1(forwarding_rs1),
    .rs2(forwarding_rs2),
    .exMemRd(forwarding_exMemRd),
    .exMemRw(forwarding_exMemRw),
    .memWBRd(forwarding_memWBRd),
    .memWBRw(forwarding_memWBRw),
    .forwardA(forwarding_forwardA),
    .forwardB(forwarding_forwardB)
  );
  HazardUnit hazard ( // @[CPU.scala 104:26]
    .rs1(hazard_rs1),
    .rs2(hazard_rs2),
    .ID_EX_memRead(hazard_ID_EX_memRead),
    .ID_EX_rd(hazard_ID_EX_rd),
    .EX_MEM_taken(hazard_EX_MEM_taken),
    .pcFromTaken(hazard_pcFromTaken),
    .pcStall(hazard_pcStall),
    .IF_ID_stall(hazard_IF_ID_stall),
    .ID_EX_flush(hazard_ID_EX_flush),
    .EX_MEM_flush(hazard_EX_MEM_flush),
    .IF_ID_flush(hazard_IF_ID_flush)
  );
  StageReg if_id ( // @[CPU.scala 108:27]
    .clock(if_id_clock),
    .reset(if_id_reset),
    .io_in_instr(if_id_io_in_instr),
    .io_in_pc(if_id_io_in_pc),
    .io_in_pcPlus4(if_id_io_in_pcPlus4),
    .io_flush(if_id_io_flush),
    .io_valid(if_id_io_valid),
    .io_data_instr(if_id_io_data_instr),
    .io_data_pc(if_id_io_data_pc),
    .io_data_pcPlus4(if_id_io_data_pcPlus4)
  );
  StageReg_1 id_ex ( // @[CPU.scala 110:27]
    .clock(id_ex_clock),
    .reset(id_ex_reset),
    .io_in_regWAddr(id_ex_io_in_regWAddr),
    .io_in_funct7(id_ex_io_in_funct7),
    .io_in_funct3(id_ex_io_in_funct3),
    .io_in_imm(id_ex_io_in_imm),
    .io_in_regRData2(id_ex_io_in_regRData2),
    .io_in_regRData1(id_ex_io_in_regRData1),
    .io_in_pc(id_ex_io_in_pc),
    .io_in_pcPlus4(id_ex_io_in_pcPlus4),
    .io_in_rs1(id_ex_io_in_rs1),
    .io_in_rs2(id_ex_io_in_rs2),
    .io_data_regWAddr(id_ex_io_data_regWAddr),
    .io_data_funct7(id_ex_io_data_funct7),
    .io_data_funct3(id_ex_io_data_funct3),
    .io_data_imm(id_ex_io_data_imm),
    .io_data_regRData2(id_ex_io_data_regRData2),
    .io_data_regRData1(id_ex_io_data_regRData1),
    .io_data_pc(id_ex_io_data_pc),
    .io_data_pcPlus4(id_ex_io_data_pcPlus4),
    .io_data_rs1(id_ex_io_data_rs1),
    .io_data_rs2(id_ex_io_data_rs2)
  );
  StageReg_2 id_ex_ctrl ( // @[CPU.scala 111:27]
    .clock(id_ex_ctrl_clock),
    .reset(id_ex_ctrl_reset),
    .io_in_ex_ctrl_aluCtrlOp(id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp),
    .io_in_ex_ctrl_resultSel(id_ex_ctrl_io_in_ex_ctrl_resultSel),
    .io_in_ex_ctrl_aluSrc(id_ex_ctrl_io_in_ex_ctrl_aluSrc),
    .io_in_ex_ctrl_pcAdd(id_ex_ctrl_io_in_ex_ctrl_pcAdd),
    .io_in_ex_ctrl_branch(id_ex_ctrl_io_in_ex_ctrl_branch),
    .io_in_ex_ctrl_jump(id_ex_ctrl_io_in_ex_ctrl_jump),
    .io_in_mem_ctrl_memRead(id_ex_ctrl_io_in_mem_ctrl_memRead),
    .io_in_mem_ctrl_memWrite(id_ex_ctrl_io_in_mem_ctrl_memWrite),
    .io_in_mem_ctrl_maskMode(id_ex_ctrl_io_in_mem_ctrl_maskMode),
    .io_in_mem_ctrl_sext(id_ex_ctrl_io_in_mem_ctrl_sext),
    .io_in_wb_ctrl_toReg(id_ex_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(id_ex_ctrl_io_in_wb_ctrl_regWrite),
    .io_flush(id_ex_ctrl_io_flush),
    .io_data_ex_ctrl_aluCtrlOp(id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp),
    .io_data_ex_ctrl_resultSel(id_ex_ctrl_io_data_ex_ctrl_resultSel),
    .io_data_ex_ctrl_aluSrc(id_ex_ctrl_io_data_ex_ctrl_aluSrc),
    .io_data_ex_ctrl_pcAdd(id_ex_ctrl_io_data_ex_ctrl_pcAdd),
    .io_data_ex_ctrl_branch(id_ex_ctrl_io_data_ex_ctrl_branch),
    .io_data_ex_ctrl_jump(id_ex_ctrl_io_data_ex_ctrl_jump),
    .io_data_mem_ctrl_memRead(id_ex_ctrl_io_data_mem_ctrl_memRead),
    .io_data_mem_ctrl_memWrite(id_ex_ctrl_io_data_mem_ctrl_memWrite),
    .io_data_mem_ctrl_maskMode(id_ex_ctrl_io_data_mem_ctrl_maskMode),
    .io_data_mem_ctrl_sext(id_ex_ctrl_io_data_mem_ctrl_sext),
    .io_data_wb_ctrl_toReg(id_ex_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(id_ex_ctrl_io_data_wb_ctrl_regWrite)
  );
  StageReg_3 ex_mem ( // @[CPU.scala 113:27]
    .clock(ex_mem_clock),
    .reset(ex_mem_reset),
    .io_in_regWAddr(ex_mem_io_in_regWAddr),
    .io_in_regRData2(ex_mem_io_in_regRData2),
    .io_in_result(ex_mem_io_in_result),
    .io_in_nextpc(ex_mem_io_in_nextpc),
    .io_data_regWAddr(ex_mem_io_data_regWAddr),
    .io_data_regRData2(ex_mem_io_data_regRData2),
    .io_data_result(ex_mem_io_data_result),
    .io_data_nextpc(ex_mem_io_data_nextpc)
  );
  StageReg_4 ex_mem_ctrl ( // @[CPU.scala 114:27]
    .clock(ex_mem_ctrl_clock),
    .reset(ex_mem_ctrl_reset),
    .io_in_mem_ctrl_memRead(ex_mem_ctrl_io_in_mem_ctrl_memRead),
    .io_in_mem_ctrl_memWrite(ex_mem_ctrl_io_in_mem_ctrl_memWrite),
    .io_in_mem_ctrl_taken(ex_mem_ctrl_io_in_mem_ctrl_taken),
    .io_in_mem_ctrl_maskMode(ex_mem_ctrl_io_in_mem_ctrl_maskMode),
    .io_in_mem_ctrl_sext(ex_mem_ctrl_io_in_mem_ctrl_sext),
    .io_in_wb_ctrl_toReg(ex_mem_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(ex_mem_ctrl_io_in_wb_ctrl_regWrite),
    .io_flush(ex_mem_ctrl_io_flush),
    .io_data_mem_ctrl_memRead(ex_mem_ctrl_io_data_mem_ctrl_memRead),
    .io_data_mem_ctrl_memWrite(ex_mem_ctrl_io_data_mem_ctrl_memWrite),
    .io_data_mem_ctrl_taken(ex_mem_ctrl_io_data_mem_ctrl_taken),
    .io_data_mem_ctrl_maskMode(ex_mem_ctrl_io_data_mem_ctrl_maskMode),
    .io_data_mem_ctrl_sext(ex_mem_ctrl_io_data_mem_ctrl_sext),
    .io_data_wb_ctrl_toReg(ex_mem_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(ex_mem_ctrl_io_data_wb_ctrl_regWrite)
  );
  StageReg_5 mem_wb ( // @[CPU.scala 116:27]
    .clock(mem_wb_clock),
    .reset(mem_wb_reset),
    .io_in_regWAddr(mem_wb_io_in_regWAddr),
    .io_in_result(mem_wb_io_in_result),
    .io_in_readData(mem_wb_io_in_readData),
    .io_data_regWAddr(mem_wb_io_data_regWAddr),
    .io_data_result(mem_wb_io_data_result),
    .io_data_readData(mem_wb_io_data_readData)
  );
  StageReg_6 mem_wb_ctrl ( // @[CPU.scala 119:27]
    .clock(mem_wb_ctrl_clock),
    .reset(mem_wb_ctrl_reset),
    .io_in_wb_ctrl_toReg(mem_wb_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(mem_wb_ctrl_io_in_wb_ctrl_regWrite),
    .io_data_wb_ctrl_toReg(mem_wb_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(mem_wb_ctrl_io_data_wb_ctrl_regWrite)
  );
  assign io_imem_addr = pc; // @[CPU.scala 140:16]
  assign io_imem_valid = ~hazard_IF_ID_stall; // @[CPU.scala 144:20]
  assign io_dmem_addr = ex_mem_io_data_result; // @[CPU.scala 306:21]
  assign io_dmem_valid = io_dmem_memRead | io_dmem_memWrite; // @[CPU.scala 314:37]
  assign io_dmem_writeData = ex_mem_io_data_regRData2; // @[CPU.scala 307:21]
  assign io_dmem_memRead = ex_mem_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 308:21]
  assign io_dmem_memWrite = ex_mem_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 309:21]
  assign io_dmem_maskMode = ex_mem_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 310:21]
  assign io_dmem_sext = ex_mem_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 311:21]
  assign decode_instr = {{25'd0}, if_id_io_data_instr[6:0]}; // @[CPU.scala 173:41]
  assign regs_clk = 1'h0;
  assign regs_reset = 1'h0;
  assign regs_wen = mem_wb_ctrl_io_data_wb_ctrl_regWrite & mem_wb_io_data_regWAddr != 5'h0; // @[CPU.scala 353:60]
  assign regs_regRAddr1 = if_id_io_data_instr[19:15]; // @[CPU.scala 165:32]
  assign regs_regRAddr2 = if_id_io_data_instr[24:20]; // @[CPU.scala 166:32]
  assign regs_regWAddr = mem_wb_io_data_regWAddr; // @[CPU.scala 352:20]
  assign regs_regWData = _regWData_T ? mem_wb_io_data_result : _regWData_T_2; // @[Mux.scala 98:16]
  assign aluControl_funct3 = id_ex_io_data_funct3; // @[CPU.scala 235:27]
  assign aluControl_funct7 = id_ex_io_data_funct7; // @[CPU.scala 234:27]
  assign aluControl_aluCtrlOp = id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp; // @[CPU.scala 233:27]
  assign aluControl_aluOp = 4'h0;
  assign alu_aluIn1 = id_ex_ctrl_io_data_ex_ctrl_pcAdd ? id_ex_io_data_pc : forward_input1; // @[CPU.scala 246:20]
  assign alu_aluIn2 = id_ex_ctrl_io_data_ex_ctrl_aluSrc ? id_ex_io_data_imm : forward_input2; // @[CPU.scala 260:23]
  assign alu_aluOp = aluControl_aluOp; // @[CPU.scala 263:16]
  assign pcPlus4_io_inputx = pc; // @[CPU.scala 147:21]
  assign pcPlus4_io_inputy = 32'h4; // @[CPU.scala 148:21]
  assign branchAdd_io_inputx = id_ex_io_data_pc; // @[CPU.scala 266:23]
  assign branchAdd_io_inputy = id_ex_io_data_imm; // @[CPU.scala 267:23]
  assign forwarding_rs1 = id_ex_io_data_rs1; // @[CPU.scala 229:21]
  assign forwarding_rs2 = id_ex_io_data_rs2; // @[CPU.scala 230:21]
  assign forwarding_exMemRd = ex_mem_io_data_regWAddr; // @[CPU.scala 323:29]
  assign forwarding_exMemRw = ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 324:29]
  assign forwarding_memWBRd = mem_wb_io_data_regWAddr; // @[CPU.scala 356:25]
  assign forwarding_memWBRw = mem_wb_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 357:25]
  assign hazard_rs1 = if_id_io_data_instr[19:15]; // @[CPU.scala 165:32]
  assign hazard_rs2 = if_id_io_data_instr[24:20]; // @[CPU.scala 166:32]
  assign hazard_ID_EX_memRead = id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 225:27]
  assign hazard_ID_EX_rd = id_ex_io_data_regWAddr; // @[CPU.scala 226:27]
  assign hazard_EX_MEM_taken = ex_mem_ctrl_io_data_mem_ctrl_taken; // @[CPU.scala 320:26]
  assign if_id_clock = clock;
  assign if_id_reset = reset;
  assign if_id_io_in_instr = io_imem_instr; // @[CPU.scala 155:21]
  assign if_id_io_in_pc = pc; // @[CPU.scala 156:27]
  assign if_id_io_in_pcPlus4 = pcPlus4_io_result; // @[CPU.scala 157:24]
  assign if_id_io_flush = hazard_IF_ID_flush; // @[CPU.scala 159:19]
  assign if_id_io_valid = ~hazard_IF_ID_stall; // @[CPU.scala 152:21]
  assign id_ex_clock = clock;
  assign id_ex_reset = reset;
  assign id_ex_io_in_regWAddr = if_id_io_data_instr[11:7]; // @[CPU.scala 184:48]
  assign id_ex_io_in_funct7 = if_id_io_data_instr[31:25]; // @[CPU.scala 187:48]
  assign id_ex_io_in_funct3 = if_id_io_data_instr[14:12]; // @[CPU.scala 188:48]
  assign id_ex_io_in_imm = decode_imm; // @[CPU.scala 189:26]
  assign id_ex_io_in_regRData2 = regs_regRData2; // @[CPU.scala 190:25]
  assign id_ex_io_in_regRData1 = regs_regRData1; // @[CPU.scala 191:25]
  assign id_ex_io_in_pc = if_id_io_data_pc; // @[CPU.scala 192:26]
  assign id_ex_io_in_pcPlus4 = if_id_io_data_pcPlus4; // @[CPU.scala 193:23]
  assign id_ex_io_in_rs1 = if_id_io_data_instr[19:15]; // @[CPU.scala 165:32]
  assign id_ex_io_in_rs2 = if_id_io_data_instr[24:20]; // @[CPU.scala 166:32]
  assign id_ex_ctrl_clock = clock;
  assign id_ex_ctrl_reset = reset;
  assign id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp = decode_aluCtrlOp; // @[CPU.scala 200:41]
  assign id_ex_ctrl_io_in_ex_ctrl_resultSel = decode_resultSel; // @[CPU.scala 202:41]
  assign id_ex_ctrl_io_in_ex_ctrl_aluSrc = decode_aluSrc; // @[CPU.scala 201:41]
  assign id_ex_ctrl_io_in_ex_ctrl_pcAdd = decode_pcAdd; // @[CPU.scala 203:41]
  assign id_ex_ctrl_io_in_ex_ctrl_branch = decode_branch; // @[CPU.scala 198:41]
  assign id_ex_ctrl_io_in_ex_ctrl_jump = decode_jump; // @[CPU.scala 199:41]
  assign id_ex_ctrl_io_in_mem_ctrl_memRead = decode_memRead; // @[CPU.scala 206:38]
  assign id_ex_ctrl_io_in_mem_ctrl_memWrite = decode_memWrite; // @[CPU.scala 207:38]
  assign id_ex_ctrl_io_in_mem_ctrl_maskMode = if_id_io_data_instr[13:12]; // @[CPU.scala 208:60]
  assign id_ex_ctrl_io_in_mem_ctrl_sext = ~if_id_io_data_instr[14]; // @[CPU.scala 209:41]
  assign id_ex_ctrl_io_in_wb_ctrl_toReg = decode_toReg; // @[CPU.scala 213:38]
  assign id_ex_ctrl_io_in_wb_ctrl_regWrite = decode_regWrite; // @[CPU.scala 214:38]
  assign id_ex_ctrl_io_flush = hazard_ID_EX_flush; // @[CPU.scala 218:23]
  assign ex_mem_clock = clock;
  assign ex_mem_reset = reset;
  assign ex_mem_io_in_regWAddr = id_ex_io_data_regWAddr; // @[CPU.scala 275:26]
  assign ex_mem_io_in_regRData2 = _forward_input2_T ? id_ex_io_data_regRData2 : _forward_input2_T_4; // @[Mux.scala 98:16]
  assign ex_mem_io_in_result = _ex_mem_io_in_result_T ? alu_aluOut : _ex_mem_io_in_result_T_4; // @[Mux.scala 98:16]
  assign ex_mem_io_in_nextpc = id_ex_ctrl_io_data_ex_ctrl_jump[1] ? alu_aluOut : branchAdd_io_result; // @[CPU.scala 283:29]
  assign ex_mem_ctrl_clock = clock;
  assign ex_mem_ctrl_reset = reset;
  assign ex_mem_ctrl_io_in_mem_ctrl_memRead = id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 279:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_memWrite = id_ex_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 279:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_taken = id_ex_ctrl_io_data_ex_ctrl_jump[0] | id_ex_ctrl_io_data_ex_ctrl_branch &
    alu_aluOut[0]; // @[CPU.scala 291:44]
  assign ex_mem_ctrl_io_in_mem_ctrl_maskMode = id_ex_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 279:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_sext = id_ex_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 279:30]
  assign ex_mem_ctrl_io_in_wb_ctrl_toReg = id_ex_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 280:30]
  assign ex_mem_ctrl_io_in_wb_ctrl_regWrite = id_ex_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 280:30]
  assign ex_mem_ctrl_io_flush = hazard_EX_MEM_flush; // @[CPU.scala 299:24]
  assign mem_wb_clock = clock;
  assign mem_wb_reset = reset;
  assign mem_wb_io_in_regWAddr = ex_mem_io_data_regWAddr; // @[CPU.scala 331:27]
  assign mem_wb_io_in_result = ex_mem_io_data_result; // @[CPU.scala 332:27]
  assign mem_wb_io_in_readData = io_dmem_readData; // @[CPU.scala 333:27]
  assign mem_wb_ctrl_clock = clock;
  assign mem_wb_ctrl_reset = reset;
  assign mem_wb_ctrl_io_in_wb_ctrl_toReg = ex_mem_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 339:30]
  assign mem_wb_ctrl_io_in_wb_ctrl_regWrite = ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 339:30]
  always @(posedge clock) begin
    if (reset) begin // @[CPU.scala 96:27]
      pc <= 32'h0; // @[CPU.scala 96:27]
    end else if (!(hazard_pcStall)) begin // @[CPU.scala 136:12]
      if (hazard_pcFromTaken) begin // @[CPU.scala 137:15]
        pc <= next_pc;
      end else begin
        pc <= pcPlus4_io_result;
      end
    end
  end
// Register and memory initialization
endmodule
`include "rtl/ALU.v"
`include "rtl/ALUCtrl.v"
`include "rtl/Decode.v"
`include "rtl/Defines.v"
`include "rtl/ForwardingUnit.v"
`include "rtl/Hazard.v"
`include "rtl/RegFile.v"
