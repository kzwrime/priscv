module async2syncRst(
    input clk,
    input rst_async_n,
    output rst_sync
);

  reg rst_s1, rst_s2;
  always @ (posedge clk, negedge rst_async_n) begin
    if (!rst_async_n) begin   
      rst_s1 <= 1'b0;  
      rst_s2 <= 1'b0;  
    end  
    else begin  
      rst_s1 <= 1'b1;  
      rst_s2 <= rst_s1;  
    end  
  end

//  assign rst_sync = ~rst_s2;
    assign rst_sync = ~rst_async_n;

endmodule
