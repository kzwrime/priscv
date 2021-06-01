ori x20, x0, 399
lui x21, 261013
or x20, x20, x21
lui x21, 624485
addi x21, x21, 837
addi x22, x20, -1024
xori x23, x20, 1980
sltiu x22, x20, 52
sltiu x23, x20, -1
andi x22, x20, 1893
slti x23, x20, -1
sub x22, x21, x20
xor x23, x20, x22
add x22, x21, x20
sub x22, x22, x20
or x23, x23, x22
and x23, x23, x22
slt x22, x20, x21
sltu x23, x20, x21
addi x3, x3, 4
sll x22, x20, x3
srl x22, x21, x3
sra x22, x21, x3
slli x23, x21, 0x10
srli x23, x21, 0x08
srai x23, x21, 0x08
addi x3, x0, 0
addi x5, x0, 245
sw x20, 0(x3)
sw x21, 4(x3)
sw x23, 8(x3)
sh x22, 4(x3)
sh x20, 10(x3)
sb x5, 7(x3)
sb x5, 9(x3)
sb x5, 8(x3)
lw x22, 0(x3)
sw x22, 12(x3)
lh x23, 8(x3)
sw x23, 16(x3)
lhu x23, 8(x3)
sw x20, 20(x3)
lb x22, 7(x3)
sw x21, 24(x3)
lbu x23, 7(x3)
sw x23, 28(x3)
lbu x23, 24(x3)
sw x23, 32(x3)
sw x0, 4(x3)
and x9, x0, x9
bne x20, x21, xx
addi x9, x9, 1
xx:
bge x20, x21, yy
addi x9, x9, 1
yy:
bgeu x20, x21, zz
addi x9, x9, 2
zz:
blt x20, x21, a1
addi x9, x9, 3
a1:
bltu x20, x21, a2
addi x9, x9, 4
a2:
lw x25, 24(x3)
beq x21, x25, a3
addi x9, x9, 5
a3:
sw x9, 4(x3)
lw x10, 4(x3)
jal x1, a4
addi x10, x10, 8
sw x10, 4(x3)
a4:
ori x10, x10, 1116
sw x10, 4(x3)
jalr x0, x1, 0
