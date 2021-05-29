
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
### Memory PC = xxxxxxxx
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|xx|xxxxxxxx|xxxxxxxx|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|xxxxxxxx|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|x|x|x|x|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|00000000|00000000|00000000|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|00000000|00000000|00000000|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|00000000|00000000|00000000|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|00000000|00000000|00000000|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|05|00000000|00000000|00000000|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|00000000|00000000|00000000|
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
instr: 00000000000000000000000000010011
### Fetch PC = 0000000c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000010|0|1|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|06|00000000|00000000|00000004|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000004|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|05|00000000|00000000|00000000|
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
instr: 00000000000000000000000000010011
### Fetch PC = 00000010
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000014|0|1|
### Decode PC = 0000000c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|0000000c|00000010|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000000c|00000010|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|07|00000000|fffff000|fffff008|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
### Memory PC = 00000004
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|06|00000000|00000000|00000004|
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
instr: 00000000000000000000000000010011
### Fetch PC = 00000014
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000018|0|1|
### Decode PC = 00000010
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|00000010|00000014|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000010|00000014|00|
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
### Execute PC = 0000000c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000000c|00000010|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|xxxxx000|00000000|0000000c|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
### Memory PC = 00000008
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|07|00000000|fffff000|fffff008|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
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

# pc 00000018
instr: 00010110000000110000101001100011
### Fetch PC = 00000018
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|16030a63|0000001c|0|1|
### Decode PC = 00000014
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|00000014|00000018|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000014|00000018|00|
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
### Execute PC = 00000010
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000010|00000014|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|xxxxx000|00000000|00000010|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
### Memory PC = 0000000c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|xxxxx000|00000000|0000000c|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
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

# pc 0000001c
instr: 00000000000000000000000000010011
### Fetch PC = 0000001c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000020|0|1|
### Decode PC = 00000018
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|16030a63|00000018|0000001c|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|0b|0|00000174|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000018|0000001c|06|
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
### Execute PC = 00000014
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000014|00000018|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|00000000|00000000|00000014|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
### Memory PC = 00000010
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|xxxxx000|00000000|00000010|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000010|0|1|00000000|
### Writeback PC = 0000000c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000000c|0|1|
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

# pc 00000020
instr: 00000000000000000000000000010011
### Fetch PC = 00000020
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000024|0|1|
### Decode PC = 0000001c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|0000001c|00000020|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000001c|00000020|00|
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
### Execute PC = 00000018
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|0b|0|00000174|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000018|0000001c|06|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|14|00000000|00000001|0000018c|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
### Memory PC = 00000014
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|00000000|00000000|00000014|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|1|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000014|0|1|00000000|
### Writeback PC = 00000010
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000010|0|1|
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

# pc 00000024
instr: 00000000000000000000000000010011
### Fetch PC = 00000024
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000028|1|1|
### Decode PC = 00000020
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|00000020|00000024|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000020|00000024|00|
|id_ex_io_in_rs||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
### Execute PC = 0000001c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000001c|00000020|00|
|id_ex_io_data_rs2||||
|00|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|1|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|0000000X|00000000|0000001c|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
### Memory PC = 00000018
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|14|00000000|00000001|0000018c|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|1|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|14|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000018|0|1|00000000|
### Writeback PC = 00000014
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000014|0|1|
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

# pc 0000018c
instr: 00000000000100101000001010010011
### Fetch PC = 0000018c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00128293|00000190|0|1|
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
### Execute PC = 00000020
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000020|00000024|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|0000000X|00000000|00000020|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
### Memory PC = 0000001c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|0000000X|00000000|0000001c|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000001c|0|1|00000000|
### Writeback PC = 00000018
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|14|00000001|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000018|0|1|
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

# pc 00000190
instr: 00000000000000000000000000010011
### Fetch PC = 00000190
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000194|0|1|
### Decode PC = 0000018c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00128293|0000018c|00000190|05|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000001|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000018c|00000190|05|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|00000000|00000000|00000000|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000020
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|0000000X|00000000|00000020|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|0|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|00|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000020|0|1|00000000|
### Writeback PC = 0000001c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000001c|0|1|
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

# pc 00000194
instr: 00000000000000000000000000010011
### Fetch PC = 00000194
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|00000198|0|1|
### Decode PC = 00000190
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|00000190|00000194|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000190|00000194|00|
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
### Execute PC = 0000018c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000001|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000018c|00000190|05|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|05|00000000|00000000|0000018d|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000018c|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|00|00000000|00000000|00000000|
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
### Writeback PC = 00000020
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|00|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000020|0|1|
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

# pc 00000198
instr: 00000000000000000000000000010011
### Fetch PC = 00000198
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00000013|0000019c|0|1|
### Decode PC = 00000194
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00000013|00000194|00000198|00|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000194|00000198|00|
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
### Execute PC = 00000190
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000190|00000194|00|
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
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc|
|00|00000000|00000000|00000190|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000190|0|1|00000000|
### Memory PC = 0000018c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc|
|-|-|-|-|
|05|00000000|00000000|0000018d|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000018c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|05|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000018c|0|1|00000000|
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

