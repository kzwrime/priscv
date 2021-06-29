// function
// `define FUNC_FUNC(allname, func)\
//         ```func````allname``

// `define PRINTLN(name)\
//         $display(``name``);

// `define REG_INIT(name, width, init)             \
//         reg [``width``-1:0] ``name``;           \
//         localparam __``name``__init = ``init``; \
//         initial begin                           \
//           ``name`` <= (``init``);               \
//         end

// `define REG_UPDATE(name, newVal)                \
//         always @(posedge clk) begin             \
//             ``name`` <= (``newVal``);           \
//             if(reset) begin                     \
//                 ``name`` <= __``name``__init;   \
//             end                                 \
//         end

// `define COPYIO(name, width)                     \
//         input  [``width``-1:0]  in_``name``,      \
//         output [``width``-1:0]  out_``name``

// `define COPYIO2(prename, name, width)           \
//         ``prename``_in_``name``,                \
//         ``prename``_out_``name``

// `define WIRE(name, width)\
//         wire [``width``-1:0] ``name``;

// `define CREATE_S_STAGEREG(name, _width)         \
//         StageReg #(.width(``_width``))          \
//         U_``name`` (clk,   reset, in_``name``,  \
//                    flush, valid, out_``name``); 

// `define PRE_CREATE_STAGEREG(prename)            \
//         wire    ``prename``_in;                 \
//         wire    ``prename``_flush;              \
//         wire    ``prename``_valid;              \

// `define CREATE_STAGEREG(prename, name, _width)              \
//         wire [``_width``-1:0]   ``prename``_``name``_data;  \
//         StageReg #(.width(``_width``))              \
//           ``prename``_``name``(         clk,        \    
//                                          reset,     \
//                                 ``prename``_in,     \
//                                 ``prename``_flush,  \
//                                 ``prename``_valid,  \
//                                 ``prename``_``name``_data);

// ALU_OP {instr[30], func3}
`define ALU_OP_ADD      4'b0000
`define ALU_OP_SUB      4'b1000
`define ALU_OP_SLL      4'b0001
`define ALU_OP_SLT      4'b0010
`define ALU_OP_SLTU     4'b0011
`define ALU_OP_XOR      4'b0100
`define ALU_OP_SRL      4'b0101
`define ALU_OP_SRA      4'b1101
`define ALU_OP_OR       4'b0110
`define ALU_OP_AND      4'b0111

`define ALU_OP_EQ       4'b1001
`define ALU_OP_NEQ      4'b1010
`define ALU_OP_GE       4'b1100
`define ALU_OP_GEU      4'b1011

`define ALU_OP_XXX      4'b1111


`define BEQ_FUNCT3      3'b000
`define BNE_FUNCT3      3'b001
`define BLT_FUNCT3      3'b100
`define BGE_FUNCT3      3'b101
`define BLTU_FUNCT3     3'b110
`define BGEU_FUNCT3     3'b111

`define OPCODE_LUI             7'b01_101_11
`define OPCODE_AUIPC           7'b00_101_11
`define OPCODE_JAL             7'b11_011_11
`define OPCODE_JALR            7'b11_001_11
`define OPCODE_BRANCH          7'b11_000_11
`define OPCODE_LOAD            7'b00_000_11
`define OPCODE_STORE           7'b01_000_11
`define OPCODE_ALUI            7'b00_100_11
`define OPCODE_ALUR            7'b01_100_11
`define OPCODE_FENCE           7'b00_011_11
`define OPCODE_SYSTEM          7'b11_100_11
