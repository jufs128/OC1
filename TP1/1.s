.data
input: .word 2, 16 #Input

.text
main:
 la x6, input
 lw x5, 0(x6) #Base
 lw x7, 4(x6) #Expoente
 lw x10, 0(x6) #Cópia da base para operações, preservando x5
 jal x1, exp #Chama a função exponencial
 addi x11, x10, 0 #Salva o resultado em x11
 addi x10, x0, 1 #Faz com que ecall imprima o resultado
 ecall #Imprime
 jal zero, end #Fim
 
exp:
 addi sp, sp, -4 #Lista para salvar os endereços de retorno da recursão
 sw x1, 4(sp) #Salva o endereço dessa iteração
 addi x28, x7, -1 #Tira um do expoente para comparação
 blt x0, x28, L1 #Verifica se faz outra iteração (expoente > 1)
 addi sp, sp, 4 #Tira o endereço dessa iteração da lista
 jalr x0, 0(x1) #Return
 
L1:
 addi x7, x7, -1 #Tira de fato um do expoente
 mul x10, x10, x5 #Multiplica o valor da iteração atual pela base
 jal x1, exp #Chama função da recursão
 lw x1, 4(sp) #Pega endereço da iteração anterior
 addi sp, sp, 4 #Tira o endereço dessa iteração da lista
 jalr x0, 0(x1) #Return
 
end: