// 设备地址空间
// 0x0000_0000 - .+     ROM  (byte to word)
// 0x1000_0000 - .+     RAM  (byte to word)
// 0x2000_0000 - .+     VRAM (byte to word)
// 0x3000_0000 - .+     palette (byte to word)
// 0xc000_0000 - .+     Device io (byte to word)

module MiniBus (
    input  [31:0] cpu_imem_addr,
    output [31:0] cpu_imem_data,

    input  [31:0] cpu_dmem_addr,        // device addr
    input  [31:0] cpu_dmem_data_in,     // cpu -> device
    input         cpu_dmem_wen,         // cpu -> device
    input         cpu_dmem_ren,         // cpu -> device
    output reg [31:0] cpu_dmem_data_out,// device -> cpu

    input  [31:0] vram_read_data,       // vram -> cpu
    output [31:0] vram_write_data,      // cpu -> vram
    output [31:0] vram_addr,            // cpu -> vram
    output reg    vram_wen,             // cpu -> vram
    output reg    vram_ren,             // cpu -> vram

    input  [31:0] vram_palatte_read_data,   // vram -> palatte
    output [31:0] vram_palatte_read_addr,   // vga x y -> vram p

    output [31:0] imem_addr,            // cpu -> imem
    input  [31:0] imem_data,            // imem -> cpu

    input  [31:0] dmem_read_data,       // dmem -> cpu
    output [31:0] dmem_write_data,      // cpu -> dmem
    output [31:0] dmem_addr,            // cpu -> dmem
    output reg    dmem_wen,             // cpu -> dmem
    output reg    dmem_ren,             // cpu -> dmem

    input  [31:0] dmem_rom_read_data,
    output [31:0] dmem_rom_addr, 

    input  [ 9:0] graphic_x,            // col  640(1024)   vga -> x
    input  [ 8:0] graphic_y,            // row  480(512)    vga -> y
    output [11:0] pixel,                // 4R4G4B  palatte(vram index) -> vga

    output [31:0] palatte_addr,         // cpu -> addr (palatte: 32 * 32)
    output [31:0] palatte_write_data,   // cpu -> data
    output reg    palatte_wen,          // cpu -> wen

    input  [31:0] device_io_read_data,     // device -> cpu
    output [31:0] device_io_write_data,    // cpu -> device
    output [31:0] device_io_addr,          // cpu -> device
    output reg    device_io_wen,

    input  [31:0] palatte_read_data,    // data -> pixel
    output [31:0] palatte_read_addr     // vram palatte -> addr
);
    // instruction
    assign imem_addr = cpu_dmem_addr;
    assign cpu_imem_data = imem_data;

    assign vram_addr = cpu_dmem_addr;
    assign vram_write_data = cpu_dmem_data_in;

    assign dmem_addr = cpu_dmem_addr;
    assign dmem_write_data = cpu_dmem_data_in;

    assign dmem_rom_addr = cpu_dmem_addr;

    assign device_io_addr = cpu_dmem_addr;
    assign device_io_write_data = cpu_dmem_data_in;

    assign palatte_addr = cpu_dmem_addr;
    assign palatte_write_data = cpu_dmem_data_in;

    always @(*) begin
        vram_ren <= 1;
        vram_wen <= 0;
        dmem_ren <= 1;
        dmem_wen <= 0;
        palatte_wen <= 0;
        device_io_wen <= 0;
        cpu_dmem_data_out <= 0;
        case (cpu_dmem_addr[31:28])
            4'h0: begin
                cpu_dmem_data_out <= dmem_rom_read_data;
            end
            4'h1: begin     // RAM
                dmem_ren <= cpu_dmem_ren;
                dmem_wen <= cpu_dmem_wen;
                cpu_dmem_data_out <= dmem_read_data;
            end
            4'h2: begin     // VRAM
                vram_wen <= cpu_dmem_wen;
                vram_ren <= cpu_dmem_ren;
                cpu_dmem_data_out <= vram_read_data;
            end
            4'h3: begin     // palatte
                palatte_wen <= cpu_dmem_wen;
            end
            4'hc: begin     // device io
                device_io_wen <= cpu_dmem_wen;
                cpu_dmem_data_out <= device_io_read_data;
            end
        endcase
    end
    reg [7:0] true_vram_palatte_read_data;
    reg [11:0] tmp_pixel;
    always @(*) begin
        case(vram_palatte_read_addr[1:0])
            2'b00: true_vram_palatte_read_data <= vram_palatte_read_data[ 7: 0];
            2'b01: true_vram_palatte_read_data <= vram_palatte_read_data[15: 8];
            2'b10: true_vram_palatte_read_data <= vram_palatte_read_data[23:16];
            2'b11: true_vram_palatte_read_data <= vram_palatte_read_data[31:24];
        endcase
        case(palatte_read_addr[0])
            1'b0: tmp_pixel <= palatte_read_data[11:0];
            1'b1: tmp_pixel <= palatte_read_data[27:16];
        endcase
    end
    // use palatte to map index from vram to rrggbb(12 bits) and send to vga control(graphic, pixel)
    assign palatte_read_addr = {24'b0, true_vram_palatte_read_data};
    assign pixel = tmp_pixel;

    assign vram_palatte_read_addr = {13'b0, graphic_y, graphic_x};

endmodule