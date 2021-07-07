`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 19:15:38
// Design Name: 
// Module Name: NPCPU_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// TODO: Complete the driving of serial seven-segment digital tube and led

module NPCPU_TOP(
    input CLK100MHZ,
    input	RESETN,
    //button
    output [4:0] btn_x,
    input  [3:0] btn_y,

    //switch
    input  [15:0] sw,

    //Seg
    output seg_clk,
    output seg_pen,
    output seg_clr_n,
    output seg_do,

    //led
    output led_clk,
    output led_pen,
    output led_clr_n,
    output led_do,

    output [7:0] led,

    //LED RGB
    output tri_led0_r_n,
    output tri_led0_g_n,
    output tri_led0_b_n,
    output tri_led1_r_n,
    output tri_led1_g_n,
    output tri_led1_b_n,

    // VGA
    output vga_h_sync,
    output vga_v_sync,
    output [3:0] vga_red,
    output [3:0] vga_green,
    output [3:0] vga_blue,

    //Keyboard
    output ps2_clk,
    output ps2_data,
    //Pmod
    inout  [ 8:1] JB,
    //Buzzer
    output  buzzer
);

wire clk_25mhz, clk_main;
wire clk_200mhz;
clk_wiz_0 clk_wiz_0(.clk_in1(CLK100MHZ), .clk_out1(clk_main), .clk_out2(clk_25mhz), .clk_out3(clk_200mhz));
reg [32:0] clk_div;
//assign clk_main = CLK100MHZ;
//assign clk_25mhz = CLK100MHZ;
//assign clk_200mhz = CLK100MHZ;
initial begin
    clk_div = 33'b0;
end
always @(posedge clk_main) begin
    clk_div <= clk_div + 1;
    if(clk_div[32]==1'b1) clk_div <= 33'b0;
end

wire rst_sync, rst_sync_low;
async2syncRst rst_high(.clk(clk_main), .rst_async_n(RESETN), .rst_sync(rst_sync));
async2syncRst rst_low(.clk(clk_25mhz), .rst_async_n(RESETN), .rst_sync(rst_sync_low));

wire [31:0] cpu_imem_addr;
wire [31:0] cpu_imem_data;
                                              
wire [31:0] cpu_dmem_addr;        // device addr
wire [31:0] cpu_dmem_data_in;
wire        cpu_dmem_wen;
wire        cpu_dmem_ren;
wire [31:0] cpu_dmem_data_out;
                                              
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

wire [31:0] device_io_read_data;
wire [31:0] device_io_write_data;
wire [31:0] device_io_addr;
wire        device_io_wen;

wire [31:0] palatte_read_data;
wire [31:0] palatte_read_addr;

TopPCPU u_toppcpus(
    .clk(clk_main),
    .reset(rst_sync),
    .inst_in(cpu_imem_data),
    .PC_out(cpu_imem_addr),         // byte addr
    .Data_in(cpu_dmem_data_out),    // device -> cpu
    .Addr_out(cpu_dmem_addr),       // byte addr
    .Data_out(cpu_dmem_data_in),    // cpu -> device
    .mem_w(cpu_dmem_wen),
    .mem_r(cpu_dmem_ren),
    .test()
);

MiniBus u_minibus(
    .cpu_imem_addr(cpu_imem_addr),
    .cpu_imem_data(cpu_imem_data),
     
    .cpu_dmem_addr(cpu_dmem_addr),          // device addr
    .cpu_dmem_data_in(cpu_dmem_data_in),    // cpu -> device
    .cpu_dmem_wen(cpu_dmem_wen),            // cpu -> device
    .cpu_dmem_ren(cpu_dmem_ren),            // cpu -> device
    .cpu_dmem_data_out(cpu_dmem_data_out),  // device -> cpu
     
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

// 4096 * 4B = 16384 = 2^14 = 16 KB
ROM_NEW u_rom(
    .clka(~clk_main),
    .addra(imem_addr[13:2]),    // 11:0
    .dina(32'b0),
    .douta(imem_data),
    .wea(1'b0),
    
    .addrb(dmem_rom_addr[13:2]),
    .clkb(~clk_main),
    .dinb(32'b0),
    .doutb(dmem_rom_read_data),
    .web(1'b0)
);

// 4096 * 4B = 16384 = 2^14 = 16 KB
RAM_MAIN u_ram_main(
    // memory
    .clka(~clk_main),
    .wea(dmem_wen),
    .ena(1'b1),
    .addra(dmem_addr[13:2]),    // 11:0
    .dina(dmem_write_data),     // 31:0
    .douta(dmem_read_data)     // 31:0
);


// 131072 * 4B (1024 * 512 * 8 / 32 = 103072)
// 640 * 480 valid, (640 + 384) * (480 + 32)
VRAM u_vram(
    // vram write
    .clka(~clk_main),
    .wea(vram_wen),
    .ena(1'b1),
    .addra(vram_addr[18:2]),        // 16:0
    .dina(vram_write_data),         // 31:0
    .douta(vram_read_data),
    // vram read (to vga convert)
    .clkb(~clk_main),
    .web(1'b0),
    .addrb(vram_palatte_read_addr[18:2]),   // 16:0
    .dinb(32'h00010002),
    .doutb(vram_palatte_read_data)          // 31:0 8+8+8+8 : 4 * palatte_index
);

PALATTE u_palatte(    // 32 * 32
    .clka(~clk_main),
    .wea(palatte_wen),
    .addra(palatte_addr[6:2]),  // 4:0
    .dina(palatte_write_data),  // 31:0

    .clkb(~clk_main),
    .addrb(palatte_read_addr[6:2]),  // 4:0
    .doutb(palatte_read_data)   // 31:0
);

  // anti-jitter
wire [15:0] switch_buf;
wire [3:0] btn_y_buf;
localparam
      CLK_FREQ_SYS = 50,
      CLK_FREQ_BUS = 25,
      CLK_FREQ_CPU = 50,
      CLK_FREQ_MEM = 50,
      CLK_FREQ_DEV = 50;

`ifndef SIMULATING
anti_jitter #(.CLK_FREQ(CLK_FREQ_DEV), .JITTER_MAX(1000), .INIT_VALUE(0))
        AJ0 (.clk(clk_out), .rst(1'b0), .sig_i(sw[0]), .sig_o(switch_buf[0])),
        AJ1 (.clk(clk_out), .rst(1'b0), .sig_i(sw[1]), .sig_o(switch_buf[1])),
        AJ2 (.clk(clk_out), .rst(1'b0), .sig_i(sw[2]), .sig_o(switch_buf[2])),
        AJ3 (.clk(clk_out), .rst(1'b0), .sig_i(sw[3]), .sig_o(switch_buf[3])),
        AJ4 (.clk(clk_out), .rst(1'b0), .sig_i(sw[4]), .sig_o(switch_buf[4])),
        AJ5 (.clk(clk_out), .rst(1'b0), .sig_i(sw[5]), .sig_o(switch_buf[5])),
        AJ6 (.clk(clk_out), .rst(1'b0), .sig_i(sw[6]), .sig_o(switch_buf[6])),
        AJ7 (.clk(clk_out), .rst(1'b0), .sig_i(sw[7]), .sig_o(switch_buf[7])),
        AJ8 (.clk(clk_out), .rst(1'b0), .sig_i(sw[8]), .sig_o(switch_buf[8])),
        AJ9 (.clk(clk_out), .rst(1'b0), .sig_i(sw[9]), .sig_o(switch_buf[9])),
        AJ10 (.clk(clk_out), .rst(1'b0), .sig_i(sw[10]), .sig_o(switch_buf[10])),
        AJ11 (.clk(clk_out), .rst(1'b0), .sig_i(sw[11]), .sig_o(switch_buf[11])),
        AJ12 (.clk(clk_out), .rst(1'b0), .sig_i(sw[12]), .sig_o(switch_buf[12])),
        AJ13 (.clk(clk_out), .rst(1'b0), .sig_i(sw[13]), .sig_o(switch_buf[13])),
        AJ14 (.clk(clk_out), .rst(1'b0), .sig_i(sw[14]), .sig_o(switch_buf[14])),
        AJ15 (.clk(clk_out), .rst(1'b0), .sig_i(sw[15]), .sig_o(switch_buf[15])),
        AJY0 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[0]), .sig_o(btn_y_buf[0])),
        AJY1 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[1]), .sig_o(btn_y_buf[1])),
        AJY2 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[2]), .sig_o(btn_y_buf[2])),
        AJY3 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[3]), .sig_o(btn_y_buf[3]));
  `else
   assign switch_buf = sw;
   assign btn_y_buf = btn_y;
   `endif

vga_control u_vga_control(
    .d_in(pixel[11:0]),     // rrrr_gggg_bbbb, pixel
//    .d_in(switch_buf[11:0]),
//    .d_in(12'b1111_0000_0000),
    .vga_clk(clk_25mhz),    // 25MHz
    .clrn(1'b1),
    .row_addr(graphic_y),   // pixel ram row address, 480 (512) lines
    .col_addr(graphic_x),   // pixel ram col address, 640 (1024) pixels
    .r(vga_red),            // 3-bit
    .g(vga_green),          // 3-bit
    .b(vga_blue),           // 3-bit
    .rdn(),            // read pixel RAM (active_low)
    .hs(vga_h_sync),        // horizontal synchronization
    .vs(vga_v_sync)         // vertical synchronization
);



IBUF IBUF1(.O(tck_in),.I(JB[4]));
BUFG BUFG1(.O(tck), .I(tck_in));

DeviceIO u_device_io(
    .clk_h(clk_main),
    .clk_l(clk_25mhz),
    .rst_async_high(rst_sync),
    .rst_async_low(rst_sync_low),

    .device_io_write_data(device_io_write_data),
//    .device_io_addr(device_io_addr),
    .device_io_addr(32'hc000_0020),
    .device_io_wen(device_io_wen),
    .device_io_read_data(device_io_read_data),
    // button
    .btn_x(btn_x),
    .btn_y(btn_y),
    // switch
    .sw(sw),
    // 7 seg
    .seg_clk(seg_clk),
    .seg_pen(seg_pen),
    .seg_clr_n(seg_clr_n),
    .seg_do(seg_do),
    // led,
    .led_clk(led_clk),
    .led_pen(led_pen),
    .led_clr_n(led_clr_n),
    .led_do(led_do)
);

ila_0 u_ila_0(
    .clk(clk_200mhz),
    .probe0(cpu_imem_addr),
    .probe1(cpu_imem_data),
    .probe2(cpu_dmem_addr),
    .probe3({23'b0, graphic_y}),
    .probe4({22'b0, graphic_x}),
    .probe5(sw)
);

endmodule
