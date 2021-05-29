module ForwardingUnit (
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] exMemRd,
  input       exMemRw,
  input [4:0] memWBRd,
  input       memWBRw,

  output [1:0] forwardA,
  output [1:0] forwardB
);

  assign forwardA = (exMemRw & (rs1 === exMemRd) & (exMemRd !== 5'b0)) ? 2'b01
                  : (memWBRw & (rs1 === memWBRd) & (memWBRd !== 5'b0)) ? 2'b10
                  : 2'b00;
  assign forwardB = (exMemRw & (rs2 === exMemRd) & (exMemRd !== 5'b0)) ? 2'b01
                  : (memWBRw & (rs2 === memWBRd) & (memWBRd !== 5'b0)) ? 2'b10
                  : 2'b00;
endmodule