module DMem(
    input [9:0] addra,
    input wea,
    input [31:0] dina,
    input clka,

    output reg [31:0] douta
);
    
    reg[31:0] DMEM[0:1023];
    always @(posedge clka) begin
        if(wea) begin
            DMEM[addra] <= dina;
        end
        douta <= DMEM[addra];
    end
endmodule