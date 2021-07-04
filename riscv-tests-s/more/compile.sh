riscv-none-embed-gcc -march=rv32i -mabi=ilp32 --specs=nosys.specs -nostdlib -nostartfiles -lc -lgcc -o graphic.out graphic.c
# sed -i 's?main:?main: ?g' ./fpga/rtl/${file}
