.data
	v1: .word 2 1 3
    v2: .word 3 2 1
    n: .word 3

.text
main:
	la x5, n
    lw x7, 0(x5)
	jal permutacao
    
    addi x11, x23, 0
    addi x10, x0, 1
    ecall
    
    jal exit
    
permutacao:
	addi sp, sp, -8
    sw x1, 4(sp)
    
    li x28, 0
	la x5, v1
    lw x20, 0(x5)
    lw x21, 4(x5)
    lw x22, 8(x5)
    jal bolha
    sw x20, 0(x29)
    sw x21, 0(x29)
    sw x20, 0(x29)
    
    li x28, 0
	la x5, v2
    lw x20, 0(x5)
    lw x21, 4(x5)
    lw x22, 8(x5)
    jal bolha
    sw x20, 0(x30)
    sw x21, 0(x30)
    sw x20, 0(x30)
    
    li x23, 0
    lw x12, 0(x29)
    lw x13, 0(x30)
    bne x12, x13, if2
    lw x12, 4(x29)
    lw x13, 4(x30)
    bne x12, x13, if2
    lw x12, 8(x29)
    lw x13, 8(x30)
    bne x12, x13, if2
    
    lw x1, 4(sp)
    addi sp, sp, 8
    jr x1

bolha:
	addi sp, sp, -8
    sw x1, 8(sp)
    
    addi x18, x20, 0
    addi x19, x21, 0
    blt x19, x18, if
    addi x20, x18, 0
    addi x21, x19, 0
    
    addi x18, x21, 0
    addi x19, x22, 0
    blt x19, x18, if
    addi x21, x18, 0
    addi x22, x19, 0
    
    lw x1, 8(sp)
    addi sp, sp, 8
    
    addi x28, x28, 1
    blt x28, x7, bolha 
    jr x1
    
if:
    addi x6, x18, 0
    addi x18, x19, 0
    addi x19, x6, 0
    lw x1, 8(sp)
    addi sp, sp, 8
    jr x1
    
if2:
	addi x23, x0, 1
    jr x1
    
exit: