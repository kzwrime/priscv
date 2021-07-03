`timescale 1ps/1ps
`define MemPortIO input clk, input reset, input valid, input[31:0] addr,

module IMemPort (
  `MemPortIO
  output [31:0] instr,
  output good,
  
  input  [31:0] imData,
  output [31:0] imAddr
);
  assign instr = imData;
  assign imAddr = addr;
  assign good  = 1;

endmodule

module DMemPort (
  `MemPortIO
  input [31:0] writeData,
  input memRead,
  input memWrite,
  input [1:0] maskMode,
  input sext,
  output reg [31:0] readData,
  output reg good,

  input [31:0] readBack,

  input  [31:0] dmData_in,
  output [31:0] dmData_out,
  output [31:0] dmAddr_out,
  output reg dmMem_w,
  output reg dmMem_r
);
  assign dmAddr_out = addr;
  reg [31:0] tmpWriteData;
  // assign dmData_out = tmpWriteData & readBack;
  assign dmData_out = tmpWriteData;
  // always @(clk, valid, addr, writeData, memRead, memWrite, maskMode, sext) begin
  always @(*) begin
    readData <= 32'b0;
    // tmpWriteData <= 32'b0;
    // dmData_out <= writeData;
    if(valid & (memRead | memWrite)) begin
      if(memRead & memWrite) begin
        dmMem_w <= 0;
        dmMem_r <= 0;
        $display("~~~DMem Port error~~~");
        good <= 0; 
      end else if(memRead) begin
        good <= 1;
        dmMem_w <= 0;
        readData <= 32'b0;
        dmMem_r <= 1;
      end else if(memWrite) begin
          good <= 1;
          dmMem_w <= 1;
          dmMem_r <= 0;
          // tmpWriteData <= writeData;
          $display("~~~DMEM write~~~mask:%b addr:%x wData:%x", maskMode, addr, writeData);
          // dmData_out <= tmpWriteData & readBack;
          // dmData_out <= writeData;
        end
    end else begin good <= 0; readData <= 0; dmMem_w <= 0; dmMem_r <= 0; end

    // always
    if(maskMode == 2'b00) begin
      case(addr[1:0])
      2'b00:  begin readData <= {{24{sext & dmData_in[7]}},  dmData_in[7:0]};   tmpWriteData <= {readBack[31:8], writeData[7:0]};       end
      2'b01:  begin readData <= {{24{sext & dmData_in[15]}}, dmData_in[15:8]};  tmpWriteData <= {readBack[31:16], writeData[7:0], readBack[7:0]}; end
      2'b10:  begin readData <= {{24{sext & dmData_in[23]}}, dmData_in[23:16]}; tmpWriteData <= {readBack[31:24], writeData[7:0], readBack[15:0]}; end
      2'b11:  begin readData <= {{24{sext & dmData_in[31]}}, dmData_in[31:24]}; tmpWriteData <= {writeData[7:0], readBack[23:0]};       end
      endcase
    end
    else if(maskMode == 2'b01) begin
      case(addr[1])
      1'b0: begin readData <= {{16{ sext & dmData_in[15]}}, dmData_in[15:0]};  tmpWriteData <= {readBack[31:16], writeData[15:0]}; end
      1'b1: begin readData <= {{16{ sext & dmData_in[31]}}, dmData_in[31:16]}; tmpWriteData <= {writeData[15:0], readBack[15:0]}; end
      endcase
    end else begin
      readData <= dmData_in;
      tmpWriteData <= writeData;
    end
  end

endmodule

