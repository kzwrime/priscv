`timescale 1ps/1ps
`include "rtl/CPU.v"
`include "rtl/MemoryPort.v"

module Top (
  input clk,
  input reset,
  output test
);
  wire [31:0] io_imem_addr;
  wire        io_imem_valid;
  wire        io_imem_good;
  wire [31:0] io_imem_instr;
  wire [31:0] io_imem_imData;
  wire [31:0] io_imem_imAddr;

  wire [31:0] io_dmem_addr;
  wire        io_dmem_valid;
  wire        io_dmem_good;
  wire [31:0] io_dmem_writeData;
  wire        io_dmem_memRead;
  wire        io_dmem_memWrite;
  wire [1:0]  io_dmem_maskMode;
  wire        io_dmem_sext;
  wire [31:0] io_dmem_readData;
  wire [31:0] io_dmem_readBack;
  wire [31:0] io_dmem_dmData_in;
  wire [31:0] io_dmem_dmAddr_out;
  wire        io_dmem_dmMem_w;


  CPU U_CPU(.clock(clk),
            .reset(reset),
            .io_imem_addr(io_imem_addr),
            .io_imem_valid(io_imem_valid),
            .io_imem_good(io_imem_good),
            .io_imem_instr(io_imem_instr),

            .io_dmem_addr(io_dmem_addr),
            .io_dmem_valid(io_dmem_valid),
            .io_dmem_good(io_dmem_good),
            .io_dmem_writeData(io_dmem_writeData),
            .io_dmem_memRead(io_dmem_memRead),
            .io_dmem_memWrite(io_dmem_memWrite),
            .io_dmem_maskMode(io_dmem_maskMode),
            .io_dmem_sext(io_dmem_sext),
            .io_dmem_readData(io_dmem_readData),

            .io_dmem_readBack(io_dmem_readBack)
            );
  IMem U_IM(.clk(clk),
            .reset(reset),
            .addr(io_imem_addr),
            .valid(io_imem_valid),
            .good(io_imem_good),
            .instr(io_imem_instr)
            );//TODO
  DMem U_DM(.clk(clk),
            .reset(reset),
            .addr(io_dmem_addr),
            .valid(io_dmem_valid),
            .good(io_dmem_good),
            .writeData(io_dmem_writeData),
            .memRead(io_dmem_memRead),
            .memWrite(io_dmem_memWrite),
            .maskMode(io_dmem_maskMode),
            .sext(io_dmem_sext),
            .readData(io_dmem_readData)
            
            .readBack(io_dmem_readBack),
            .io_dmem_dmData_in()
            );//TODO

endmodule