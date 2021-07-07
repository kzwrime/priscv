module IMem (
    input  [11:0] a,
    output [31:0] spo,
    input  [11:0] a2,
    output [31:0] spo2
);
    reg [31:0] IMEM[0:4096];
    // initial begin
        // $readmemh("../riscvprogram/src/graphic/graphic.dat", IMEM);
    // end
    assign spo = IMEM[a];
    assign spo2 = IMEM[a2];
    // assign spo2 = 32'hFFCCEE22;

endmodule