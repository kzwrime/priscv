
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
instr: 00011000111100000110101000010011
### Fetch PC = 00000000
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|18f06a13|00000004|0|1|
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
instr: 00111111101110010101101010110111
### Fetch PC = 00000004
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|3fb95ab7|00000008|0|1|
### Decode PC = 00000000
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|18f06a13|00000000|00000004|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|0c|6|0000018f|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000000|00000004|00|
|id_ex_io_in_rs||||
|0f|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|0|0|
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
instr: 00000001010110100110101000110011
### Fetch PC = 00000008
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|015a6a33|0000000c|0|1|
### Decode PC = 00000004
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|3fb95ab7|00000004|00000008|15|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|1f|5|3fb95000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000004|00000008|12|
|id_ex_io_in_rs||||
|1b|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000000
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|0c|6|0000018f|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000000|00000004|00|
|id_ex_io_data_rs2||||
|0f|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|14|00000000|0000018f|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|00|00000000|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
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
instr: 10011000011101100101101010110111
### Fetch PC = 0000000c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|98765ab7|00000010|0|1|
### Decode PC = 00000008
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|015a6a33|00000008|0000000c|14|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|6|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|00000008|0000000c|14|
|id_ex_io_in_rs||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000004
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|1f|5|3fb95000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000004|00000008|12|
|id_ex_io_data_rs2||||
|1b|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|15|00000000|3fb95000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000004|0|1|00000000|
### Memory PC = 00000000
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|14|00000000|0000018f|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000000|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|14|0000018f|00000000|
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
instr: 00110100010110101000101010010011
### Fetch PC = 00000010
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|345a8a93|00000014|0|1|
### Decode PC = 0000000c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|98765ab7|0000000c|00000010|15|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|4c|5|98765000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000000c|00000010|0c|
|id_ex_io_in_rs||||
|07|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000008
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|6|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|00000008|0000000c|14|
|id_ex_io_data_rs2||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|14|3fb95000|3fb9518f|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
### Memory PC = 00000004
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|15|00000000|3fb95000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000004|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|15|3fb95000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000004|0|1|00000000|
### Writeback PC = 00000000
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|14|0000018f|
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
instr: 11000000000010100000101100010011
### Fetch PC = 00000014
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|c00a0b13|00000018|0|1|
### Decode PC = 00000010
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|345a8a93|00000010|00000014|15|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|1a|0|00000345|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb95000|00000010|00000014|15|
|id_ex_io_in_rs||||
|05|00000000|00000000|00000000|
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
|4c|5|98765000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000000c|00000010|0c|
|id_ex_io_data_rs2||||
|07|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|0|1|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|15|00000000|98765000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
### Memory PC = 00000008
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|14|3fb95000|3fb9518f|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000008|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|14|3fb9518f|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000008|0|1|00000000|
### Writeback PC = 00000004
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|15|3fb95000|
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
|         20|0000018f|00000000|00000000|00000000|
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
instr: 01111011110010100100101110010011
### Fetch PC = 00000018
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|7bca4b93|0000001c|0|1|
### Decode PC = 00000014
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|c00a0b13|00000014|00000018|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|60|0|fffffc00|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000014|00000018|14|
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
|1a|0|00000345|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb95000|00000010|00000014|15|
|id_ex_io_data_rs2||||
|05|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|15|00000000|98765345|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
### Memory PC = 0000000c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|15|00000000|98765000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000000c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|15|98765000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000000c|0|1|00000000|
### Writeback PC = 00000008
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|14|3fb9518f|
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
|         20|0000018f|3fb95000|00000000|00000000|
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
instr: 00000011010010100011101100010011
### Fetch PC = 0000001c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|034a3b13|00000020|0|1|
### Decode PC = 00000018
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|7bca4b93|00000018|0000001c|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|3d|4|000007bc|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000018|0000001c|14|
|id_ex_io_in_rs||||
|1c|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000014
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|60|0|fffffc00|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000014|00000018|14|
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
|16|00000000|3fb94d8f|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
### Memory PC = 00000010
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|15|00000000|98765345|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000010|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|15|98765345|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000010|0|1|00000000|
### Writeback PC = 0000000c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|15|98765000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000000c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|3fb95000|00000000|00000000|
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
instr: 11111111111110100011101110010011
### Fetch PC = 00000020
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fffa3b93|00000024|0|1|
### Decode PC = 0000001c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|034a3b13|0000001c|00000020|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|01|3|00000034|3fb9518f|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|0000001c|00000020|14|
|id_ex_io_in_rs||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000018
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|3d|4|000007bc|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000018|0000001c|14|
|id_ex_io_data_rs2||||
|1c|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|00000000|3fb95633|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
### Memory PC = 00000014
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|00000000|3fb94d8f|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000014|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|3fb94d8f|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000014|0|1|00000000|
### Writeback PC = 00000010
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|15|98765345|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000010|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765000|00000000|00000000|
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
instr: 01110110010110100111101100010011
### Fetch PC = 00000024
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|765a7b13|00000028|0|1|
### Decode PC = 00000020
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fffa3b93|00000020|00000024|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7f|3|ffffffff|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000020|00000024|14|
|id_ex_io_in_rs||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000001c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|01|3|00000034|3fb9518f|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|0000001c|00000020|14|
|id_ex_io_data_rs2||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|3fb9518f|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
### Memory PC = 00000018
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|00000000|3fb95633|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000018|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|3fb95633|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000018|0|1|00000000|
### Writeback PC = 00000014
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|3fb94d8f|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000014|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000000|00000000|
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
instr: 11111111111110100010101110010011
### Fetch PC = 00000028
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|fffa2b93|0000002c|0|1|
### Decode PC = 00000024
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|765a7b13|00000024|00000028|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|3b|7|00000765|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000024|00000028|14|
|id_ex_io_in_rs||||
|05|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000020
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7f|3|ffffffff|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000020|00000024|14|
|id_ex_io_data_rs2||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|00000000|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
### Memory PC = 0000001c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|3fb9518f|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000001c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000001c|0|1|00000000|
### Writeback PC = 00000018
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|3fb95633|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000018|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|3fb94d8f|00000000|
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
instr: 01000001010010101000101100110011
### Fetch PC = 0000002c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|414a8b33|00000030|0|1|
### Decode PC = 00000028
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|fffa2b93|00000028|0000002c|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|7f|2|ffffffff|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000028|0000002c|14|
|id_ex_io_in_rs||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000024
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|3b|7|00000765|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000024|00000028|14|
|id_ex_io_data_rs2||||
|05|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|00000000|00000105|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000024|0|1|00000000|
### Memory PC = 00000020
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|00000000|00000001|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000020|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000020|0|1|00000000|
### Writeback PC = 0000001c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000001c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|3fb94d8f|3fb95633|
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

# pc 00000030
instr: 00000001011010100100101110110011
### Fetch PC = 00000030
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|016a4bb3|00000034|0|1|
### Decode PC = 0000002c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|414a8b33|0000002c|00000030|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|20|0|00000000|3fb9518f|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|98765345|0000002c|00000030|15|
|id_ex_io_in_rs||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000028
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|7f|2|ffffffff|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000028|0000002c|14|
|id_ex_io_data_rs2||||
|1f|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|00000000|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000028|0|1|00000000|
### Memory PC = 00000024
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|00000000|00000105|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000024|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|00000105|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000024|0|1|00000000|
### Writeback PC = 00000020
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|00000001|
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
|         20|3fb9518f|98765345|00000000|3fb95633|
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

# pc 00000034
instr: 00000001010010101000101100110011
### Fetch PC = 00000034
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|014a8b33|00000038|0|1|
### Decode PC = 00000030
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|016a4bb3|00000030|00000034|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|4|00000000|00000105|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000030|00000034|14|
|id_ex_io_in_rs||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000002c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|20|0|00000000|3fb9518f|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|98765345|0000002c|00000030|15|
|id_ex_io_data_rs2||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|3fb9518f|58bd01b6|xxxxxxxx|
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
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000028|0|1|00000000|
### Writeback PC = 00000024
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|00000105|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000024|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000000|00000001|
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

# pc 00000038
instr: 01000001010010110000101100110011
### Fetch PC = 00000038
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|414b0b33|0000003c|0|1|
### Decode PC = 00000034
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|014a8b33|00000034|00000038|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000000|3fb9518f|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|98765345|00000034|00000038|15|
|id_ex_io_in_rs||||
|14|00000000|00000000|00000000|
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
|00|4|00000000|00000105|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000030|00000034|14|
|id_ex_io_data_rs2||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|58bd01b6|67045039|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000030|0|1|00000000|
### Memory PC = 0000002c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|3fb9518f|58bd01b6|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000002c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|58bd01b6|00000000|
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
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000105|00000001|
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

# pc 0000003c
instr: 00000001011010111110101110110011
### Fetch PC = 0000003c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|016bebb3|00000040|0|1|
### Decode PC = 00000038
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|414b0b33|00000038|0000003c|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|20|0|00000000|3fb9518f|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|58bd01b6|00000038|0000003c|16|
|id_ex_io_in_rs||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000034
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000000|3fb9518f|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|98765345|00000034|00000038|15|
|id_ex_io_data_rs2||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|3fb9518f|d82fa4d4|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000034|0|1|00000000|
### Memory PC = 00000030
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|58bd01b6|67045039|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000030|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|67045039|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000030|0|1|00000000|
### Writeback PC = 0000002c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|58bd01b6|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000002c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000105|00000000|
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

# pc 00000040
instr: 00000001011010111111101110110011
### Fetch PC = 00000040
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|016bfbb3|00000044|0|1|
### Decode PC = 0000003c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|016bebb3|0000003c|00000040|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|6|00000000|58bd01b6|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|67045039|0000003c|00000040|17|
|id_ex_io_in_rs||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000038
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|20|0|00000000|3fb9518f|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|58bd01b6|00000038|0000003c|16|
|id_ex_io_data_rs2||||
|14|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|3fb9518f|98765345|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000038|0|1|00000000|
### Memory PC = 00000034
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|3fb9518f|d82fa4d4|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000034|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|d82fa4d4|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000034|0|1|00000000|
### Writeback PC = 00000030
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|67045039|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000030|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|58bd01b6|00000000|
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

# pc 00000044
instr: 00000001010110100010101100110011
### Fetch PC = 00000044
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|015a2b33|00000048|0|1|
### Decode PC = 00000040
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|016bfbb3|00000040|00000044|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|7|00000000|d82fa4d4|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|67045039|00000040|00000044|17|
|id_ex_io_in_rs||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000003c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|6|00000000|58bd01b6|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|67045039|0000003c|00000040|17|
|id_ex_io_data_rs2||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|98765345|ff76537d|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000003c|0|1|00000000|
### Memory PC = 00000038
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|3fb9518f|98765345|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000038|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|98765345|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000038|0|1|00000000|
### Writeback PC = 00000034
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|d82fa4d4|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000034|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|58bd01b6|67045039|
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

# pc 00000048
instr: 00000001010110100011101110110011
### Fetch PC = 00000048
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|015a3bb3|0000004c|0|1|
### Decode PC = 00000044
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|015a2b33|00000044|00000048|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|2|00000000|98765345|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000044|00000048|14|
|id_ex_io_in_rs||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000040
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|7|00000000|d82fa4d4|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|67045039|00000040|00000044|17|
|id_ex_io_data_rs2||||
|16|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|98765345|98765345|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000040|0|1|00000000|
### Memory PC = 0000003c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|98765345|ff76537d|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000003c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|ff76537d|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000003c|0|1|00000000|
### Writeback PC = 00000038
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|98765345|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000038|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|d82fa4d4|67045039|
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

# pc 0000004c
instr: 00000000010000011000000110010011
### Fetch PC = 0000004c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|00418193|00000050|0|1|
### Decode PC = 00000048
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|015a3bb3|00000048|0000004c|17|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|3|00000000|98765345|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000048|0000004c|14|
|id_ex_io_in_rs||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000044
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|2|00000000|98765345|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000044|00000048|14|
|id_ex_io_data_rs2||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|2|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|98765345|00000000|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000044|0|1|00000000|
### Memory PC = 00000040
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|98765345|98765345|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000040|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|2|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|98765345|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000040|0|1|00000000|
### Writeback PC = 0000003c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|ff76537d|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000003c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|98765345|67045039|
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

# pc 00000050
instr: 00000000001110100001101100110011
### Fetch PC = 00000050
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|003a1b33|00000054|0|1|
### Decode PC = 0000004c
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|00418193|0000004c|00000050|03|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|0|00000004|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|00000000|0000004c|00000050|03|
|id_ex_io_in_rs||||
|04|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000048
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|3|00000000|98765345|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000048|0000004c|14|
|id_ex_io_data_rs2||||
|15|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|3|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|17|98765345|00000001|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000048|0|1|00000000|
### Memory PC = 00000044
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|98765345|00000000|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000044|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|3|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|00000000|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000044|0|1|00000000|
### Writeback PC = 00000040
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|98765345|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000040|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|98765345|ff76537d|
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

# pc 00000054
instr: 00000000001110101101101100110011
### Fetch PC = 00000054
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|003adb33|00000058|0|1|
### Decode PC = 00000050
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|003a1b33|00000050|00000054|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|1|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|3fb9518f|00000050|00000054|14|
|id_ex_io_in_rs||||
|03|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 0000004c
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|0|00000004|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|00000000|0000004c|00000050|03|
|id_ex_io_data_rs2||||
|04|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|1|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|0|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|03|00000000|00000004|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000004c|0|1|00000000|
### Memory PC = 00000048
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|17|98765345|00000001|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000048|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|0|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|17|00000001|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000048|0|1|00000000|
### Writeback PC = 00000044
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|16|00000000|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000044|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|98765345|98765345|
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

# pc 00000058
instr: 01000000001110101101101100110011
### Fetch PC = 00000058
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|403adb33|0000005c|0|1|
### Decode PC = 00000054
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|003adb33|00000054|00000058|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|00|5|00000000|00000000|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|98765345|00000054|00000058|15|
|id_ex_io_in_rs||||
|03|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000050
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|1|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|3fb9518f|00000050|00000054|14|
|id_ex_io_data_rs2||||
|03|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|1|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|00000004|fb9518f0|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000050|0|1|00000000|
### Memory PC = 0000004c
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|03|00000000|00000004|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|0000004c|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|1|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|03|00000004|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|0000004c|0|1|00000000|
### Writeback PC = 00000048
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|17|00000001|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|00000048|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000000|98765345|
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
instr: 00000001000010101001101110010011
### Fetch PC = 0000005c
|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|
|-|-|-|-|
|010a9b93|00000060|0|1|
### Decode PC = 00000058
|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|
|-|-|-|-|
|403adb33|00000058|0000005c|16|
|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|
|20|5|00000000|00000004|
|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|
|98765345|00000058|0000005c|15|
|id_ex_io_in_rs||||
|03|00000000|00000000|00000000|
|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
### Execute PC = 00000054
|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|
|-|-|-|-|
|00|5|00000000|00000000|
|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|
|98765345|00000054|00000058|15|
|id_ex_io_data_rs2||||
|03|00000000|00000000|00000000|
|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|
|2|0|0|0|
|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|
|0|0|0|0|
|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|
|0|1|0|0|
|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|
|1|0|1|00000000|
|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|
|16|00000004|09876534|xxxxxxxx|
|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000054|0|1|00000000|
### Memory PC = 00000050
|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|
|-|-|-|-|
|16|00000004|fb9518f0|xxxxxxxx|
|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|
|00000050|0|1|00000000|
|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|
|0|0|0|1|
|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|
|0|0|1|0|
|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|
|1|16|fb9518f0|00000000|
|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||
|00000050|0|1|00000000|
### Writeback PC = 0000004c
|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|
|-|-|-|-|
|0|1|03|00000004|
|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|
|00000000|0000004c|0|1|
|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||
|0|1|00000000|00000000|

|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|
|-|-|-|-|-|
|          0|00000000|00000000|00000000|00000000|
|          4|00000000|00000000|00000000|00000000|
|          8|00000000|00000000|00000000|00000000|
|         12|00000000|00000000|00000000|00000000|
|         16|00000000|00000000|00000000|00000000|
|         20|3fb9518f|98765345|00000000|00000001|
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


