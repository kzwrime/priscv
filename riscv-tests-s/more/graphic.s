	.file	"graphic.c"
	.option nopic
	.text
	.globl	__mulsi3
	.align	2
	.globl	boxfill8
	.type	boxfill8, @function
boxfill8:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	sw	a5,-56(s0)
	sw	a6,-60(s0)
	mv	a5,a2
	sb	a5,-41(s0)
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	j	.L2
.L5:
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	j	.L3
.L4:
	lw	a1,-40(s0)
	lw	a0,-24(s0)
	call	__mulsi3
	mv	a5,a0
	mv	a4,a5
	lw	a5,-20(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	lbu	a4,-41(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L3:
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	ble	a4,a5,.L4
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a4,-24(s0)
	lw	a5,-60(s0)
	ble	a4,a5,.L5
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	boxfill8, .-boxfill8
	.align	2
	.globl	linefill8
	.type	linefill8, @function
linefill8:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	mv	a5,a1
	sb	a5,-21(s0)
	lw	a5,-20(s0)
	addi	a5,a5,291
	lbu	a4,-21(s0)
	sb	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	linefill8, .-linefill8
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a6,200
	li	a5,200
	li	a4,40
	li	a3,40
	li	a2,255
	li	a1,1024
	li	a0,-286265344
	call	boxfill8
	li	a1,255
	li	a0,291
	call	linefill8
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
