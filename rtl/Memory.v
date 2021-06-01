`define MemPortIO input clk, input reset, input valid, output good, input[31:0] addr,

module IMem (
  `MemPortIO
  output [31:0] instr
);
  reg[31:0] IMEM[0:511]; // 2^8
  assign instr = IMEM[addr[10:2]];
  assign good  = 1;
endmodule

module DMem (
  `MemPortIO
  input [31:0] writeData,
  input memRead,
  input memWrite,
  input [1:0] maskMode,
  input sext, // 符号扩展
  output reg [31:0] readData
);
  reg[31:0] DMEM[0:255];
  reg good;
  always @(*) begin
    if(valid & (memRead | memWrite)) begin
      if(memRead & memWrite) begin
        $display("~~~DMem Port error~~~");
        good <= 0;
      end
      else begin
        good <= 1;
        if(memRead) begin
          if(maskMode === 2'b00) begin
            case(addr[1:0])
            2'b00:  readData <= {{24{sext & DMEM[addr[7:2]][7]}},  DMEM[addr[7:2]][7:0]};
            2'b01:  readData <= {{24{sext & DMEM[addr[7:2]][15]}}, DMEM[addr[7:2]][15:8]};
            2'b10:  readData <= {{24{sext & DMEM[addr[7:2]][23]}}, DMEM[addr[7:2]][23:16]};
            2'b11:  readData <= {{24{sext & DMEM[addr[7:2]][31]}}, DMEM[addr[7:2]][31:24]};
            endcase
          end
          else if(maskMode === 2'b01) begin
            case(addr[1])
            1'b0: readData <= {{16{ sext & DMEM[addr[7:2]][15]}}, DMEM[addr[7:2]][15:0]};
            1'b1: readData <= {{16{ sext & DMEM[addr[7:2]][31]}}, DMEM[addr[7:2]][31:16]};
            endcase
          end
          else begin
            readData <= DMEM[addr[7:2]];
          end
        end
      end
    end
    else begin good <= 0; readData <= 0; end
  end
  always @(posedge clk) begin
    if(valid & memWrite) begin
      $display("~~~DMEM write~~~mask:%b addr:%x wData:%x", maskMode, addr, writeData);
      if(maskMode === 2'b00) begin
        case(addr[1:0])
        2'b00:  DMEM[addr[7:2]][ 7: 0] <= writeData[7:0];
        2'b01:  DMEM[addr[7:2]][15: 8] <= writeData[7:0];
        2'b10:  DMEM[addr[7:2]][23:16] <= writeData[7:0];
        2'b11:  DMEM[addr[7:2]][31:24] <= writeData[7:0];
        endcase
      end
      else if(maskMode === 2'b01) begin
      // $display("sh");
        case(addr[1])
        1'b0: DMEM[addr[7:2]][15: 0] <= writeData[15:0];
        1'b1: DMEM[addr[7:2]][31:16] <= writeData[15:0];
        endcase
    end else if(maskMode === 2'b10) begin
        DMEM[addr[7:2]] <= writeData;
    end
  end
  end
endmodule
