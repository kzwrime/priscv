ori x5, x0, 564
lui x6, 1
or x5, x5, x6
lui x6, 624485
addi x7, x5, 837
addi x8, x6, -1024
xori x9, x5, 1980
sltiu x3, x7, 52
sltiu x4, x5, -1
andi x18, x9, 1893
slti x20, x6, 291
sub x19, x6, x5
xor x21, x20, x6
add x22, x21, x20
add x22, x22, x5
sub x23, x22, x6
or x25, x23, x22
and x26, x23, x22
slt x27, x25, x26
sltu x28, x25, x26
addi x3, x3, 4
sll x27, x26, x3
srl x28, x25, x3
sra x29, x25, x3
slli x27, x19, 0x10
srli x28, x19, 0x04
srai x29, x19, 0x04
addi x3, x0, 0
addi x5, x0, 255
sw x19, 0(x3)
sw x21, 4(x3)
sw x23, 8(x3)
sh x26, 4(x3)
sh x19, 10(x3)
sb x5, 7(x3)
sb x5, 9(x3)
sb x5, 8(x3)
lw x5, 0(x3)
sw x5, 12(x3)
lh x7, 2(x3)
sw x7, 16(x3)
lhu x7, 2(x3)
sw x7, 20(x3)
lb x8, 3(x3)
sw x8, 24(x3)
lbu x8, 3(x3)
sw x8, 28(x3)
lbu x8, 1(x3)
sw x8, 32(x3)
sw x0, 0(x3)
and x9, x0, x9
bne x5, x7, .+8
addi x9, x9, 1
bge x5, x7, .+8
addi x9, x9, 1
bgeu x5, x7, .+8
addi x9, x9, 1
blt x5, x7, .+8
addi x9, x9, 1
bltu x5, x7, .+0
addi x9, x9, 1
beq x7, x8, .+8
addi x9, x9, 1
sw x9, 0(x3)
lw x10, 0(x3)
jal x1, .+12
addi x10, x10, 5
sw x10, 0(x3)
ori x10, x10, 1360
sw x10, 0(x3)
jalr x0, x1, 0
