.data
input: .word 7

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
 li x30, 2
 jal x1, loop 
 addi x10, x0, 1 #Imprime
 ecall #Imprime
 jal zero, end
 
loop:
 beq x30, x5, EndLoop
 addi sp, sp, -4
 sw x1, 0(sp) #Salvando o endereço da recursão
 addi x31, x11, 0 #Salvando o valor do anterior
 add x11, x11, x29 #Somando os valores anteriores
 add x29, x31, x0 #Atualiza anterior
 addi x30, x30, 1 #Aumenta a contagem
 jal x1, loop #Proxima recursão
 lw x1, 0(sp)
 addi sp, sp, 4
 jalr x0,0(x1)
 
EndLoop:
 jalr x0, 0(x1)

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
 
end:
