rm ./fpga/* -rf
cp -r ./rtl ./fpga
cp -r ./tb ./fpga

for file in `ls ./fpga/rtl` #注意此处这是两个反引号，表示运行系统命令
	do
        if [ "${file##*.}"x = "v"x ]; then
            # echo $file
            sed -i '/`include/d' ./fpga/rtl/${file}
        fi
	done

for file in `ls ./fpga/tb` #注意此处这是两个反引号，表示运行系统命令
	do
        if [ "${file##*.}"x = "v"x ]; then
            # echo $file
            sed -i '/`include/d' ./fpga/tb/${file}
            sed -i 's#.verilog#C:/Users/kunzh/Documents/code/riscv/priscv/data/Test_37_Instr2.dat#' ./fpga/tb/${file}
        fi
	done
