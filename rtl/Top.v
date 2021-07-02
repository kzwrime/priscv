`timescale 1ps/1ps
`include "rtl/CPU.v"
`include "rtl/MemoryPort.v"
`include "rtl/BlockMemory.v"
`include "rtl/DistributedMemory.v"

module Top (
  input clk,
  input reset,
  output test
);
  wire [31:0] io_imem_addr;
  wire        io_imem_valid;
  wire        io_imem_good;
  wire [31:0] io_imem_instr;
  wire [31:0] iMemPort_imData;
  wire [31:0] iMemPort_imAddr;

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
  wire [31:0] dMemPort_dmData_in;
  wire [31:0] dMemPort_dmData_out;
  wire [31:0] dMemPort_dmAddr_out;
  wire        dMemPort_dmMem_w;


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
  IMemPort U_IM_Port(.clk(clk),
            .reset(reset),
            .addr(io_imem_addr),
            .valid(io_imem_valid),
            .good(io_imem_good),
            .instr(io_imem_instr),

            .imData(iMemPort_imData),
            .imAddr(iMemPort_imAddr)
            );//TODO

  DMemPort U_DM_Port(.clk(clk),
            .reset(reset),
            .addr(io_dmem_addr),
            .valid(io_dmem_valid),
            .good(io_dmem_good),
            .writeData(io_dmem_writeData),
            .memRead(io_dmem_memRead),
            .memWrite(io_dmem_memWrite),
            .maskMode(io_dmem_maskMode),
            .sext(io_dmem_sext),
            .readData(io_dmem_readData),
            
            .readBack(io_dmem_readBack),
            .dmData_in(dMemPort_dmData_in),
            .dmData_out(dMemPort_dmData_out),
            .dmAddr_out(dMemPort_dmAddr_out),
            .dmMem_w(dMemPort_dmMem_w)
            );//TODO

  IMem U_IM(.a(iMemPort_imAddr[11:2]),
            .spo(iMemPort_imData));

  DMem U_DM(.addra(dMemPort_dmAddr_out[11:2]),
            .wea(dMemPort_dmMem_w),
            .dina(dMemPort_dmData_out),
            .clka(~clk),
            .douta(dMemPort_dmData_in));
endmodule