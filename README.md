# priscv

## TODO

- [01] Execute 的分支跳转流水线冲刷提前，目前为从 EX_MEM 的流水线寄存器中读出 ex_mem_taken 来给 Hazard 判断冲刷，应改进为在写入 EX_MEM 之前直接给 hazard 且不冲刷 EX_MEM
    - 同时废弃掉 ex_mem_ctrl 的 mem_ctrl_taken  端口及寄存器
    - 修改 next_pc，接线为 Mux(id_ex_ctrl.io.data.ex_ctrl.jump(1), alu.io.aluOut, branchAdd.io.result), 去掉两处流水线寄存器 (ex_mem) 赋值和读出，增添一处上述连线、
    - ！！！注意这里有一个 trick，chisel3 在默认选项下极可能复用端口数和位宽一致的模块，把一个模块直接优化没掉，导致变量名完全不对应，dontTouch 和 dontCare 似乎不起作用

- [02] 添加分支预测
    - Fetch 阶段解码 jal (1101111)，然后直接跳
    - Decode 做 branch (1100011) 的比较 [rs1] <=> [rs2]，把目前 Execute 阶段的 branchAdd 和 ALU 中的判断逻辑放到 Decode 阶段，如果跳转，交由 hazard 立即冲刷 IF_ID，且用 pcFromTaken 更新 PC
    - Decode 做 jalr (1100111) 的 imm + [rs1], 交由 hazard 立即冲刷 IF_ID，且用 pcFromTaken 更新 PC










