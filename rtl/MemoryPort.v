`timescale 1ps/1ps
`define MemPortIO input clk, input reset, input valid, input[31:0] addr,

module IMem (
  `MemPortIO
  output [31:0] instr,
  output good,
  
  input  [31:0] imData,
  output [31:0] imAddr
);
  assign instr = imData;
  assign imAddr = {22'b0, addr[9:2], 2'b0};
  assign good  = 1;

endmodule

module DMem (
  `MemPortIO
  input [31:0] writeData,
  input memRead,
  input memWrite,
  input [1:0] maskMode,
  input sext, // 符号扩展
  output reg [31:0] readData,
  output reg good,

  input [31:0] readBack,

  input  [31:0] dmData_in,
  output reg [31:0] dmData_out,
  output [31:0] dmAddr_out,
  output reg dmMem_w
);
  assign dmAddr_out = {22'b0, addr[9:2], 2'b00};
  reg [31:0] tmpWriteData;
  always @(*) begin
    readData <= 32'b0;
    if(valid & (memRead | memWrite)) begin
      if(memRead & memWrite) begin
        dmMem_w <= 0;
        $display("~~~DMem Port error~~~");
        good <= 0;
      end else if(memRead) begin
        good <= 1;
        dmMem_w <= 0;
        readData <= 32'b0;
        if(maskMode == 2'b00) begin
          case(addr[1:0])
          2'b00:  readData <= {{24{sext & dmData_in[7]}},  dmData_in[7:0]};
          2'b01:  readData <= {{24{sext & dmData_in[15]}}, dmData_in[15:8]};
          2'b10:  readData <= {{24{sext & dmData_in[23]}}, dmData_in[23:16]};
          2'b11:  readData <= {{24{sext & dmData_in[31]}}, dmData_in[31:24]};
          endcase
        end
        else if(maskMode == 2'b01) begin
          case(addr[1])
          1'b0: readData <= {{16{ sext & dmData_in[15]}}, dmData_in[15:0]};
          1'b1: readData <= {{16{ sext & dmData_in[31]}}, dmData_in[31:16]};
          endcase
        end
        else begin
          readData <= dmData_in;
        end
      end else if(memWrite) begin
          dmMem_w <= 1;
          $display("~~~DMEM write~~~mask:%b addr:%x wData:%x", maskMode, addr, writeData);
          if(maskMode == 2'b00) begin
            case(addr[1:0])
            2'b00:  tmpWriteData <= {24'b1, writeData[7:0]};
            2'b01:  tmpWriteData <= {16'b1, writeData[7:0], 8'b1};
            2'b10:  tmpWriteData <= {8'b1, writeData[7:0], 16'b1};
            2'b11:  tmpWriteData <= {writeData[7:0], 24'b1};
            endcase
          end else if(maskMode == 2'b01) begin
            case(addr[1])
            1'b0: tmpWriteData <= {16'b1, writeData[15:0]};
            1'b1: tmpWriteData <= {writeData[15:0], 16'b1};
            endcase
          end else if(maskMode == 2'b10) begin
            tmpWriteData <= writeData;
          end
          dmData_out = tmpWriteData & dmData_out;
        end
    end
    else begin good <= 0; readData <= 0; dmMem_w <= 0; end
  end

endmodule

