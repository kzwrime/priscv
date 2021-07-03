rm ./fpga/* -rf
mkdir ./fpga
cp -r ./rtl ./fpga
cp -r ./tb ./fpga
mkdir ./fpga/rtl_gbk
mkdir ./fpga/tb_gbk

for file in `ls ./fpga/rtl` #注意此处这是两个反引号，表示运行系统命令
	do
        if [ "${file##*.}"x = "v"x ]; then
            # echo $file
            # sed -i 's?rtl/??g' ./fpga/rtl/${file}
            sed -i '/`include/d' ./fpga/rtl/${file}
            iconv -f UTF-8 -t GBK ./fpga/rtl/${file} > ./fpga/rtl_gbk/${file}
        fi
	done

for file in `ls ./fpga/tb` #注意此处这是两个反引号，表示运行系统命令
	do
        if [ "${file##*.}"x = "v"x ]; then
            # echo $file
            # sed -i 's?rtl/??g' ./fpga/tb/${file}
            sed -i '/`include/d' ./fpga/tb/${file}
            sed -i 's#.verilog#C:/Users/kunzh/Documents/code/riscv/priscv/data/Test_37_Instr2.dat#' ./fpga/tb/${file}
            iconv -f UTF-8 -t GBK ./fpga/tb/${file} > ./fpga/tb_gbk/${file}
        fi
	done
