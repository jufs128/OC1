.data
	n:  .word 3
.text
main:
	la x5, n
	lw x10, 0(x5)
	jal x1, fatorial

	addi x11, x10, 0
	addi x10, x0, 1
	ecall

	jal exit

fatorial:
	addi x2, x2, -16
	sw x1, 8(x2)
	sw x10, 0(x2)
	addi x5, x10, -1
	bge x5, x0, loop
	addi x10, x0, 1
	addi x2, x2, 16
	jalr x0, 0(x1)

loop:
	addi x10, x10, -1
	jal x1, fatorial
	addi x6, x10, 0
	lw x10, 0(x2)
	lw x1, 8(x2)
	addi x2, x2, 16
	mul x10, x10, x6
	jalr x0, 0(x1)

exit: