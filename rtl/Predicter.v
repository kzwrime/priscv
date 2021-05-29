`include "rtl/Defines.v"

module Predicter (
    input [31:0] instr,
    input [31:0] pc,

    output [31:0] predicted_pc
);
    wire is_jal = (instr[6:0] === `OPCODE_JAL) ;
    wire is_bxx = (instr[6:0] === `OPCODE_BRANCH);
    wire [31:0] Jimm  = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
    wire [31:0] Bimm  = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
    wire [31:0] adder = is_jal ? Jimm : (is_bxx & Bimm[31]) ? Bimm : 4;
    assign predicted_pc = pc + adder;

endmodule