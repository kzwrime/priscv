module anti_jitter_combined (
    input clk,
    input  [15:0] sw,
    input  [ 3:0] btn_y,
    output [15:0] switch_buf,
    output [ 3:0] btn_y_buf
);

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

    // assign switch_buf = sw;
    // assign btn_y_buf = btn_y;
    
endmodule