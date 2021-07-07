module DMem(
    input [11:0] addra,
    input wea,
    input [31:0] dina,
    input clka,

    output reg [31:0] douta
);
    reg[31:0] DMEM[0:4095];
    always @(posedge clka) begin
        if(wea) begin
            DMEM[addra] <= dina;
        end
        douta <= DMEM[addra];
    end
endmodule

// module Palatte (
//     input clka,
//     input wea,
//     input  [ 4:0] addra,
//     input  [31:0] dina,
//     input  [ 4:0] addrb,
//     output reg [31:0] doutb
// );
//     reg[31:0] DMEM[0:31];
//     always @(posedge clka) begin
//         if(wea) begin
//             DMEM[addra] <= dina;
//         end
//         doutb <= DMEM[addrb];
//     end
// endmodule

module VRAM(
    input clka,
    input wea,
    input  [17:0] addra,
    input  [31:0] dina,
    input  [17:0] addrb,
    output reg [31:0] douta,
    output reg [31:0] doutb
);
    reg[31:0] DMEM[0:262143];
    always @(posedge clka) begin
        if(wea) begin
           DMEM[addra] <= dina;
        end
        douta <= DMEM[addra];
        doutb <= DMEM[addrb];
    end

endmodule