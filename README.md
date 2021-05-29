# priscv

## TODO

- Execute 的分支跳转流水线冲刷提前，目前为从 EX_MEM 的流水线寄存器中读出 ex_mem_taken 来给 Hazard 判断冲刷，应改进为在写入 EX_MEM 之前直接给 hazard 且不冲刷 EX_MEM

- 添加分支预测
    - Fetch 阶段解码 jal (1101111)，然后直接跳
    - Decode 做 branch (1100011) 的比较 [rs1] <=> [rs2]，额外消耗 32 位加法器，如果跳转，交由 hazard 立即冲刷 IF_ID，且用 pcFromTaken 更新 PC
    - Decode 做 jalr (1100111) 的 imm + [rs1], 交由 hazard 立即冲刷 IF_ID，且用 pcFromTaken 更新 PC