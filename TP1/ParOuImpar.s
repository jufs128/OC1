.data
n:  .word 245

.text
main:
	la x5, n
	lw x10, 0(x5)
	addi x7, x0, 1
	jal x1, ParOuImpar
	addi x10, x0, 1
	ecall
	jal exit

ParOuImpar:
	addi x6, x0, 2
	remu x11, x10, x6
	jalr x0, 0(x1)

exit: