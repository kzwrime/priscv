module HazardUnit (
  input  [4:0]  rs1,
  input  [4:0]  rs2,
  // input         ID_branch,
  input         ID_EX_memRead,
  input  [4:0]  ID_EX_rd,
  input         EX_MEM_taken,

  output reg    pcFromTaken,
  output reg    pcStall,
  output reg    IF_ID_stall,
  output reg    ID_EX_flush,
  output reg    EX_MEM_flush,
  output reg    IF_ID_flush
);

  // note: 最后的 if 具有最高优先级
  always @(*) begin
    pcFromTaken   <= 0;  
    pcStall       <= 0; 
    IF_ID_stall    <= 0;
    ID_EX_flush    <= 0;
    EX_MEM_flush   <= 0;  
    IF_ID_flush    <= 0;
    // ID 截断需要读的寄存器和 EX 阶段需要写的寄存器相同，即 1a/1b 类型的冒险
    // 等一个周期（等前馈电路）
    if(ID_EX_memRead && (ID_EX_rd === rs1 || ID_EX_rd === rs1)) begin
      pcFromTaken <= 0;
      pcStall     <= 1;
      IF_ID_stall  <= 1;
      ID_EX_flush  <= 1;
    end
    // alu 预测失败，需要跳转，更新pc，冲刷全部流水线
    if(EX_MEM_taken) begin 
      pcFromTaken <= 1; // PC from MEM stage
      pcStall     <= 0; // PC from MEM stage\
      IF_ID_flush  <= 1;
      ID_EX_flush  <= 1;
      // EX_MEM_flush <= 1;
      EX_MEM_flush <= 0; // CHANGE : match TODO 01 Execute 的分支跳转流水线冲刷提前，
      // 曾经为从 EX_MEM 的流水线寄存器中读出 ex_mem_taken 来给 Hazard 判断冲刷，
      // 改为在写入 EX_MEM 之前直接给 hazard 且不冲刷 EX_MEM
    end
  end

endmodule