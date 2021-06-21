`timescale 1ps/1ps
`include "rtl/Defines.v"
module ALU (
  input  [31:0] aluIn1,
  input  [31:0] aluIn2,
  input  [ 3:0] aluOp,
  output [31:0] aluOut
);

  function [31:0] reverse;
    input [31:0] in;
    integer i;
    for(i=0; i<32; i=i+1) begin
      reverse[i] = in[31-i];
    end
  endfunction  
  
  wire [31:0] sum    = aluIn1 + ((aluOp[3] | aluOp[1]) ? -aluIn2 : aluIn2);
  wire        neq    = |sum;
  wire        cmp    = (aluIn1[31] == aluIn2[31]) ? sum[31]
                     : aluOp[0] ? aluIn2[31] : aluIn1[31];
  wire [ 4:0] shamt  = aluIn2[4:0];
  wire [31:0] shin   = aluOp[2] ? aluIn1 : reverse(aluIn1);
  wire [32:0] shift  = {aluOp[3] & shin[31], shin};
  wire [32:0] shiftt = ($signed(shift) >>> shamt);
  wire [31:0] shiftr = shiftt[31:0];
  wire [31:0] shiftl = reverse(shiftr);

  reg  [31:0] out;

  always @(*) begin
    case(aluOp)
      `ALU_OP_ADD:    out <= sum;
      `ALU_OP_SUB:    out <= sum;
      `ALU_OP_SLL:    out <= shiftl;
      `ALU_OP_SLT:    out <= cmp;
      `ALU_OP_SLTU:   out <= cmp;
      `ALU_OP_XOR:    out <= (aluIn1 ^ aluIn2);
      `ALU_OP_SRL:    out <= shiftr;
      `ALU_OP_SRA:    out <= shiftr;
      `ALU_OP_OR:     out <= (aluIn1 | aluIn2);
      `ALU_OP_AND:    out <= (aluIn1 & aluIn2);

      `ALU_OP_EQ:     out <= {31'b0, ~neq};
      `ALU_OP_NEQ:    out <= {31'b0, neq};
      `ALU_OP_GE:     out <= {31'b0, ~cmp};
      `ALU_OP_GEU:    out <= {31'b0, ~cmp};
      default:        begin 
          out <= 32'b0; 
          $display("~~~alu error~~~%x", aluOp); 
        end
    endcase
  end

  assign aluOut = out;

endmodule