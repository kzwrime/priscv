
# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|xxxxxxxx|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|x|x|x|x|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|x|x|x|x|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|x|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|x|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|xxxxxxxx|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|x|x|x|x|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|x|x|x|x|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|x|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|x|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|x|x|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|x|x|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|x|x|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000000
instr: 00000010000000000000000001101111
### Fetch PC = 00000000
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|0200006f|00000004|0|1|
### Decode PC = 00000000
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000000|00000000|00000000|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000000|00000000|00|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000000
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000000|00000000|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000020
instr: 00000000011101101111101110110011
### Fetch PC = 00000020
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|0076fbb3|00000024|0|1|
### Decode PC = 00000000
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0200006f|00000000|00000004|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|01|0|00000020|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000000|00000004|00|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000000
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000000|00000000|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000024
instr: 00000000000000101010011010000011
### Fetch PC = 00000024
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|0002a683|00000028|0|1|
### Decode PC = 00000020
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0076fbb3|00000020|00000024|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|7|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000020|00000024|0d|
|id_ex_io_in_rs||||
|07|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000000
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|01|0|00000020|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000000|00000004|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000004|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000028
instr: 00000001001001101111101110110011
### Fetch PC = 00000028
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|0126fbb3|0000002c|0|1|
### Decode PC = 00000024
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0002a683|00000024|00000028|0d|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|2|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000024|00000028|05|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|1|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|1|1|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000020
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|7|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000020|00000024|0d|
|id_ex_io_data_rs2||||
|07|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000004|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000004|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 0000002c
instr: 00000011001010111100110001100011
### Fetch PC = 0000002c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|032bcc63|00000030|0|0|
### Decode PC = 00000028
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0126fbb3|00000028|0000002c|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|7|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000028|0000002c|0d|
|id_ex_io_in_rs||||
|12|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
### Execute PC = 00000024
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|2|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000024|00000028|05|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|1|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|1|1|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|0d|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000024|0|1|00000000|
### Memory PC = 00000020
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|1|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|1|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000020|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000004|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 0000002c
instr: 00000011001010111100110001100011
### Fetch PC = 0000002c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|032bcc63|00000030|0|1|
### Decode PC = 00000028
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0126fbb3|00000028|0000002c|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|7|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000028|0000002c|0d|
|id_ex_io_in_rs||||
|12|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000000
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000000|00000000|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000024
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|0d|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000024|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|0d|00000000|f0000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000024|0|1|00000000|
### Writeback PC = 00000020
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000020|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000030
instr: 11111111111111111111010100110111
### Fetch PC = 00000030
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fffff537|00000034|0|1|
### Decode PC = 0000002c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|032bcc63|0000002c|00000030|18|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|01|4|00000038|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000002c|00000030|17|
|id_ex_io_in_rs||||
|12|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000028
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|7|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000028|0000002c|0d|
|id_ex_io_data_rs2||||
|12|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000028|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000024
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|0d|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|f0000000|00000024|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|1|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000034
instr: 00000000101001010000010100110011
### Fetch PC = 00000034
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00a50533|00000038|0|1|
### Decode PC = 00000030
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fffff537|00000030|00000034|0a|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7f|7|fffff000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000030|00000034|1f|
|id_ex_io_in_rs||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000002c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|01|4|00000038|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000002c|00000030|17|
|id_ex_io_data_rs2||||
|12|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|18|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000002c|0|1|00000000|
### Memory PC = 00000028
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000028|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000028|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000000|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 00000038
instr: 00000000100100110010000000100011
### Fetch PC = 00000038
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00932023|0000003c|0|1|
### Decode PC = 00000034
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00a50533|00000034|00000038|0a|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000034|00000038|0a|
|id_ex_io_in_rs||||
|0a|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000030
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7f|7|fffff000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000030|00000034|1f|
|id_ex_io_data_rs2||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|0a|00000000|fffff000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000030|0|1|00000000|
### Memory PC = 0000002c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|18|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000002c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|18|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000002c|0|1|00000000|
### Writeback PC = 00000028
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000028|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc 0000003c
instr: 11110111110111111111000001101111
### Fetch PC = 0000003c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|f7dff06f|00000040|0|1|
### Decode PC = 00000038
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00932023|00000038|0000003c|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|2|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000038|0000003c|06|
|id_ex_io_in_rs||||
|09|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|1|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000034
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000034|00000038|0a|
|id_ex_io_data_rs2||||
|0a|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|0a|fffff000|ffffe000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000034|0|1|00000000|
### Memory PC = 00000030
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|0a|00000000|fffff000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000030|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|0a|fffff000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000030|0|1|00000000|
### Writeback PC = 0000002c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|18|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000002c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc ffffffb8
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = ffffffb8
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|ffffffbc|0|1|
### Decode PC = 0000003c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|f7dff06f|0000003c|00000040|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7b|7|ffffff7c|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000003c|00000040|1f|
|id_ex_io_in_rs||||
|1d|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000038
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|2|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000038|0000003c|06|
|id_ex_io_data_rs2||||
|09|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|1|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000038|0|1|00000000|
### Memory PC = 00000034
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|0a|fffff000|ffffe000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000034|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|1|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|0a|ffffe000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000034|0|1|00000000|
### Writeback PC = 00000030
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|0a|fffff000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000030|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|fffff000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: f0000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = ffffffb8
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|ffffffb8|ffffffbc|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|ffffffb8|ffffffbc|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 0000003c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7b|7|ffffff7c|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000003c|00000040|1f|
|id_ex_io_data_rs2||||
|1d|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000040|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000003c|0|1|00000000|
### Memory PC = 00000038
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000038|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000038|0|1|00000000|
### Writeback PC = 00000034
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|0a|ffffe000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000034|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = ffffffb8
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|ffffffb8|ffffffbc|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|ffffffb8|0|1|00000000|
### Memory PC = 0000003c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000040|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000003c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000040|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000003c|0|1|00000000|
### Writeback PC = 00000038
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000038|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = ffffffb8
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|ffffffb8|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|ffffffb8|0|1|00000000|
### Writeback PC = 0000003c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000040|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000003c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = ffffffb8
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|ffffffb8|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|0|1|
### Decode PC = xxxxxxxx
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_in_rs||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = xxxxxxxx
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|xx|x|00000000|xxxxxxxx|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|xxxxxxxx|xxxxxxxx|xxxxxxxx|xx|
|id_ex_io_data_rs2||||
|xx|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|x|x|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|x|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|x|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|ffffe000|00000000|
|         12|00000000|f0000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: 00000000 000002ab 80000000 0000003f
00000010: 00000001 fff70000 0000ffff 80000000
00000020: 00001111 11112222 22223333 33334444
00000030: 44445555 55556666 66667777 77778888
00000040: 88889999 9999aaaa aaaabbbb bbbbcccc
00000050: ccccdddd ddddeeee eeeeffff ffff0000
00000060: 7777f77f 55eeffff ffeefeea fffff770
00000070: ffbb577f ffff5dda ffeeaddf 77bbafff

