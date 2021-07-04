	.file	"graphic.c"
	.option nopic
	.text
	.align	1
	.globl	hlt_t
	.type	hlt_t, @function
hlt_t:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L3
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	hlt_t, .-hlt_t
	.align	1
	.globl	hlt
	.type	hlt, @function
hlt:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
.L6:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	sw	a5,-20(s0)
	j	.L6
	.size	hlt, .-hlt
	.align	1
	.globl	init_palatte
	.type	init_palatte, @function
init_palatte:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	li	a5,201326592
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	j	.L8
.L9:
	lw	a5,-20(s0)
	slli	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a4,a5
	lui	a4,%hi(table.0)
	addi	a3,a4,%lo(table.0)
	lw	a4,-20(s0)
	slli	a4,a4,1
	add	a4,a3,a4
	lhu	a4,0(a4)
	sh	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L8:
	lw	a4,-20(s0)
	li	a5,14
	ble	a4,a5,.L9
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_palatte, .-init_palatte
	.align	1
	.globl	boxfill8
	.type	boxfill8, @function
boxfill8:
	addi	sp,sp,-64
	sw	s0,60(sp)
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
	j	.L12
.L15:
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	j	.L13
.L14:
	lw	a5,-24(s0)
	slli	a4,a5,10
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
.L13:
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	ble	a4,a5,.L14
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L12:
	lw	a4,-24(s0)
	lw	a5,-60(s0)
	ble	a4,a5,.L15
	nop
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	boxfill8, .-boxfill8
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	call	init_palatte
	li	a5,218103808
	sw	a5,-20(s0)
.L18:
	li	a6,120
	li	a5,120
	li	a4,20
	li	a3,20
	li	a2,1
	li	a1,320
	lw	a0,-20(s0)
	call	boxfill8
	li	a6,150
	li	a5,170
	li	a4,50
	li	a3,70
	li	a2,2
	li	a1,320
	lw	a0,-20(s0)
	call	boxfill8
	li	a6,180
	li	a5,220
	li	a4,80
	li	a3,120
	li	a2,4
	li	a1,320
	lw	a0,-20(s0)
	call	boxfill8
	j	.L18
	.size	main, .-main
	.data
	.align	2
	.type	table.0, @object
	.size	table.0, 32
table.0:
	.half	0
	.half	3840
	.half	240
	.half	4080
	.half	15
	.half	3855
	.half	255
	.half	4095
	.half	2730
	.half	2304
	.half	144
	.half	2448
	.half	9
	.half	2313
	.half	153
	.half	2730
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
