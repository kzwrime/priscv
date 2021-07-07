`timescale 1ps/1ps
`include "rtl/CPU.v"
`include "rtl/MemoryPort.v"
`include "rtl/BlockMemory.v"
`include "rtl/DistributedMemory.v"
`include "rtl/MiniBus.v"

module Top (
  input clk,
  input reset,
  input  [31:0] vga_x,
  input  [31:0] vga_y,
  output [11:0] vga_pixel,

  input  [31:0] device_io_read_data,
  output [31:0] device_io_write_data,
  output [31:0] device_io_addr,
  output device_io_wen,
  output test
);
  wire [31:0] io_imem_addr;
  wire        io_imem_valid;
  wire        io_imem_good;
  wire [31:0] io_imem_instr;
  // wire [31:0] iMemPort_imData;
  // wire [31:0] iMemPort_imAddr;

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
  // wire [31:0] dMemPort_dmData_in;
  // wire [31:0] dMemPort_dmData_out;
  // wire [31:0] dMemPort_dmAddr_out;
  // wire        dMemPort_dmMem_w;

  wire [31:0] cpu_imem_addr;
  wire [31:0] cpu_imem_data;

  wire [31:0] cpu_dmem_addr;        // device addr
  wire [31:0] cpu_dmem_data2cpu;
  wire        cpu_dmem_wen;
  wire        cpu_dmem_ren;
  wire [31:0] cpu_dmem_data4cpu;

  wire [31:0] vram_read_data;       // disabled defalut
  wire [31:0] vram_write_data;
  wire [31:0] vram_addr;
  wire        vram_wen;
  wire        vram_ren;

  wire [31:0] vram_palatte_read_data;
  wire [31:0] vram_palatte_read_addr;

  wire [31:0] imem_addr;
  wire [31:0] imem_data;

  wire [31:0] dmem_read_data;
  wire [31:0] dmem_write_data;
  wire [31:0] dmem_addr;
  wire        dmem_wen;
  wire        dmem_ren;

  wire [31:0] dmem_rom_read_data;
  wire [31:0] dmem_rom_addr; 

  wire [ 9:0] graphic_x;
  wire [ 8:0] graphic_y;
  wire [11:0] pixel;        // 4R4G4B

  wire [31:0] palatte_addr;
  wire [31:0] palatte_write_data;
  wire        palatte_wen;

  wire [31:0] palatte_read_data;
  wire [31:0] palatte_read_addr;


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

            .io_dmem_readBack(io_dmem_readBack),
            .io_int()
            );

  IMemPort U_IM_Port(.clk(clk),
            .reset(reset),
            .addr(io_imem_addr),
            .valid(io_imem_valid),
            .good(io_imem_good),
            .instr(io_imem_instr),

            .imData(cpu_imem_data),
            .imAddr(cpu_imem_addr)
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
            .dmData_in(cpu_dmem_data2cpu),
            .dmData_out(cpu_dmem_data4cpu),
            .dmAddr_out(cpu_dmem_addr),
            .dmMem_w(cpu_dmem_wen),
            .dmMem_r(cpu_dmem_ren)
            );//TODO

MiniBus u_minibus(
    .cpu_imem_addr(cpu_imem_addr),
    .cpu_imem_data(cpu_imem_data),
     
    .cpu_dmem_addr(cpu_dmem_addr),          // device addr
    .cpu_dmem_data_in(cpu_dmem_data4cpu),   // cpu -> device
    .cpu_dmem_wen(cpu_dmem_wen),            // cpu -> device
    .cpu_dmem_ren(cpu_dmem_ren),            // cpu -> device
    .cpu_dmem_data_out(cpu_dmem_data2cpu),  // device -> cpu
     
    .vram_read_data(vram_read_data),        // vram -> cpu
    .vram_write_data(vram_write_data),      // cpu -> vram
    .vram_addr(vram_addr),                  // cpu -> vram
    .vram_wen(vram_wen),                    // cpu -> vram
    .vram_ren(vram_ren),                    // cpu -> vram

    .vram_palatte_read_data(vram_palatte_read_data),    // vram -> palatte
    .vram_palatte_read_addr(vram_palatte_read_addr),    // vga x y -> vram p

    .imem_addr(imem_addr),                  // cpu -> imem
    .imem_data(imem_data),                  // imem -> cpu
     
    .dmem_read_data(dmem_read_data),        // dmem -> cpu
    .dmem_write_data(dmem_write_data),      // cpu -> dmem
    .dmem_addr(dmem_addr),                  // cpu -> dmem
    .dmem_wen(dmem_wen),                    // cpu -> dmem
    .dmem_ren(dmem_ren),                    // cpu -> dmem
     
    .dmem_rom_read_data(dmem_rom_read_data),
    .dmem_rom_addr(dmem_rom_addr),
     
    .graphic_x(graphic_x),                  // col  640(1024)   vga -> x
    .graphic_y(graphic_y),                  // row  480(512)    vga -> y
    .pixel(pixel),                          // 4R4G4B  palatte(vram index) -> vga
    
    .palatte_addr(palatte_addr),            // cpu -> addr (palatte: 32 * 32)
    .palatte_write_data(palatte_write_data),// cpu -> data
    .palatte_wen(palatte_wen),              // cpu -> wen

    .device_io_read_data(device_io_read_data),      // device -> cpu
    .device_io_write_data(device_io_write_data),    // cpu -> device
    .device_io_addr(device_io_addr),                // cpu -> device
    .device_io_wen(device_io_wen),

    .palatte_read_data(palatte_read_data),  // data -> pixel
    .palatte_read_addr(palatte_read_addr)   // vram palatte -> addr
);

  IMem U_IM(.a(imem_addr[13:2]),
            .spo(imem_data),
            .a2(dmem_rom_addr[13:2]),
            .spo2(dmem_rom_read_data));

  DMem U_DM(.addra(dmem_addr[13:2]),
            .wea(dmem_wen),
            .dina(dmem_write_data),
            .clka(~clk),
            .douta(dmem_read_data));
  wire [31:0] vram_read_tmp;
  VRAM U_VRAM(.clka(~clk),
              .wea(vram_wen),
              .addra(vram_addr[19:2]),
              .dina(vram_write_data),
              .addrb({vga_y[8:0], vga_x[9:1]}),
              .douta(vram_read_data),
              .doutb(vram_read_tmp));

  assign vga_pixel = vga_x[0] ? vram_read_tmp[27:16] : vram_read_tmp[11:0];

endmodule