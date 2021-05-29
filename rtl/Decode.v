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
localparam DEC_STORE   = {1'b0,  2'b00, 1'b0,    1'b1,     1'b0,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0010000, 2'b00,     1'b1};
localparam DEC_ALUI    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b10,     1'b1};
localparam DEC_ALUR    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b0,   1'b0,  7'b1000000, 2'b10,     1'b1};
assign                   {branch, jump, memRead, memWrite, regWrite, toReg, resultSel, aluSrc, pcAdd, types,      aluCtrlOp, validInst} = signals;

reg [20:0] signals;

always @(*) begin
  $write("%x", instr);
  case(instr[6:0])
    `OPCODE_LUI    :  begin signals <= DEC_LUI;    $display("~~~decode LUI");  end
    `OPCODE_AUIPC  :  begin signals <= DEC_AUIPC;  $display("~~~decode AUIPC");  end
    `OPCODE_JAL    :  begin signals <= DEC_JAL;    $display("~~~decode JAL");  end
    `OPCODE_JALR   :  begin signals <= DEC_JALR;   $display("~~~decode JALR");  end
    `OPCODE_BRANCH :  begin signals <= DEC_BRANCH; $display("~~~decode BRANCH");  end
    `OPCODE_LOAD   :  begin signals <= DEC_LOAD;   $display("~~~decode LOAD");  end
    `OPCODE_STORE  :  begin signals <= DEC_STORE;  $display("~~~decode STORE");  end
    `OPCODE_ALUI   :  begin signals <= DEC_ALUI;   $display("~~~decode ALUI");  end
    `OPCODE_ALUR   :  begin signals <= DEC_ALUR;   $display("~~~decode ALUR");  end
    // `OPCODE_FENCE  :  signals <= DEC_FENCE;
    // `OPCODE_SYSTEM :  signals <= DEC_SYSTEM;
    default        :  begin signals <= DEC_INVALID; $display("~~~decode error~~~"); end
  endcase
end

wire [31:0] Iimm = {{21{instr[31]}}, instr[30:20]};
wire [31:0] Simm = {{21{instr[31]}}, instr[30:25], instr[11:7]};
wire [31:0] Bimm = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
wire [31:0] Uimm = {instr[31], instr[30:12], {12{1'b0}}};
wire [31:0] Jimm = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};   

assign imm = {32{types[5]}} & Iimm
           | {32{types[4]}} & Simm
           | {32{types[3]}} & Bimm
           | {32{types[2]}} & Uimm
           | {32{types[1]}} & Jimm;
// always @(*) begin
// $display("\t%x\tdecode-imm:%x", instr, imm);
// $display("\t%x,%x,%x,%x,%b", Iimm, Simm, Bimm, Uimm, types);
// end

endmodule