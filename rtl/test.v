`include "rtl/Defines.v"

module top (
);
  initial begin
      `PRINTLN("abc:")
      `FUNC_FUNC(("abc:"), PRINTLN)
  end  
endmodule