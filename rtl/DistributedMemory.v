module IMem (
    input [9:0] a,
    output [31:0] spo
);
    
    reg [31:0] IMEM[0:1023];
    assign spo = IMEM[a];

endmodule