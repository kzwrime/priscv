module DeviceIO (
    input  clk_h,
    input  clk_l,
    input  rst_async_high,
    input  rst_async_low,

    input  [31:0] device_io_write_data,
    input  [31:0] device_io_addr,
    input         device_io_wen,
    output reg [31:0] device_io_read_data,
    // button
    output [ 4:0] btn_x,
    input  [ 3:0] btn_y,
    // switch
    input  [15:0] sw,
    // 7 seg
    output seg_clk,
    output seg_pen,
    output seg_clr_n,
    output seg_do,
    // led,
    output led_clk,
    output led_pen,
    output led_clr_n,
    output led_do
);

wire [15:0] switch_buf;
wire [3:0] btn_y_buf;
wire [19:0] matrix_button;
wire [15:0] led_buf;
reg  [31:0] seg_text_buf;
wire [63:0] seg_graphic_buf;
assign led_buf = switch_buf;

always @(negedge clk_h) begin
    seg_text_buf <= {switch_buf, switch_buf};
    device_io_read_data <= 32'b0;
    case(device_io_addr[7:4])
        4'h0: begin
            device_io_read_data <= {led_buf, led_buf};
        end
        4'h1: begin
            device_io_read_data <= seg_text_buf;
        end
        4'h2: begin device_io_read_data <= {switch_buf, switch_buf}; end
        4'h3: begin device_io_read_data <= {16'b0, matrix_button}; end
    endcase
    if(device_io_wen) begin
        case(device_io_addr[7:4])
            4'h0: begin
                // led_buf <= device_io_write_data; 
            end
            4'h1: begin
//                seg_text_buf <= device_io_write_data;
            end
        endcase
    end
end

anti_jitter_combined u_anti_jitter_combined(
    .clk(clk_h),
    .sw(sw),
    .btn_y(btn_y),
    .switch_buf(switch_buf),
    .btn_y_buf(btn_y_buf)
);

btn_scan_sword u_matrix_button_scan(
    .clk(clk_l),
    .rst(rst_sync_low),
    .btn_x(btn_x),
    .btn_y(btn_y_buf),
    .result(matrix_button)
);

board_disp_sword #(
   .CLK_FREQ(25)
) u_board_disp (
	.clk(clk_l),            // io main clock
	.rst(rst_sync_low),     // synchronous reset    
	.en(8'hff),             // enable for each tube
	.mode(1'h0),            // 0 for text mode, 1 for graphic mode
	.data_text(seg_text_buf),     // text data to display    
	.data_graphic(64'h0),   // graphic data to display        
//	.dot(8'b01010101),      // enable for each dot
    .dot(matrix_button[7:0]),    
	.led(led_buf),       // LED display    
    // LED interfaces
	.led_clk(led_clk),      // LED clk
	.led_en(led_pen),       // LED enable signal
	.led_clr_n(led_clr_n),  // LED clear active-low signal    
	.led_do(led_do),        // LED data out
    // 7 seg tube interfaces
	.seg_clk(seg_clk),      // Seg clk    
	.seg_en(seg_pen),       // Seg enable signal    
	.seg_clr_n(seg_clr_n),  // Seg clear active-low signal        
	.seg_do(seg_do)         // Seg data out
);


endmodule