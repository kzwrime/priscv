`include "rtl/Defines.v"

module Decode (
  input  [31:0] instr,

  output        branch,
  output [1:0]  jump,
  output        memRead,
  output        memWrite,
  output        regWrite,
  output        toReg,
  output [1:0]  resultSel,
  output        aluSrc,
  output        pcAdd,
  output [6:0]  types,
  output [1:0]  aluCtrlOp,
  output        validInst,
  // output [2:0]  csrCtrl,
  output [31:0] imm
);
// jump = {pcFromALU, jump}
localparam DEC_INVALID = 21'b0;
//                        20     19-18  17       16        15        14     13-12      11      10     9--------3  2---1      0
//                        branch jump   memRead  memWrite  regWrite  toReg  resultSel  aluSrc  pcAdd     RISBUJZ  aluCtrlOp  validInst
localparam DEC_LUI     = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b01,     1'b0,   1'b0,  7'b0000100, 2'b00,     1'b1};
localparam DEC_AUIPC   = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b1,   1'b1,  7'b0000100, 2'b00,     1'b1};
localparam DEC_JAL     = {1'b0,  2'b01, 1'b0,    1'b0,     1'b1,     1'b0,  2'b10,     1'b0,   1'b0,  7'b0000010, 2'b00,     1'b1};
localparam DEC_JALR    = {1'b0,  2'b11, 1'b0,    1'b0,     1'b1,     1'b0,  2'b10,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
localparam DEC_BRANCH  = {1'b1,  2'b00, 1'b0,    1'b0,     1'b0,     1'b0,  2'b00,     1'b0,   1'b0,  7'b0001000, 2'b01,     1'b1};
localparam DEC_LOAD    = {1'b0,  2'b00, 1'b1,    1'b0,     1'b1,     1'b1,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
localparam DEC_STORE   = {1'b0,  2'b00, 1'b0,    1'b1,     1'b0,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
localparam DEC_ALUI    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b10,     1'b1};
localparam DEC_ALUR    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b0,   1'b0,  7'b1000000, 2'b10,     1'b1};
assign                   {branch, jump, memRead, memWrite, regWrite, toReg, resultSel, aluSrc, pcAdd, types,      aluCtrlOp, validInst} = signals;

reg [20:0] signals;

always @(*) begin
  case(instr)
    `OPCODE_LUI    :  signals <= DEC_LUI;
    `OPCODE_AUIPC  :  signals <= DEC_AUIPC;
    `OPCODE_JAL    :  signals <= DEC_JAL;
    `OPCODE_JALR   :  signals <= DEC_JALR;
    `OPCODE_BRANCH :  signals <= DEC_BRANCH;
    `OPCODE_LOAD   :  signals <= DEC_LOAD;
    `OPCODE_STORE  :  signals <= DEC_STORE;
    `OPCODE_ALUI   :  signals <= DEC_ALUI;
    `OPCODE_ALUR   :  signals <= DEC_ALUR;
    // `OPCODE_FENCE  :  signals <= DEC_FENCE;
    // `OPCODE_SYSTEM :  signals <= DEC_SYSTEM;
    default        :  signals <= DEC_INVALID;
  endcase
end

wire [31:0] Iimm = {{21{instr[31]}}, instr[30:20]};
wire [31:0] Simm = {{21{instr[31]}}, instr[30:25], instr[11:7]};
wire [31:0] Bimm = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
wire [31:0] Uimm = {instr[31], instr[30:12], {12{1'b0}}};
wire [31:0] Jimm = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};   

assign imm = {32{types[6]}} & 32'b0
           | {32{types[5]}} & Iimm
           | {32{types[4]}} & Simm
           | {32{types[3]}} & Bimm
           | {32{types[2]}} & Uimm
           | {32{types[1]}} & Jimm;

endmodule