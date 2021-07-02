jal x0, .+32_9
add x0, x0, x0
add x0, x0, x0
add x0, x0, x0
add x0, x0, x0
add x0, x0, x0
add x0, x0, x0
add x0, x0, x0
.+32_9: lui x5, 61440
lui x6, 57344
lui x7, 32768
addi x20, x0, 63
lui x8, 63488
lui x11, 1048575
ori x12, x0, 12
sra x11, x11, x12
xor x11, x11, x0
slt x12, x11, x0
addi x10, x11, -1
sw x8, 4(x5)
lw x13, 0(x5)
add x13, x13, x13
add x13, x13, x13
sw x13, 0(x5)
addi x9, x9, 1
sw x9, 0(x6)
lw x15, 20(x0)
.-132_28: .-76_28: .-108_28: .28: lw x13, 0(x5)
add x13, x13, x13
add x13, x13, x13
sw x13, 0(x5)
lw x13, 0(x5)
and x23, x13, x7
addi x15, x15, 1
bne x15, x0, .+8_37
jal x1, .+104_62
.+8_37: lw x13, 0(x5)
addi x18, x0, 8
add x22, x18, x18
add x18, x18, x22
and x23, x13, x18
beq x23, x0, .+24_48
beq x23, x18, .+52_56
addi x18, x0, 16
blt x23, x18, .+56_59
sw x9, 0(x6)
jal x0, .-76_28
.+24_48: bne x10, x11, .+24_54
lui x10, 1048575
ori x12, x0, 12
sra x10, x10, x12
xor x10, x10, x0
add x10, x10, x10
.+24_54: sw x10, 0(x6)
jal x0, .-108_28
.+52_56: lw x9, 96(x17)
sw x9, 0(x6)
jal x0, .28
.+56_59: lw x9, 32(x17)
sw x9, 0(x6)
jal x0, .-132_28
.+104_62: lw x15, 20(x0)
add x10, x10, x10
ori x10, x10, 1
addi x17, x17, 4
and x17, x17, x20
add x9, x9, x12
bne x9, x11, .+8_70
addi x9, x9, 5
.+8_70: lw x13, 0(x5)
slli x23, x13, 0x02
sw x23, 0(x5)
sw x8, 4(x5)
jalr x0, x1, 0
