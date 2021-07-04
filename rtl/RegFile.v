`timescale 1ps/1ps
module RegFile (
    input  clk,
    input  reset,
    input  wen,
    input  [4:0] regRAddr1, regRAddr2, regWAddr,
    input  [31:0] regWData,
    output [31:0] regRData1,
    output [31:0] regRData2
);

    integer ii;
    reg [31:0] regs[31:0];
    initial begin
        for(ii=0; ii<32; ii=ii+1)
            regs[ii] <= 32'b0;
        regs[2] <= 32'h0000FFFF;    // initial stack pointer
        regs[3] <= 32'h00004FFF;    // initial global pointer
    end
    // always @(posedge clk) begin
    always @(negedge clk) begin
        if(reset) begin
            $display("~~~regs reset~~~");
            for(ii=0; ii<32; ii=ii+1)
                regs[ii] <= 32'b0;
            regs[2] <= 32'h0000FFFF;    // initial stack pointer
            regs[3] <= 32'h00004FFF;    // initial global pointer
        end
        else if(wen & (|regWAddr)) regs[regWAddr] <= regWData;
    end

    // for pipeline
    assign regRData1 = wen & (regWAddr == regRAddr1) ? regWData
                    : ((regRAddr1 != 5'b0) ? regs[regRAddr1] : 32'b0);
    assign regRData2 = wen & (regWAddr == regRAddr2) ? regWData
                    : ((regRAddr2 != 5'b0) ? regs[regRAddr2] : 32'b0);

endmodule