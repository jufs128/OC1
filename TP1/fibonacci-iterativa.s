.data
input: .word 8 #Input

.text
main:
 la x6, input
 lw x5, 0(x6) #x5 é n
 beq x5, x0, C0 #Se n = 0
 addi x7, x0, 1
 beq x5, x7, C1 #Se n = 1 
 addi x7, x7, 1
 addi x11, x0, 1 #Se n = 2, resultado é 1
 addi x29, x0, 1 #Número anterior é 1
 blt x7, x5, loop #Se n > 2
 addi x10, x0, 1 #Imprime
 ecall #Imprime
 jal zero, end
 
C0:
 addi x11, x0, 0 #Se n = 0, resultado é 0
 addi x10, x0, 1 #Imprime
 ecall #Imprime
 jal zero, end

C1:
 addi x11, x0, 1 #Se n = 1, resultado é 1
 addi x10, x0, 1 #Imprime
 ecall #Imprime
 jal zero, end
 
loop:
 addi x28, x11, 0 #Salva o valor atual da sequencia
 add x11, x11, x29 #Soma ao valor anterior
 addi x29, x28, 0 #Salva o calor atual como anterior
 addi x7, x7, 1 #Adiciona 1 ao número de iterações
 blt x7, x5, loop #Se ainda deve fazer mais iterações
 addi x10, x0, 1 #Imprime
 ecall #Imprime
 jal zero, end
 
end:
