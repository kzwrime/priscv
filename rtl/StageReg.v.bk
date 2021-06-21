`include "rtl/Defines.v"
module StageReg 
#(parameter width = 1)
 (
  input  clk,
  input  reset,
  input  [width-1:0] in,
  input  flush,
  input  valid,
  output [width-1:0] data
);
  reg [width-1:0] stageRegData;
  assign data = stageRegData;
  always @(posedge clk) begin
    if(valid) stageRegData <= in;
    if(reset | flush) begin
      stageRegData <= 32'b0;
    end
  end
endmodule

`define EXCTRL \
  `COPYIO(branch,     1),   \
  `COPYIO(jump,       2),   \
  `COPYIO(resultSel,  2),   \
  `COPYIO(aluSrc,     1),   \
  `COPYIO(pcAdd,      1),   \
  `COPYIO(types,      7),   \
  `COPYIO(aluCtrlOp,  2)    

`define MCTRL \
  `COPYIO(memRead,    1),   \
  `COPYIO(memWrite,   1),   \
  `COPYIO(taken,      1),   \
  `COPYIO(maskmode,   2),   \
  `COPYIO(sext,       1)    

`define WBCTRL \
  `COPYIO(regWrite,   1),   \
  `COPYIO(toReg,      1)    

`define EXCTRL_REG \
  `CREATE_S_STAGEREG(branch,     1)    \
  `CREATE_S_STAGEREG(jump,       2)    \
  `CREATE_S_STAGEREG(resultSel,  2)    \
  `CREATE_S_STAGEREG(aluSrc,     1)    \
  `CREATE_S_STAGEREG(pcAdd,      1)    \
  `CREATE_S_STAGEREG(types,      7)    \
  `CREATE_S_STAGEREG(aluCtrlOp,  2)    

`define MCTRL_REG \
  `CREATE_S_STAGEREG(memRead,    1)    \
  `CREATE_S_STAGEREG(memWrite,   1)    \
  `CREATE_S_STAGEREG(taken,      1)    \
  `CREATE_S_STAGEREG(maskmode,   2)    \
  `CREATE_S_STAGEREG(sext,       1)    

`define WBCTRL_REG \
  `CREATE_S_STAGEREG(regWrite,   1)    \
  `CREATE_S_STAGEREG(toReg,      1)     

`define STAGEREG_INS    \
        input  clk,     \
        input  reset,   \
        input  flush,   \
        input  valid   

module ID_EX_CTRL (
  `STAGEREG_INS,
  `EXCTRL, `MCTRL, `WBCTRL
);
  `EXCTRL_REG
  `MCTRL_REG
  `WBCTRL_REG
endmodule

module EX_MEM_CTRL (
  `STAGEREG_INS,
  `MCTRL, `WBCTRL
);
  `MCTRL_REG
  `WBCTRL_REG
endmodule

module MEM_WB_CTRL (
  `STAGEREG_INS,
  `WBCTRL
);
  `WBCTRL_REG
endmodule

module IF_ID (
  `STAGEREG_INS,
  `COPYIO(instr, 32),
  `COPYIO(pc, 32),
  `COPYIO(pcPlus4, 32)
);
  `CREATE_S_STAGEREG(instr, 32)
  `CREATE_S_STAGEREG(pc, 32)
  `CREATE_S_STAGEREG(pcPlus4, 32)
endmodule

module ID_EX (
  `STAGEREG_INS,
  `COPYIO(writereg,     5),
  `COPYIO(funct7,       7),
  `COPYIO(funct3,       3),
  `COPYIO(imm,          32),
  `COPYIO(readdata2,    32),
  `COPYIO(readdata1,    32),
  `COPYIO(pc,           32),
  `COPYIO(pcplusfour,   32),
  `COPYIO(rs1,          5),
  `COPYIO(rs2,          5)
);
  `CREATE_S_STAGEREG(writereg,     5)
  `CREATE_S_STAGEREG(funct7,       7)
  `CREATE_S_STAGEREG(funct3,       3)
  `CREATE_S_STAGEREG(imm,          32)
  `CREATE_S_STAGEREG(readdata2,    32)
  `CREATE_S_STAGEREG(readdata1,    32)
  `CREATE_S_STAGEREG(pc,           32)
  `CREATE_S_STAGEREG(pcplusfour,   32)
  `CREATE_S_STAGEREG(rs1,          5)
  `CREATE_S_STAGEREG(rs2,          5)
endmodule

module EX_MEM (
  `STAGEREG_INS,
  `COPYIO(readData2, 5),
  `COPYIO(result, 32),
  `COPYIO(nextPC, 32)
);
  `CREATE_S_STAGEREG(readData2, 5)
  `CREATE_S_STAGEREG(result, 32)
  `CREATE_S_STAGEREG(nextPC, 32)
endmodule

module MEM_WB (
  `STAGEREG_INS,
  `COPYIO(writeReg, 5),
  `COPYIO(result, 32),
  `COPYIO(readData, 32)
);
  `CREATE_S_STAGEREG(writeReg, 5)
  `CREATE_S_STAGEREG(result, 32)
  `CREATE_S_STAGEREG(readData, 32)
endmodule