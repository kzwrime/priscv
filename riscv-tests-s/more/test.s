	.option nopic
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	slli	a5,a5,1
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	test, .-test
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
