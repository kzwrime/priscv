SOURCE_NOEXT := ./tb/tb_top4
SOURCE := ${SOURCE_NOEXT}.v
TARGET := ${SOURCE_NOEXT}.o

# 1, 4, 6
# TEST_HEX := ./riscv-tests-s/origin/build/riscv32_sim6.verilog
TEST_HEX := ./data/Test_37_Instr2.dat
# TEST_HEX := ./data/second/SOC_CPU_DEMO37.dat

test1:
	if [!{-f tmp}]; then mkdir tmp; fi
	rm -f ${SOURCE_NOEXT}.md ${SOURCE_NOEXT}.vcd ${TARGET}
	make -C ./riscv-tests-s/origin
	cp ${SOURCE} ${SOURCE}.bk
	sed -i 's#.verilog#${TEST_HEX}#' ${SOURCE}
	# iverilog ${SOURCE} -D HEXFILE="${TEST_HEX}" -o ${TARGET}
	iverilog ${SOURCE} -o ${TARGET}
	mv ${SOURCE}.bk ${SOURCE}
	vvp ${TARGET}

test2:
	if [!{-f tmp}]; then mkdir tmp; fi
	rm -f ${SOURCE_NOEXT}.md ${SOURCE_NOEXT}.vcd ${TARGET}
	cp ${SOURCE} ${SOURCE}.bk
	sed -i 's#.verilog#${TEST_HEX}#' ${SOURCE}
	iverilog ${SOURCE} -o ${TARGET}
	mv ${SOURCE}.bk ${SOURCE}
	vvp ${TARGET}

clean:
	make -C ./riscv-tests-s/origin clean
	rm -f ${SOURCE_NOEXT}.md ${SOURCE_NOEXT}.vcd ${TARGET}
	rm ./tmp/* -rf

modify:
	sed -i '/`ifndef SYNTHESIS/,/`endif \/\/ SYNTHESIS/d' rtl/CPU.v
	sed -i '/`ifdef/,/`endif/d' rtl/CPU.v
	sed -i '/`ifndef/,/`endif/d' rtl/CPU.v
	./utils/check_include.sh 	rtl/CPU.v

disassem:
	riscv-machinsn-decode hexstring $(cat ./data/I_mem.coe) >> ./data/I_mem.asm