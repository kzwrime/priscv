module Adder(
  input  [31:0] io_inputx,
  input  [31:0] io_inputy,
  output [31:0] io_result
);
  assign io_result = io_inputx + io_inputy; // @[OuterV.scala 176:26]
endmodule
module StageReg(// IFID IF_ID !@$%^
  input         clock,
  input         reset,
  input  [31:0] io_in_instr,
  input  [31:0] io_in_pc,
  input  [31:0] io_in_pcPlus4,
  input         io_in_noflush,
  input         io_flush,
  input         io_valid,
  output [31:0] io_data_instr,
  output [31:0] io_data_pc,
  output [31:0] io_data_pcPlus4,
  output        io_data_noflush
);
  reg [31:0] reg_instr; // @[stage-register.scala 30:21]
  reg [31:0] reg_pc; // @[stage-register.scala 30:21]
  reg [31:0] reg_pcPlus4; // @[stage-register.scala 30:21]
  reg  reg_noflush; // @[stage-register.scala 30:21]
  assign io_data_instr = reg_instr; // @[stage-register.scala 31:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 31:11]
  assign io_data_pcPlus4 = reg_pcPlus4; // @[stage-register.scala 31:11]
  assign io_data_noflush = reg_noflush; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_instr <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_instr <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_instr <= io_in_instr; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pc <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pc <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pc <= io_in_pc; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pcPlus4 <= io_in_pcPlus4; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_noflush <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_noflush <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_noflush <= io_in_noflush; // @[stage-register.scala 33:9]
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
  input         io_flush,
  input         io_valid,
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
  reg [4:0] reg_regWAddr; // @[stage-register.scala 30:21]
  reg [6:0] reg_funct7; // @[stage-register.scala 30:21]
  reg [2:0] reg_funct3; // @[stage-register.scala 30:21]
  reg [31:0] reg_imm; // @[stage-register.scala 30:21]
  reg [31:0] reg_regRData2; // @[stage-register.scala 30:21]
  reg [31:0] reg_regRData1; // @[stage-register.scala 30:21]
  reg [31:0] reg_pc; // @[stage-register.scala 30:21]
  reg [31:0] reg_pcPlus4; // @[stage-register.scala 30:21]
  reg [4:0] reg_rs1; // @[stage-register.scala 30:21]
  reg [4:0] reg_rs2; // @[stage-register.scala 30:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 31:11]
  assign io_data_funct7 = reg_funct7; // @[stage-register.scala 31:11]
  assign io_data_funct3 = reg_funct3; // @[stage-register.scala 31:11]
  assign io_data_imm = reg_imm; // @[stage-register.scala 31:11]
  assign io_data_regRData2 = reg_regRData2; // @[stage-register.scala 31:11]
  assign io_data_regRData1 = reg_regRData1; // @[stage-register.scala 31:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 31:11]
  assign io_data_pcPlus4 = reg_pcPlus4; // @[stage-register.scala 31:11]
  assign io_data_rs1 = reg_rs1; // @[stage-register.scala 31:11]
  assign io_data_rs2 = reg_rs2; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regWAddr <= io_in_regWAddr; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_funct7 <= 7'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_funct7 <= 7'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_funct7 <= io_in_funct7; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_funct3 <= 3'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_funct3 <= 3'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_funct3 <= io_in_funct3; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_imm <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_imm <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_imm <= io_in_imm; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regRData2 <= io_in_regRData2; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regRData1 <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regRData1 <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regRData1 <= io_in_regRData1; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pc <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pc <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pc <= io_in_pc; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pcPlus4 <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pcPlus4 <= io_in_pcPlus4; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_rs1 <= 5'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_rs1 <= 5'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_rs1 <= io_in_rs1; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_rs2 <= 5'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_rs2 <= 5'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_rs2 <= io_in_rs2; // @[stage-register.scala 33:9]
    end
  end
// Register and memory initialization
endmodule
module StageReg_2(
  input        clock,
  input        reset,
  input        io_in_ex_ctrl_itype,
  input  [1:0] io_in_ex_ctrl_aluCtrlOp,
  input  [1:0] io_in_ex_ctrl_resultSel,
  input        io_in_ex_ctrl_aluSrc,
  input        io_in_ex_ctrl_pcAdd,
  input        io_in_ex_ctrl_branch,
  input  [1:0] io_in_ex_ctrl_jump,
  input        io_in_mem_ctrl_memRead,
  input        io_in_mem_ctrl_memWrite,
  input        io_in_mem_ctrl_taken,
  input  [1:0] io_in_mem_ctrl_maskMode,
  input        io_in_mem_ctrl_sext,
  input        io_in_wb_ctrl_toReg,
  input        io_in_wb_ctrl_regWrite,
  input        io_in_noflush,
  input        io_flush,
  input        io_valid,
  output       io_data_ex_ctrl_itype,
  output [1:0] io_data_ex_ctrl_aluCtrlOp,
  output [1:0] io_data_ex_ctrl_resultSel,
  output       io_data_ex_ctrl_aluSrc,
  output       io_data_ex_ctrl_pcAdd,
  output       io_data_ex_ctrl_branch,
  output [1:0] io_data_ex_ctrl_jump,
  output       io_data_mem_ctrl_memRead,
  output       io_data_mem_ctrl_memWrite,
  output       io_data_mem_ctrl_taken,
  output [1:0] io_data_mem_ctrl_maskMode,
  output       io_data_mem_ctrl_sext,
  output       io_data_wb_ctrl_toReg,
  output       io_data_wb_ctrl_regWrite,
  output       io_data_noflush
);
  reg  reg_ex_ctrl_itype; // @[stage-register.scala 30:21]
  reg [1:0] reg_ex_ctrl_aluCtrlOp; // @[stage-register.scala 30:21]
  reg [1:0] reg_ex_ctrl_resultSel; // @[stage-register.scala 30:21]
  reg  reg_ex_ctrl_aluSrc; // @[stage-register.scala 30:21]
  reg  reg_ex_ctrl_pcAdd; // @[stage-register.scala 30:21]
  reg  reg_ex_ctrl_branch; // @[stage-register.scala 30:21]
  reg [1:0] reg_ex_ctrl_jump; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_memRead; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_memWrite; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_taken; // @[stage-register.scala 30:21]
  reg [1:0] reg_mem_ctrl_maskMode; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_sext; // @[stage-register.scala 30:21]
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 30:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 30:21]
  reg  reg_noflush; // @[stage-register.scala 30:21]
  assign io_data_ex_ctrl_itype = reg_ex_ctrl_itype; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_aluCtrlOp = reg_ex_ctrl_aluCtrlOp; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_resultSel = reg_ex_ctrl_resultSel; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_aluSrc = reg_ex_ctrl_aluSrc; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_pcAdd = reg_ex_ctrl_pcAdd; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_branch = reg_ex_ctrl_branch; // @[stage-register.scala 31:11]
  assign io_data_ex_ctrl_jump = reg_ex_ctrl_jump; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_memRead = reg_mem_ctrl_memRead; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_memWrite = reg_mem_ctrl_memWrite; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_taken = reg_mem_ctrl_taken; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_maskMode = reg_mem_ctrl_maskMode; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_sext = reg_mem_ctrl_sext; // @[stage-register.scala 31:11]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 31:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 31:11]
  assign io_data_noflush = reg_noflush; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_itype <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_itype <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_itype <= io_in_ex_ctrl_itype; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_aluCtrlOp <= 2'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_aluCtrlOp <= 2'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_aluCtrlOp <= io_in_ex_ctrl_aluCtrlOp; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_resultSel <= 2'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_resultSel <= 2'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_resultSel <= io_in_ex_ctrl_resultSel; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_aluSrc <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_aluSrc <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_aluSrc <= io_in_ex_ctrl_aluSrc; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_pcAdd <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_pcAdd <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_pcAdd <= io_in_ex_ctrl_pcAdd; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_branch <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_branch <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_branch <= io_in_ex_ctrl_branch; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_ex_ctrl_jump <= 2'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_ex_ctrl_jump <= 2'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_ex_ctrl_jump <= io_in_ex_ctrl_jump; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_memRead <= io_in_mem_ctrl_memRead; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_memWrite <= io_in_mem_ctrl_memWrite; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_taken <= io_in_mem_ctrl_taken; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_maskMode <= io_in_mem_ctrl_maskMode; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_sext <= io_in_mem_ctrl_sext; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_noflush <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_noflush <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_noflush <= io_in_noflush; // @[stage-register.scala 33:9]
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
  input  [31:0] io_in_pc,
  input         io_flush,
  input         io_valid,
  output [4:0]  io_data_regWAddr,
  output [31:0] io_data_regRData2,
  output [31:0] io_data_result,
  output [31:0] io_data_nextpc,
  output [31:0] io_data_pc
);
  reg [4:0] reg_regWAddr; // @[stage-register.scala 30:21]
  reg [31:0] reg_regRData2; // @[stage-register.scala 30:21]
  reg [31:0] reg_result; // @[stage-register.scala 30:21]
  reg [31:0] reg_nextpc; // @[stage-register.scala 30:21]
  reg [31:0] reg_pc; // @[stage-register.scala 30:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 31:11]
  assign io_data_regRData2 = reg_regRData2; // @[stage-register.scala 31:11]
  assign io_data_result = reg_result; // @[stage-register.scala 31:11]
  assign io_data_nextpc = reg_nextpc; // @[stage-register.scala 31:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regWAddr <= io_in_regWAddr; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regRData2 <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regRData2 <= io_in_regRData2; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_result <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_result <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_result <= io_in_result; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_nextpc <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_nextpc <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_nextpc <= io_in_nextpc; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pc <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pc <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pc <= io_in_pc; // @[stage-register.scala 33:9]
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
  input        io_in_noflush,
  input        io_flush,
  input        io_valid,
  output       io_data_mem_ctrl_memRead,
  output       io_data_mem_ctrl_memWrite,
  output       io_data_mem_ctrl_taken,
  output [1:0] io_data_mem_ctrl_maskMode,
  output       io_data_mem_ctrl_sext,
  output       io_data_wb_ctrl_toReg,
  output       io_data_wb_ctrl_regWrite,
  output       io_data_noflush
);
  reg  reg_mem_ctrl_memRead; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_memWrite; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_taken; // @[stage-register.scala 30:21]
  reg [1:0] reg_mem_ctrl_maskMode; // @[stage-register.scala 30:21]
  reg  reg_mem_ctrl_sext; // @[stage-register.scala 30:21]
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 30:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 30:21]
  reg  reg_noflush; // @[stage-register.scala 30:21]
  assign io_data_mem_ctrl_memRead = reg_mem_ctrl_memRead; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_memWrite = reg_mem_ctrl_memWrite; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_taken = reg_mem_ctrl_taken; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_maskMode = reg_mem_ctrl_maskMode; // @[stage-register.scala 31:11]
  assign io_data_mem_ctrl_sext = reg_mem_ctrl_sext; // @[stage-register.scala 31:11]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 31:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 31:11]
  assign io_data_noflush = reg_noflush; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_memRead <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_memRead <= io_in_mem_ctrl_memRead; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_memWrite <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_memWrite <= io_in_mem_ctrl_memWrite; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_taken <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_taken <= io_in_mem_ctrl_taken; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_maskMode <= 2'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_maskMode <= io_in_mem_ctrl_maskMode; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_mem_ctrl_sext <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_mem_ctrl_sext <= io_in_mem_ctrl_sext; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_noflush <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_noflush <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_noflush <= io_in_noflush; // @[stage-register.scala 33:9]
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
  input  [31:0] io_in_pc,
  input         io_flush,
  input         io_valid,
  output [4:0]  io_data_regWAddr,
  output [31:0] io_data_result,
  output [31:0] io_data_readData,
  output [31:0] io_data_pc
);
  reg [4:0] reg_regWAddr; // @[stage-register.scala 30:21]
  reg [31:0] reg_result; // @[stage-register.scala 30:21]
  reg [31:0] reg_readData; // @[stage-register.scala 30:21]
  reg [31:0] reg_pc; // @[stage-register.scala 30:21]
  assign io_data_regWAddr = reg_regWAddr; // @[stage-register.scala 31:11]
  assign io_data_result = reg_result; // @[stage-register.scala 31:11]
  assign io_data_readData = reg_readData; // @[stage-register.scala 31:11]
  assign io_data_pc = reg_pc; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_regWAddr <= 5'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_regWAddr <= io_in_regWAddr; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_result <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_result <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_result <= io_in_result; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_readData <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_readData <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_readData <= io_in_readData; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_pc <= 32'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_pc <= 32'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_pc <= io_in_pc; // @[stage-register.scala 33:9]
    end
  end
// Register and memory initialization
endmodule
module StageReg_6(
  input   clock,
  input   reset,
  input   io_in_wb_ctrl_toReg,
  input   io_in_wb_ctrl_regWrite,
  input   io_in_noflush,
  input   io_flush,
  input   io_valid,
  output  io_data_wb_ctrl_toReg,
  output  io_data_wb_ctrl_regWrite,
  output  io_data_noflush
);
  reg  reg_wb_ctrl_toReg; // @[stage-register.scala 30:21]
  reg  reg_wb_ctrl_regWrite; // @[stage-register.scala 30:21]
  reg  reg_noflush; // @[stage-register.scala 30:21]
  assign io_data_wb_ctrl_toReg = reg_wb_ctrl_toReg; // @[stage-register.scala 31:11]
  assign io_data_wb_ctrl_regWrite = reg_wb_ctrl_regWrite; // @[stage-register.scala 31:11]
  assign io_data_noflush = reg_noflush; // @[stage-register.scala 31:11]
  always @(posedge clock) begin
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_toReg <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_toReg <= io_in_wb_ctrl_toReg; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_wb_ctrl_regWrite <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_wb_ctrl_regWrite <= io_in_wb_ctrl_regWrite; // @[stage-register.scala 33:9]
    end
    if (reset) begin // @[stage-register.scala 30:21]
      reg_noflush <= 1'h0; // @[stage-register.scala 30:21]
    end else if (io_flush) begin // @[stage-register.scala 35:19]
      reg_noflush <= 1'h0; // @[stage-register.scala 36:9]
    end else if (io_valid) begin // @[stage-register.scala 32:19]
      reg_noflush <= io_in_noflush; // @[stage-register.scala 33:9]
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
  input  [31:0] io_dmem_readData,
  output [31:0] io_dmem_readBack,
  input  [7:0]  io_int
);
  wire [31:0] decode_instr; // @[CPU.scala 104:26]
  wire  decode_branch; // @[CPU.scala 104:26]
  wire [1:0] decode_jump; // @[CPU.scala 104:26]
  wire  decode_memRead; // @[CPU.scala 104:26]
  wire  decode_memWrite; // @[CPU.scala 104:26]
  wire  decode_regWrite; // @[CPU.scala 104:26]
  wire  decode_toReg; // @[CPU.scala 104:26]
  wire [1:0] decode_resultSel; // @[CPU.scala 104:26]
  wire  decode_aluSrc; // @[CPU.scala 104:26]
  wire  decode_pcAdd; // @[CPU.scala 104:26]
  wire [6:0] decode_types; // @[CPU.scala 104:26]
  wire [1:0] decode_aluCtrlOp; // @[CPU.scala 104:26]
  wire  decode_validInst; // @[CPU.scala 104:26]
  wire [31:0] decode_imm; // @[CPU.scala 104:26]
  wire  regs_clk; // @[CPU.scala 105:26]
  wire  regs_reset; // @[CPU.scala 105:26]
  wire  regs_wen; // @[CPU.scala 105:26]
  wire [4:0] regs_regRAddr1; // @[CPU.scala 105:26]
  wire [4:0] regs_regRAddr2; // @[CPU.scala 105:26]
  wire [4:0] regs_regWAddr; // @[CPU.scala 105:26]
  wire [31:0] regs_regWData; // @[CPU.scala 105:26]
  wire [31:0] regs_regRData1; // @[CPU.scala 105:26]
  wire [31:0] regs_regRData2; // @[CPU.scala 105:26]
  wire [2:0] aluControl_funct3; // @[CPU.scala 106:26]
  wire [6:0] aluControl_funct7; // @[CPU.scala 106:26]
  wire  aluControl_itype; // @[CPU.scala 106:26]
  wire [1:0] aluControl_aluCtrlOp; // @[CPU.scala 106:26]
  wire [3:0] aluControl_aluOp; // @[CPU.scala 106:26]
  wire [31:0] alu_aluIn1; // @[CPU.scala 107:26]
  wire [31:0] alu_aluIn2; // @[CPU.scala 107:26]
  wire [3:0] alu_aluOp; // @[CPU.scala 107:26]
  wire [31:0] alu_aluOut; // @[CPU.scala 107:26]
  wire [31:0] pcPlus4_io_inputx; // @[CPU.scala 108:26]
  wire [31:0] pcPlus4_io_inputy; // @[CPU.scala 108:26]
  wire [31:0] pcPlus4_io_result; // @[CPU.scala 108:26]
  wire [31:0] branchAdd_io_inputx; // @[CPU.scala 109:26]
  wire [31:0] branchAdd_io_inputy; // @[CPU.scala 109:26]
  wire [31:0] branchAdd_io_result; // @[CPU.scala 109:26]
  wire [4:0] forwarding_rs1; // @[CPU.scala 110:26]
  wire [4:0] forwarding_rs2; // @[CPU.scala 110:26]
  wire [4:0] forwarding_exMemRd; // @[CPU.scala 110:26]
  wire  forwarding_exMemRw; // @[CPU.scala 110:26]
  wire [4:0] forwarding_memWBRd; // @[CPU.scala 110:26]
  wire  forwarding_memWBRw; // @[CPU.scala 110:26]
  wire [1:0] forwarding_forwardA; // @[CPU.scala 110:26]
  wire [1:0] forwarding_forwardB; // @[CPU.scala 110:26]
  wire [4:0] hazard_rs1; // @[CPU.scala 111:26]
  wire [4:0] hazard_rs2; // @[CPU.scala 111:26]
  wire  hazard_ID_EX_memRead; // @[CPU.scala 111:26]
  wire [4:0] hazard_ID_EX_rd; // @[CPU.scala 111:26]
  wire  hazard_EX_MEM_taken; // @[CPU.scala 111:26]
  wire  hazard_ID_EX_memAccess; // @[CPU.scala 111:26]
  wire  hazard_EX_MEM_need_stall; // @[CPU.scala 111:26]
  wire  hazard_pcFromTaken; // @[CPU.scala 111:26]
  wire  hazard_pcStall; // @[CPU.scala 111:26]
  wire  hazard_IF_ID_stall; // @[CPU.scala 111:26]
  wire  hazard_ID_EX_stall; // @[CPU.scala 111:26]
  wire  hazard_ID_EX_flush; // @[CPU.scala 111:26]
  wire  hazard_EX_MEM_flush; // @[CPU.scala 111:26]
  wire  hazard_IF_ID_flush; // @[CPU.scala 111:26]
  wire [31:0] predicter_instr; // @[CPU.scala 112:26]
  wire [31:0] predicter_pc; // @[CPU.scala 112:26]
  wire [31:0] predicter_predicted_pc; // @[CPU.scala 112:26]
  wire  if_id_clock; // @[CPU.scala 118:27]
  wire  if_id_reset; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_in_instr; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_in_pc; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_in_pcPlus4; // @[CPU.scala 118:27]
  wire  if_id_io_in_noflush; // @[CPU.scala 118:27]
  wire  if_id_io_flush; // @[CPU.scala 118:27]
  wire  if_id_io_valid; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_data_instr; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_data_pc; // @[CPU.scala 118:27]
  wire [31:0] if_id_io_data_pcPlus4; // @[CPU.scala 118:27]
  wire  if_id_io_data_noflush; // @[CPU.scala 118:27]
  wire  id_ex_clock; // @[CPU.scala 120:27]
  wire  id_ex_reset; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_in_regWAddr; // @[CPU.scala 120:27]
  wire [6:0] id_ex_io_in_funct7; // @[CPU.scala 120:27]
  wire [2:0] id_ex_io_in_funct3; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_in_imm; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_in_regRData2; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_in_regRData1; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_in_pc; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_in_pcPlus4; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_in_rs1; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_in_rs2; // @[CPU.scala 120:27]
  wire  id_ex_io_flush; // @[CPU.scala 120:27]
  wire  id_ex_io_valid; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_data_regWAddr; // @[CPU.scala 120:27]
  wire [6:0] id_ex_io_data_funct7; // @[CPU.scala 120:27]
  wire [2:0] id_ex_io_data_funct3; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_data_imm; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_data_regRData2; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_data_regRData1; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_data_pc; // @[CPU.scala 120:27]
  wire [31:0] id_ex_io_data_pcPlus4; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_data_rs1; // @[CPU.scala 120:27]
  wire [4:0] id_ex_io_data_rs2; // @[CPU.scala 120:27]
  wire  id_ex_ctrl_clock; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_reset; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_itype; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_resultSel; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_aluSrc; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_pcAdd; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_ex_ctrl_branch; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_in_ex_ctrl_jump; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_memRead; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_memWrite; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_taken; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_in_mem_ctrl_maskMode; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_mem_ctrl_sext; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_in_noflush; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_flush; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_valid; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_itype; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_resultSel; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_aluSrc; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_pcAdd; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_ex_ctrl_branch; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_data_ex_ctrl_jump; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_taken; // @[CPU.scala 121:27]
  wire [1:0] id_ex_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 121:27]
  wire  id_ex_ctrl_io_data_noflush; // @[CPU.scala 121:27]
  wire  ex_mem_clock; // @[CPU.scala 123:27]
  wire  ex_mem_reset; // @[CPU.scala 123:27]
  wire [4:0] ex_mem_io_in_regWAddr; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_in_regRData2; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_in_result; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_in_nextpc; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_in_pc; // @[CPU.scala 123:27]
  wire  ex_mem_io_flush; // @[CPU.scala 123:27]
  wire  ex_mem_io_valid; // @[CPU.scala 123:27]
  wire [4:0] ex_mem_io_data_regWAddr; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_data_regRData2; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_data_result; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_data_nextpc; // @[CPU.scala 123:27]
  wire [31:0] ex_mem_io_data_pc; // @[CPU.scala 123:27]
  wire  ex_mem_ctrl_clock; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_reset; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_memRead; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_memWrite; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_taken; // @[CPU.scala 124:27]
  wire [1:0] ex_mem_ctrl_io_in_mem_ctrl_maskMode; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_mem_ctrl_sext; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_in_noflush; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_flush; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_valid; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_taken; // @[CPU.scala 124:27]
  wire [1:0] ex_mem_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 124:27]
  wire  ex_mem_ctrl_io_data_noflush; // @[CPU.scala 124:27]
  wire  mem_wb_clock; // @[CPU.scala 126:27]
  wire  mem_wb_reset; // @[CPU.scala 126:27]
  wire [4:0] mem_wb_io_in_regWAddr; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_in_result; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_in_readData; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_in_pc; // @[CPU.scala 126:27]
  wire  mem_wb_io_flush; // @[CPU.scala 126:27]
  wire  mem_wb_io_valid; // @[CPU.scala 126:27]
  wire [4:0] mem_wb_io_data_regWAddr; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_data_result; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_data_readData; // @[CPU.scala 126:27]
  wire [31:0] mem_wb_io_data_pc; // @[CPU.scala 126:27]
  wire  mem_wb_ctrl_clock; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_reset; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_in_wb_ctrl_toReg; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_in_wb_ctrl_regWrite; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_in_noflush; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_flush; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_valid; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 130:27]
  wire  mem_wb_ctrl_io_data_noflush; // @[CPU.scala 130:27]
  reg [31:0] pc; // @[CPU.scala 103:27]
  wire [31:0] _next_pc_T_2 = alu_aluOut[0] ? branchAdd_io_result : id_ex_io_data_pcPlus4; // @[CPU.scala 305:17]
  wire  _forward_input1_T = forwarding_forwardA == 2'h0; // @[CPU.scala 260:52]
  wire  _forward_input1_T_1 = forwarding_forwardA == 2'h1; // @[CPU.scala 261:52]
  wire  _forward_input1_T_2 = forwarding_forwardA == 2'h2; // @[CPU.scala 262:52]
  wire  _regWData_T = ~mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 401:63]
  wire  _regWData_T_1 = mem_wb_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 402:63]
  wire [31:0] _regWData_T_2 = _regWData_T_1 ? mem_wb_io_data_readData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] regWData = _regWData_T ? mem_wb_io_data_result : _regWData_T_2; // @[Mux.scala 98:16]
  wire [31:0] _forward_input1_T_3 = _forward_input1_T_2 ? regWData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _forward_input1_T_4 = _forward_input1_T_1 ? ex_mem_io_data_result : _forward_input1_T_3; // @[Mux.scala 98:16]
  wire [31:0] forward_input1 = _forward_input1_T ? id_ex_io_data_regRData1 : _forward_input1_T_4; // @[Mux.scala 98:16]
  wire  _forward_input2_T = forwarding_forwardB == 2'h0; // @[CPU.scala 272:52]
  wire  _forward_input2_T_1 = forwarding_forwardB == 2'h1; // @[CPU.scala 273:52]
  wire  _forward_input2_T_2 = forwarding_forwardB == 2'h2; // @[CPU.scala 274:52]
  wire [31:0] _forward_input2_T_3 = _forward_input2_T_2 ? regWData : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _forward_input2_T_4 = _forward_input2_T_1 ? ex_mem_io_data_result : _forward_input2_T_3; // @[Mux.scala 98:16]
  wire [31:0] forward_input2 = _forward_input2_T ? id_ex_io_data_regRData2 : _forward_input2_T_4; // @[Mux.scala 98:16]
  wire  _ex_mem_io_in_result_T = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h0; // @[CPU.scala 309:66]
  wire  _ex_mem_io_in_result_T_1 = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h1; // @[CPU.scala 310:66]
  wire  _ex_mem_io_in_result_T_2 = id_ex_ctrl_io_data_ex_ctrl_resultSel == 2'h2; // @[CPU.scala 311:66]
  wire [31:0] _ex_mem_io_in_result_T_3 = _ex_mem_io_in_result_T_2 ? id_ex_io_data_pcPlus4 : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _ex_mem_io_in_result_T_4 = _ex_mem_io_in_result_T_1 ? id_ex_io_data_imm : _ex_mem_io_in_result_T_3; // @[Mux.scala 98:16]
  wire  _T_4 = alu_aluOut[0] & ~id_ex_io_data_imm[31]; // @[CPU.scala 317:23]
  wire  _T_9 = _T_4 | ~alu_aluOut[0] & id_ex_io_data_imm[31]; // @[CPU.scala 318:3]
  wire  _T_10 = id_ex_ctrl_io_data_ex_ctrl_branch & _T_9; // @[CPU.scala 317:3]
  wire  dmem_sb_sh = ex_mem_ctrl_io_data_mem_ctrl_memWrite & (ex_mem_ctrl_io_data_mem_ctrl_maskMode == 2'h0 |
    ex_mem_ctrl_io_data_mem_ctrl_maskMode == 2'h1); // @[CPU.scala 340:58]
  reg  old_dmem_sb_sh; // @[CPU.scala 341:35]
  reg [31:0] old_dmem_addr; // @[CPU.scala 343:35]
  reg [31:0] old_dmem_writeData; // @[CPU.scala 344:35]
  reg  old_dmem_memWrite; // @[CPU.scala 346:35]
  reg [1:0] old_dmem_maskMode; // @[CPU.scala 347:35]
  reg  old_dmem_sext; // @[CPU.scala 348:35]
  reg [31:0] old_dmem_readData; // @[CPU.scala 350:35]
  wire [31:0] _io_dmem_addr_T = ex_mem_io_data_result; // @[CPU.scala 357:66]
  wire [31:0] _io_dmem_writeData_T = dmem_sb_sh ? 32'h0 : ex_mem_io_data_regRData2; // @[CPU.scala 358:67]
  wire  _io_dmem_memWrite_T = dmem_sb_sh ? 1'h0 : ex_mem_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 360:66]
  wire [1:0] _io_dmem_maskMode_T = dmem_sb_sh ? 2'h2 : ex_mem_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 361:66]
  Decode decode ( // @[CPU.scala 104:26]
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
  RegFile regs ( // @[CPU.scala 105:26]
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
  ALUCtrl aluControl ( // @[CPU.scala 106:26]
    .funct3(aluControl_funct3),
    .funct7(aluControl_funct7),
    .itype(aluControl_itype),
    .aluCtrlOp(aluControl_aluCtrlOp),
    .aluOp(aluControl_aluOp)
  );
  ALU alu ( // @[CPU.scala 107:26]
    .aluIn1(alu_aluIn1),
    .aluIn2(alu_aluIn2),
    .aluOp(alu_aluOp),
    .aluOut(alu_aluOut)
  );
  Adder pcPlus4 ( // @[CPU.scala 108:26]
    .io_inputx(pcPlus4_io_inputx),
    .io_inputy(pcPlus4_io_inputy),
    .io_result(pcPlus4_io_result)
  );
  Adder branchAdd ( // @[CPU.scala 109:26]
    .io_inputx(branchAdd_io_inputx),
    .io_inputy(branchAdd_io_inputy),
    .io_result(branchAdd_io_result)
  );
  ForwardingUnit forwarding ( // @[CPU.scala 110:26]
    .rs1(forwarding_rs1),
    .rs2(forwarding_rs2),
    .exMemRd(forwarding_exMemRd),
    .exMemRw(forwarding_exMemRw),
    .memWBRd(forwarding_memWBRd),
    .memWBRw(forwarding_memWBRw),
    .forwardA(forwarding_forwardA),
    .forwardB(forwarding_forwardB)
  );
  HazardUnit hazard ( // @[CPU.scala 111:26]
    .rs1(hazard_rs1),
    .rs2(hazard_rs2),
    .ID_EX_memRead(hazard_ID_EX_memRead),
    .ID_EX_rd(hazard_ID_EX_rd),
    .EX_MEM_taken(hazard_EX_MEM_taken),
    .ID_EX_memAccess(hazard_ID_EX_memAccess),
    .EX_MEM_need_stall(hazard_EX_MEM_need_stall),
    .pcFromTaken(hazard_pcFromTaken),
    .pcStall(hazard_pcStall),
    .IF_ID_stall(hazard_IF_ID_stall),
    .ID_EX_stall(hazard_ID_EX_stall),
    .ID_EX_flush(hazard_ID_EX_flush),
    .EX_MEM_flush(hazard_EX_MEM_flush),
    .IF_ID_flush(hazard_IF_ID_flush)
  );
  Predicter predicter ( // @[CPU.scala 112:26]
    .instr(predicter_instr),
    .pc(predicter_pc),
    .predicted_pc(predicter_predicted_pc)
  );
  StageReg if_id ( // @[CPU.scala 118:27]
    .clock(if_id_clock),
    .reset(if_id_reset),
    .io_in_instr(if_id_io_in_instr),
    .io_in_pc(if_id_io_in_pc),
    .io_in_pcPlus4(if_id_io_in_pcPlus4),
    .io_in_noflush(if_id_io_in_noflush),
    .io_flush(if_id_io_flush),
    .io_valid(if_id_io_valid),
    .io_data_instr(if_id_io_data_instr),
    .io_data_pc(if_id_io_data_pc),
    .io_data_pcPlus4(if_id_io_data_pcPlus4),
    .io_data_noflush(if_id_io_data_noflush)
  );
  StageReg_1 id_ex ( // @[CPU.scala 120:27]
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
    .io_flush(id_ex_io_flush),
    .io_valid(id_ex_io_valid),
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
  StageReg_2 id_ex_ctrl ( // @[CPU.scala 121:27]
    .clock(id_ex_ctrl_clock),
    .reset(id_ex_ctrl_reset),
    .io_in_ex_ctrl_itype(id_ex_ctrl_io_in_ex_ctrl_itype),
    .io_in_ex_ctrl_aluCtrlOp(id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp),
    .io_in_ex_ctrl_resultSel(id_ex_ctrl_io_in_ex_ctrl_resultSel),
    .io_in_ex_ctrl_aluSrc(id_ex_ctrl_io_in_ex_ctrl_aluSrc),
    .io_in_ex_ctrl_pcAdd(id_ex_ctrl_io_in_ex_ctrl_pcAdd),
    .io_in_ex_ctrl_branch(id_ex_ctrl_io_in_ex_ctrl_branch),
    .io_in_ex_ctrl_jump(id_ex_ctrl_io_in_ex_ctrl_jump),
    .io_in_mem_ctrl_memRead(id_ex_ctrl_io_in_mem_ctrl_memRead),
    .io_in_mem_ctrl_memWrite(id_ex_ctrl_io_in_mem_ctrl_memWrite),
    .io_in_mem_ctrl_taken(id_ex_ctrl_io_in_mem_ctrl_taken),
    .io_in_mem_ctrl_maskMode(id_ex_ctrl_io_in_mem_ctrl_maskMode),
    .io_in_mem_ctrl_sext(id_ex_ctrl_io_in_mem_ctrl_sext),
    .io_in_wb_ctrl_toReg(id_ex_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(id_ex_ctrl_io_in_wb_ctrl_regWrite),
    .io_in_noflush(id_ex_ctrl_io_in_noflush),
    .io_flush(id_ex_ctrl_io_flush),
    .io_valid(id_ex_ctrl_io_valid),
    .io_data_ex_ctrl_itype(id_ex_ctrl_io_data_ex_ctrl_itype),
    .io_data_ex_ctrl_aluCtrlOp(id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp),
    .io_data_ex_ctrl_resultSel(id_ex_ctrl_io_data_ex_ctrl_resultSel),
    .io_data_ex_ctrl_aluSrc(id_ex_ctrl_io_data_ex_ctrl_aluSrc),
    .io_data_ex_ctrl_pcAdd(id_ex_ctrl_io_data_ex_ctrl_pcAdd),
    .io_data_ex_ctrl_branch(id_ex_ctrl_io_data_ex_ctrl_branch),
    .io_data_ex_ctrl_jump(id_ex_ctrl_io_data_ex_ctrl_jump),
    .io_data_mem_ctrl_memRead(id_ex_ctrl_io_data_mem_ctrl_memRead),
    .io_data_mem_ctrl_memWrite(id_ex_ctrl_io_data_mem_ctrl_memWrite),
    .io_data_mem_ctrl_taken(id_ex_ctrl_io_data_mem_ctrl_taken),
    .io_data_mem_ctrl_maskMode(id_ex_ctrl_io_data_mem_ctrl_maskMode),
    .io_data_mem_ctrl_sext(id_ex_ctrl_io_data_mem_ctrl_sext),
    .io_data_wb_ctrl_toReg(id_ex_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(id_ex_ctrl_io_data_wb_ctrl_regWrite),
    .io_data_noflush(id_ex_ctrl_io_data_noflush)
  );
  StageReg_3 ex_mem ( // @[CPU.scala 123:27]
    .clock(ex_mem_clock),
    .reset(ex_mem_reset),
    .io_in_regWAddr(ex_mem_io_in_regWAddr),
    .io_in_regRData2(ex_mem_io_in_regRData2),
    .io_in_result(ex_mem_io_in_result),
    .io_in_nextpc(ex_mem_io_in_nextpc),
    .io_in_pc(ex_mem_io_in_pc),
    .io_flush(ex_mem_io_flush),
    .io_valid(ex_mem_io_valid),
    .io_data_regWAddr(ex_mem_io_data_regWAddr),
    .io_data_regRData2(ex_mem_io_data_regRData2),
    .io_data_result(ex_mem_io_data_result),
    .io_data_nextpc(ex_mem_io_data_nextpc),
    .io_data_pc(ex_mem_io_data_pc)
  );
  StageReg_4 ex_mem_ctrl ( // @[CPU.scala 124:27]
    .clock(ex_mem_ctrl_clock),
    .reset(ex_mem_ctrl_reset),
    .io_in_mem_ctrl_memRead(ex_mem_ctrl_io_in_mem_ctrl_memRead),
    .io_in_mem_ctrl_memWrite(ex_mem_ctrl_io_in_mem_ctrl_memWrite),
    .io_in_mem_ctrl_taken(ex_mem_ctrl_io_in_mem_ctrl_taken),
    .io_in_mem_ctrl_maskMode(ex_mem_ctrl_io_in_mem_ctrl_maskMode),
    .io_in_mem_ctrl_sext(ex_mem_ctrl_io_in_mem_ctrl_sext),
    .io_in_wb_ctrl_toReg(ex_mem_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(ex_mem_ctrl_io_in_wb_ctrl_regWrite),
    .io_in_noflush(ex_mem_ctrl_io_in_noflush),
    .io_flush(ex_mem_ctrl_io_flush),
    .io_valid(ex_mem_ctrl_io_valid),
    .io_data_mem_ctrl_memRead(ex_mem_ctrl_io_data_mem_ctrl_memRead),
    .io_data_mem_ctrl_memWrite(ex_mem_ctrl_io_data_mem_ctrl_memWrite),
    .io_data_mem_ctrl_taken(ex_mem_ctrl_io_data_mem_ctrl_taken),
    .io_data_mem_ctrl_maskMode(ex_mem_ctrl_io_data_mem_ctrl_maskMode),
    .io_data_mem_ctrl_sext(ex_mem_ctrl_io_data_mem_ctrl_sext),
    .io_data_wb_ctrl_toReg(ex_mem_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(ex_mem_ctrl_io_data_wb_ctrl_regWrite),
    .io_data_noflush(ex_mem_ctrl_io_data_noflush)
  );
  StageReg_5 mem_wb ( // @[CPU.scala 126:27]
    .clock(mem_wb_clock),
    .reset(mem_wb_reset),
    .io_in_regWAddr(mem_wb_io_in_regWAddr),
    .io_in_result(mem_wb_io_in_result),
    .io_in_readData(mem_wb_io_in_readData),
    .io_in_pc(mem_wb_io_in_pc),
    .io_flush(mem_wb_io_flush),
    .io_valid(mem_wb_io_valid),
    .io_data_regWAddr(mem_wb_io_data_regWAddr),
    .io_data_result(mem_wb_io_data_result),
    .io_data_readData(mem_wb_io_data_readData),
    .io_data_pc(mem_wb_io_data_pc)
  );
  StageReg_6 mem_wb_ctrl ( // @[CPU.scala 130:27]
    .clock(mem_wb_ctrl_clock),
    .reset(mem_wb_ctrl_reset),
    .io_in_wb_ctrl_toReg(mem_wb_ctrl_io_in_wb_ctrl_toReg),
    .io_in_wb_ctrl_regWrite(mem_wb_ctrl_io_in_wb_ctrl_regWrite),
    .io_in_noflush(mem_wb_ctrl_io_in_noflush),
    .io_flush(mem_wb_ctrl_io_flush),
    .io_valid(mem_wb_ctrl_io_valid),
    .io_data_wb_ctrl_toReg(mem_wb_ctrl_io_data_wb_ctrl_toReg),
    .io_data_wb_ctrl_regWrite(mem_wb_ctrl_io_data_wb_ctrl_regWrite),
    .io_data_noflush(mem_wb_ctrl_io_data_noflush)
  );
  assign io_imem_addr = pc; // @[CPU.scala 156:16]
  assign io_imem_valid = ~hazard_IF_ID_stall; // @[CPU.scala 160:20]
  assign io_dmem_addr = old_dmem_sb_sh ? old_dmem_addr : _io_dmem_addr_T; // @[CPU.scala 357:27]
  assign io_dmem_valid = old_dmem_sb_sh | (io_dmem_memRead | io_dmem_memWrite); // @[CPU.scala 367:27]
  assign io_dmem_writeData = old_dmem_sb_sh ? old_dmem_writeData : _io_dmem_writeData_T; // @[CPU.scala 358:27]
  assign io_dmem_memRead = old_dmem_sb_sh ? 1'h0 : dmem_sb_sh | ex_mem_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 359:27]
  assign io_dmem_memWrite = old_dmem_sb_sh ? old_dmem_memWrite : _io_dmem_memWrite_T; // @[CPU.scala 360:27]
  assign io_dmem_maskMode = old_dmem_sb_sh ? old_dmem_maskMode : _io_dmem_maskMode_T; // @[CPU.scala 361:27]
  assign io_dmem_sext = old_dmem_sb_sh ? old_dmem_sext : dmem_sb_sh | ex_mem_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 363:27]
  assign io_dmem_readBack = old_dmem_sb_sh ? old_dmem_readData : 32'hffffffff; // @[CPU.scala 365:27]
  assign decode_instr = if_id_io_data_instr; // @[CPU.scala 192:19]
  assign regs_clk = clock; // @[CPU.scala 116:19]
  assign regs_reset = reset; // @[CPU.scala 115:19]
  assign regs_wen = mem_wb_ctrl_io_data_wb_ctrl_regWrite & mem_wb_io_data_regWAddr != 5'h0; // @[CPU.scala 407:60]
  assign regs_regRAddr1 = if_id_io_data_instr[19:15]; // @[CPU.scala 184:32]
  assign regs_regRAddr2 = if_id_io_data_instr[24:20]; // @[CPU.scala 185:32]
  assign regs_regWAddr = mem_wb_io_data_regWAddr; // @[CPU.scala 406:20]
  assign regs_regWData = _regWData_T ? mem_wb_io_data_result : _regWData_T_2; // @[Mux.scala 98:16]
  assign aluControl_funct3 = id_ex_io_data_funct3; // @[CPU.scala 255:27]
  assign aluControl_funct7 = id_ex_io_data_funct7; // @[CPU.scala 254:27]
  assign aluControl_itype = id_ex_ctrl_io_data_ex_ctrl_itype; // @[CPU.scala 256:27]
  assign aluControl_aluCtrlOp = id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp; // @[CPU.scala 253:27]
  assign alu_aluIn1 = id_ex_ctrl_io_data_ex_ctrl_pcAdd ? id_ex_io_data_pc : forward_input1; // @[CPU.scala 266:20]
  assign alu_aluIn2 = id_ex_ctrl_io_data_ex_ctrl_aluSrc ? id_ex_io_data_imm : forward_input2; // @[CPU.scala 280:23]
  assign alu_aluOp = aluControl_aluOp; // @[CPU.scala 283:16]
  assign pcPlus4_io_inputx = pc; // @[CPU.scala 163:21]
  assign pcPlus4_io_inputy = 32'h4; // @[CPU.scala 164:21]
  assign branchAdd_io_inputx = id_ex_io_data_pc; // @[CPU.scala 286:23]
  assign branchAdd_io_inputy = id_ex_io_data_imm; // @[CPU.scala 287:23]
  assign forwarding_rs1 = id_ex_io_data_rs1; // @[CPU.scala 249:21]
  assign forwarding_rs2 = id_ex_io_data_rs2; // @[CPU.scala 250:21]
  assign forwarding_exMemRd = ex_mem_io_data_regWAddr; // @[CPU.scala 377:29]
  assign forwarding_exMemRw = ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 378:29]
  assign forwarding_memWBRd = mem_wb_io_data_regWAddr; // @[CPU.scala 410:25]
  assign forwarding_memWBRw = mem_wb_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 411:25]
  assign hazard_rs1 = if_id_io_data_instr[19:15]; // @[CPU.scala 184:32]
  assign hazard_rs2 = if_id_io_data_instr[24:20]; // @[CPU.scala 185:32]
  assign hazard_ID_EX_memRead = id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 244:27]
  assign hazard_ID_EX_rd = id_ex_io_data_regWAddr; // @[CPU.scala 245:27]
  assign hazard_EX_MEM_taken = id_ex_ctrl_io_data_ex_ctrl_jump[0] | _T_10; // @[CPU.scala 316:3]
  assign hazard_ID_EX_memAccess = id_ex_ctrl_io_data_mem_ctrl_memRead | id_ex_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 246:68]
  assign hazard_EX_MEM_need_stall = ex_mem_ctrl_io_data_mem_ctrl_memWrite & (ex_mem_ctrl_io_data_mem_ctrl_maskMode == 2'h0
     | ex_mem_ctrl_io_data_mem_ctrl_maskMode == 2'h1); // @[CPU.scala 340:58]
  assign predicter_instr = io_imem_instr; // @[CPU.scala 177:22]
  assign predicter_pc = pc; // @[CPU.scala 178:22]
  assign if_id_clock = clock;
  assign if_id_reset = reset;
  assign if_id_io_in_instr = io_imem_instr; // @[CPU.scala 171:23]
  assign if_id_io_in_pc = pc; // @[CPU.scala 172:23]
  assign if_id_io_in_pcPlus4 = pcPlus4_io_result; // @[CPU.scala 173:23]
  assign if_id_io_in_noflush = 1'h1; // @[CPU.scala 141:23]
  assign if_id_io_flush = hazard_IF_ID_flush; // @[CPU.scala 175:19]
  assign if_id_io_valid = ~hazard_IF_ID_stall; // @[CPU.scala 168:21]
  assign id_ex_clock = clock;
  assign id_ex_reset = reset;
  assign id_ex_io_in_regWAddr = if_id_io_data_instr[11:7]; // @[CPU.scala 204:47]
  assign id_ex_io_in_funct7 = if_id_io_data_instr[31:25]; // @[CPU.scala 207:47]
  assign id_ex_io_in_funct3 = if_id_io_data_instr[14:12]; // @[CPU.scala 208:47]
  assign id_ex_io_in_imm = decode_imm; // @[CPU.scala 209:25]
  assign id_ex_io_in_regRData2 = regs_regRData2; // @[CPU.scala 210:25]
  assign id_ex_io_in_regRData1 = regs_regRData1; // @[CPU.scala 211:25]
  assign id_ex_io_in_pc = if_id_io_data_pc; // @[CPU.scala 212:25]
  assign id_ex_io_in_pcPlus4 = if_id_io_data_pcPlus4; // @[CPU.scala 213:25]
  assign id_ex_io_in_rs1 = if_id_io_data_instr[19:15]; // @[CPU.scala 184:32]
  assign id_ex_io_in_rs2 = if_id_io_data_instr[24:20]; // @[CPU.scala 185:32]
  assign id_ex_io_flush = hazard_ID_EX_flush; // @[CPU.scala 202:18]
  assign id_ex_io_valid = ~hazard_ID_EX_stall; // @[CPU.scala 199:21]
  assign id_ex_ctrl_clock = clock;
  assign id_ex_ctrl_reset = reset;
  assign id_ex_ctrl_io_in_ex_ctrl_itype = decode_types[5]; // @[CPU.scala 224:57]
  assign id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp = decode_aluCtrlOp; // @[CPU.scala 220:39]
  assign id_ex_ctrl_io_in_ex_ctrl_resultSel = decode_resultSel; // @[CPU.scala 222:39]
  assign id_ex_ctrl_io_in_ex_ctrl_aluSrc = decode_aluSrc; // @[CPU.scala 221:39]
  assign id_ex_ctrl_io_in_ex_ctrl_pcAdd = decode_pcAdd; // @[CPU.scala 223:39]
  assign id_ex_ctrl_io_in_ex_ctrl_branch = decode_branch; // @[CPU.scala 218:39]
  assign id_ex_ctrl_io_in_ex_ctrl_jump = decode_jump; // @[CPU.scala 219:39]
  assign id_ex_ctrl_io_in_mem_ctrl_memRead = decode_memRead; // @[CPU.scala 226:39]
  assign id_ex_ctrl_io_in_mem_ctrl_memWrite = decode_memWrite; // @[CPU.scala 227:39]
  assign id_ex_ctrl_io_in_mem_ctrl_taken = 1'h0; // @[CPU.scala 230:39]
  assign id_ex_ctrl_io_in_mem_ctrl_maskMode = if_id_io_data_instr[13:12]; // @[CPU.scala 228:61]
  assign id_ex_ctrl_io_in_mem_ctrl_sext = ~if_id_io_data_instr[14]; // @[CPU.scala 229:42]
  assign id_ex_ctrl_io_in_wb_ctrl_toReg = decode_toReg; // @[CPU.scala 232:39]
  assign id_ex_ctrl_io_in_wb_ctrl_regWrite = decode_regWrite; // @[CPU.scala 233:39]
  assign id_ex_ctrl_io_in_noflush = 1'h1; // @[CPU.scala 142:28]
  assign id_ex_ctrl_io_flush = hazard_ID_EX_flush; // @[CPU.scala 237:23]
  assign id_ex_ctrl_io_valid = ~hazard_ID_EX_stall; // @[CPU.scala 216:26]
  assign ex_mem_clock = clock;
  assign ex_mem_reset = reset;
  assign ex_mem_io_in_regWAddr = id_ex_io_data_regWAddr; // @[CPU.scala 295:26]
  assign ex_mem_io_in_regRData2 = _forward_input2_T ? id_ex_io_data_regRData2 : _forward_input2_T_4; // @[Mux.scala 98:16]
  assign ex_mem_io_in_result = _ex_mem_io_in_result_T ? alu_aluOut : _ex_mem_io_in_result_T_4; // @[Mux.scala 98:16]
  assign ex_mem_io_in_nextpc = 32'h0; // @[CPU.scala 413:23]
  assign ex_mem_io_in_pc = id_ex_io_data_pc; // @[CPU.scala 330:19]
  assign ex_mem_io_flush = hazard_EX_MEM_flush; // @[CPU.scala 329:19]
  assign ex_mem_io_valid = 1'h1; // @[CPU.scala 290:19]
  assign ex_mem_ctrl_clock = clock;
  assign ex_mem_ctrl_reset = reset;
  assign ex_mem_ctrl_io_in_mem_ctrl_memRead = id_ex_ctrl_io_data_mem_ctrl_memRead; // @[CPU.scala 299:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_memWrite = id_ex_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 299:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_taken = id_ex_ctrl_io_data_mem_ctrl_taken; // @[CPU.scala 299:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_maskMode = id_ex_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 299:30]
  assign ex_mem_ctrl_io_in_mem_ctrl_sext = id_ex_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 299:30]
  assign ex_mem_ctrl_io_in_wb_ctrl_toReg = id_ex_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 300:30]
  assign ex_mem_ctrl_io_in_wb_ctrl_regWrite = id_ex_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 300:30]
  assign ex_mem_ctrl_io_in_noflush = 1'h1; // @[CPU.scala 143:29]
  assign ex_mem_ctrl_io_flush = hazard_EX_MEM_flush; // @[CPU.scala 328:24]
  assign ex_mem_ctrl_io_valid = 1'h1; // @[CPU.scala 298:30]
  assign mem_wb_clock = clock;
  assign mem_wb_reset = reset;
  assign mem_wb_io_in_regWAddr = ex_mem_io_data_regWAddr; // @[CPU.scala 385:27]
  assign mem_wb_io_in_result = ex_mem_io_data_result; // @[CPU.scala 386:27]
  assign mem_wb_io_in_readData = io_dmem_readData; // @[CPU.scala 387:27]
  assign mem_wb_io_in_pc = ex_mem_io_data_pc; // @[CPU.scala 394:19]
  assign mem_wb_io_flush = 1'h0; // @[CPU.scala 383:19]
  assign mem_wb_io_valid = 1'h1; // @[CPU.scala 381:19]
  assign mem_wb_ctrl_clock = clock;
  assign mem_wb_ctrl_reset = reset;
  assign mem_wb_ctrl_io_in_wb_ctrl_toReg = ex_mem_ctrl_io_data_wb_ctrl_toReg; // @[CPU.scala 393:30]
  assign mem_wb_ctrl_io_in_wb_ctrl_regWrite = ex_mem_ctrl_io_data_wb_ctrl_regWrite; // @[CPU.scala 393:30]
  assign mem_wb_ctrl_io_in_noflush = 1'h1; // @[CPU.scala 144:29]
  assign mem_wb_ctrl_io_flush = 1'h0; // @[CPU.scala 392:30]
  assign mem_wb_ctrl_io_valid = 1'h1; // @[CPU.scala 390:30]
  always @(posedge clock) begin
    if (reset) begin // @[CPU.scala 103:27]
      pc <= 32'h0; // @[CPU.scala 103:27]
    end else if (!(hazard_pcStall)) begin // @[CPU.scala 152:12]
      if (hazard_pcFromTaken) begin // @[CPU.scala 153:15]
        if (id_ex_ctrl_io_data_ex_ctrl_jump[1]) begin // @[CPU.scala 304:17]
          pc <= alu_aluOut;
        end else begin
          pc <= _next_pc_T_2;
        end
      end else begin
        pc <= predicter_predicted_pc;
      end
    end
    if (reset) begin // @[CPU.scala 341:35]
      old_dmem_sb_sh <= 1'h0; // @[CPU.scala 341:35]
    end else begin
      old_dmem_sb_sh <= dmem_sb_sh; // @[CPU.scala 342:25]
    end
    old_dmem_addr <= ex_mem_io_data_result; // @[CPU.scala 343:35]
    old_dmem_writeData <= ex_mem_io_data_regRData2; // @[CPU.scala 344:35]
    old_dmem_memWrite <= ex_mem_ctrl_io_data_mem_ctrl_memWrite; // @[CPU.scala 346:35]
    old_dmem_maskMode <= ex_mem_ctrl_io_data_mem_ctrl_maskMode; // @[CPU.scala 347:35]
    old_dmem_sext <= ex_mem_ctrl_io_data_mem_ctrl_sext; // @[CPU.scala 348:35]
    old_dmem_readData <= io_dmem_readData; // @[CPU.scala 350:35]
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
`include "rtl/Predicter.v"
