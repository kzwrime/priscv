
# pc xxxxxxxx
instr: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
### Fetch PC = xxxxxxxx
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|xxxxxxxx|xxxxxxxx|x|x|
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
|x|x|1|00000000|
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
|x|x|1|00000000|
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
|x|x|x|x|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|xx|xxxxxxxx|xxxxxxxx|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|xxxxxxxx|0|1|00000000|
### Writeback PC = xxxxxxxx
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|xx|xxxxxxxx|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|xxxxxxxx|xxxxxxxx|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|x|x|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|          4|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|          8|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|         12|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|         16|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|         20|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|         24|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|         28|xxxxxxxx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000000
instr: 00000000000000000000001010010011
### Fetch PC = 00000000
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000293|00000004|0|1|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000004
instr: 00000000000000000000001100010011
### Fetch PC = 00000004
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000313|00000008|0|1|
### Decode PC = 00000000
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000293|00000000|00000004|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000000|00000004|00|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000008
instr: 11111111111111111111001110110111
### Fetch PC = 00000008
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fffff3b7|0000000c|0|1|
### Decode PC = 00000004
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000313|00000004|00000008|06|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000004|00000008|00|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
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
|00000000|00000000|00000004|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|05|00000000|00000000|xxxxxxxx|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000000c
instr: 00000100000000110000100001100011
### Fetch PC = 0000000c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|04030863|00000010|0|1|
### Decode PC = 00000008
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fffff3b7|00000008|0000000c|07|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7f|7|fffff000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000008|0000000c|1f|
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
### Execute PC = 00000004
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000004|00000008|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|06|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000004|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|05|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000000|00000000|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000010
instr: 00000000000000111000010001100011
### Fetch PC = 00000010
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00038463|00000014|0|1|
### Decode PC = 0000000c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|04030863|0000000c|00000010|10|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|0|00000050|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000000c|00000010|06|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000008
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7f|7|fffff000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000008|0000000c|1f|
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
|07|00000000|fffff000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
### Memory PC = 00000004
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|06|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000004|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|06|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000004|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|05|00000000|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000014
instr: 00000000000100101000001010010011
### Fetch PC = 00000014
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000018|1|1|
### Decode PC = 00000010
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00038463|00000010|00000014|08|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000008|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000010|00000014|07|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
### Execute PC = 0000000c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|02|0|00000050|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000000c|00000010|06|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|10|00000000|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
### Memory PC = 00000008
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|07|00000000|fffff000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|07|fffff000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000008|0|1|00000000|
### Writeback PC = 00000004
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|06|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000004|0|1|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000005c
instr: 00000000000100101000001010010011
### Fetch PC = 0000005c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000060|0|1|
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
### Execute PC = 00000010
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000008|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000010|00000014|07|
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
|08|00000000|fffff000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
### Memory PC = 0000000c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|10|00000000|00000001|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|10|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000000c|0|1|00000000|
### Writeback PC = 00000008
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|07|fffff000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000008|0|1|
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
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000060
instr: 11111011000111111111000001101111
### Fetch PC = 00000060
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fb1ff06f|00000064|0|1|
### Decode PC = 0000005c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00128293|0000005c|00000060|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000001|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000005c|00000060|05|
|id_ex_io_in_rs||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
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
### Memory PC = 00000010
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|08|00000000|fffff000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|08|fffff000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000010|0|1|00000000|
### Writeback PC = 0000000c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|10|00000001|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000000c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000064
instr: 11111011010111111111000001101111
### Fetch PC = 00000064
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fb5ff06f|00000068|0|1|
### Decode PC = 00000060
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fb1ff06f|00000060|00000064|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7d|7|ffffffb0|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000060|00000064|1f|
|id_ex_io_in_rs||||
|11|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000005c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000001|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000005c|00000060|05|
|id_ex_io_data_rs2||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|05|00000000|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000005c|0|1|00000000|
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
### Writeback PC = 00000010
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|08|fffff000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000010|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000068
instr: 00000000000100101000001010010011
### Fetch PC = 00000068
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|0000006c|1|1|
### Decode PC = 00000064
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fb5ff06f|00000064|00000068|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7d|7|ffffffb4|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000064|00000068|1f|
|id_ex_io_in_rs||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
### Execute PC = 00000060
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7d|7|ffffffb0|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000060|00000064|1f|
|id_ex_io_data_rs2||||
|11|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000064|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000060|0|1|00000000|
### Memory PC = 0000005c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|05|00000000|00000001|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000005c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000005c|0|1|00000000|
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
|          4|00000000|00000000|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000010
instr: 00000000000000111000010001100011
### Fetch PC = 00000010
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00038463|00000014|0|1|
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
### Execute PC = 00000064
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7d|7|ffffffb4|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000064|00000068|1f|
|id_ex_io_data_rs2||||
|15|00000000|00000000|00000000|
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
|00000064|0|1|00000000|
### Memory PC = 00000060
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000064|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000060|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000064|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000060|0|1|00000000|
### Writeback PC = 0000005c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|05|00000001|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000005c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000014
instr: 00000000000100101000001010010011
### Fetch PC = 00000014
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000018|0|1|
### Decode PC = 00000010
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00038463|00000010|00000014|08|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000008|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|fffff000|00000010|00000014|07|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
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
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000064
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000064|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000064|0|1|00000000|
### Writeback PC = 00000060
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000064|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000060|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000001|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000018
instr: 00000100000000111001100001100011
### Fetch PC = 00000018
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|04039863|0000001c|0|1|
### Decode PC = 00000014
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00128293|00000014|00000018|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000001|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000001|00000014|00000018|05|
|id_ex_io_in_rs||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000010
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000008|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|fffff000|00000010|00000014|07|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|08|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
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
### Writeback PC = 00000064
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000064|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000001|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000001c
instr: 00000100000000110001101001100011
### Fetch PC = 0000001c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|04031a63|00000020|0|1|
### Decode PC = 00000018
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|04039863|00000018|0000001c|10|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|1|00000050|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|fffff000|00000018|0000001c|07|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000014
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000001|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000001|00000014|00000018|05|
|id_ex_io_data_rs2||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|05|00000000|00000002|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
### Memory PC = 00000010
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|08|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|08|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000010|0|1|00000000|
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
|          4|00000000|00000001|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000020
instr: 00000000000100101000001010010011
### Fetch PC = 00000020
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000024|1|1|
### Decode PC = 0000001c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|04031a63|0000001c|00000020|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|1|00000054|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000001c|00000020|06|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
### Execute PC = 00000018
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|02|1|00000050|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|fffff000|00000018|0000001c|07|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|10|00000000|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
### Memory PC = 00000014
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|05|00000000|00000002|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000002|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000014|0|1|00000000|
### Writeback PC = 00000010
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|08|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000010|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000001|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000068
instr: 00000000000100101000001010010011
### Fetch PC = 00000068
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|0000006c|0|1|
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
### Execute PC = 0000001c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|02|1|00000054|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000001c|00000020|06|
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
|14|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
### Memory PC = 00000018
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|10|00000000|00000001|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|10|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000018|0|1|00000000|
### Writeback PC = 00000014
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|05|00000002|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000014|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000001|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000006c
instr: 11111011000111111111000001101111
### Fetch PC = 0000006c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fb1ff06f|00000070|0|1|
### Decode PC = 00000068
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00128293|00000068|0000006c|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000001|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000002|00000068|0000006c|05|
|id_ex_io_in_rs||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
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
### Memory PC = 0000001c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|14|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|14|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000001c|0|1|00000000|
### Writeback PC = 00000018
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|10|00000001|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000018|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000002|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000070
instr: 11111011010111111111000001101111
### Fetch PC = 00000070
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fb5ff06f|00000074|0|1|
### Decode PC = 0000006c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fb1ff06f|0000006c|00000070|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7d|7|ffffffb0|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000006c|00000070|1f|
|id_ex_io_in_rs||||
|11|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000068
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000001|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000002|00000068|0000006c|05|
|id_ex_io_data_rs2||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|05|00000000|00000003|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000068|0|1|00000000|
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
### Writeback PC = 0000001c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|14|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000001c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000002|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000074
instr: 00000000000100101000001010010011
### Fetch PC = 00000074
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000078|1|1|
### Decode PC = 00000070
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fb5ff06f|00000070|00000074|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7d|7|ffffffb4|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000070|00000074|1f|
|id_ex_io_in_rs||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
### Execute PC = 0000006c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7d|7|ffffffb0|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000006c|00000070|1f|
|id_ex_io_data_rs2||||
|11|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|2|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|1|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000070|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000006c|0|1|00000000|
### Memory PC = 00000068
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|05|00000000|00000003|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000068|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000003|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000068|0|1|00000000|
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
|          4|00000000|00000002|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000001c
instr: 00000100000000110001101001100011
### Fetch PC = 0000001c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|04031a63|00000020|0|1|
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
### Execute PC = 00000070
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7d|7|ffffffb4|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000070|00000074|1f|
|id_ex_io_data_rs2||||
|15|00000000|00000000|00000000|
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
|00000070|0|1|00000000|
### Memory PC = 0000006c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000070|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000006c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000070|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000006c|0|1|00000000|
### Writeback PC = 00000068
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|05|00000003|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000068|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000002|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000020
instr: 00000000000100101000001010010011
### Fetch PC = 00000020
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000024|0|1|
### Decode PC = 0000001c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|04031a63|0000001c|00000020|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|1|00000054|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000001c|00000020|06|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|1|0|
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
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000070
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000070|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000070|0|1|00000000|
### Writeback PC = 0000006c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000070|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000006c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000003|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000024
instr: 00000100011000111100100001100011
### Fetch PC = 00000024
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|0463c863|00000028|0|1|
### Decode PC = 00000020
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00128293|00000020|00000024|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000001|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000003|00000020|00000024|05|
|id_ex_io_in_rs||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000001c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|02|1|00000054|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000001c|00000020|06|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|14|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000000|0|1|00000000|
### Writeback PC = 00000070
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000070|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000003|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 00000028
instr: 00000100011100110100101001100011
### Fetch PC = 00000028
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|04734a63|0000002c|0|1|
### Decode PC = 00000024
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|0463c863|00000024|00000028|10|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|4|00000050|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|fffff000|00000024|00000028|07|
|id_ex_io_in_rs||||
|06|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|0|1|00000000|
### Execute PC = 00000020
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000001|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000003|00000020|00000024|05|
|id_ex_io_data_rs2||||
|01|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|05|00000000|00000004|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
### Memory PC = 0000001c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|14|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|14|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000001c|0|1|00000000|
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
|          4|00000000|00000003|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

# pc 0000002c
instr: 00000000000100101000001010010011
### Fetch PC = 0000002c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000030|1|1|
### Decode PC = 00000028
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|04734a63|00000028|0000002c|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|02|4|00000054|fffff000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000028|0000002c|06|
|id_ex_io_in_rs||||
|07|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
### Execute PC = 00000024
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|02|4|00000050|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|fffff000|00000024|00000028|07|
|id_ex_io_data_rs2||||
|06|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|1|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|1|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|0|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|10|00000000|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000024|0|1|00000000|
### Memory PC = 00000020
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|05|00000000|00000004|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000004|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000020|0|1|00000000|
### Writeback PC = 0000001c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|14|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000001c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|0|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000003|00000000|fffff000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|00000000|00000000|00000000|00000000|
|         24|00000000|00000000|00000000|00000000|
|         28|00000000|00000000|00000000|00000000|
|-|-|-|-|-|
|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|
00000000: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000010: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000020: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000030: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000040: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000050: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000060: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx
00000070: xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx

