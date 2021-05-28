# riscv32-unknown-elf-gcc test.c -Ttext=0x0000 -o test
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -Ttext=0x0000 -nostdlib test.c -o test
riscv32-unknown-elf-objdump -d test > test.dump
riscv32-unknown-elf-objcopy -O verilog test test.verilog
riscv32-unknown-elf-objcopy -O ihex test test.hex
# srec_cat test.bin -binary -o test.mif -mif