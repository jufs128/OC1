.data
source: .word 10, 13, 1, 6, 24, 5, 7, −1
dest: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
main:
 la x6, source
 la x30, dest
 li x28, 0 #k = 0
 li x11, 0 #sum = 0
 lw x5, 0(x6) #source[0]
 li x7, 2 #2
 bge x5, x0, loop #if source[0] >= 0
 
loop:
 rem x29, x28, x7 # k % 2
 jal x1, if1 # if k%2 != 0
 
 addi x28, x28, 1
 mul x29, x28, 4 #k * 4
 add x10, x6, x29 #endereço de source[k]
 lw x5, 0(x10) #source[k]
 add x10, x30, x29 #endereço de dest[k]
 bge x5, x0, loop
 addi x10, x0, 1
 ecall
 jal zero, end
 
if:
 rem x29, x28, x7 # k % 2
 bne x29, x0, squarePlusOne #if (k % 2) != 0
 jalr x0, 0(x1)

squarePlusOne:
 rem x29, x5, x7 # source[k]%2
 bne x29, x0, else
 
 sw x5, 0(x10) #dest[k] = source[k]
 addi x11, x11, x5 #sum += dest[k]
 jalr x0, 0(x1)

else:
 addi x29, x5, 1 #source[k]+1
 mul x29, x29, x5 #(source[k] + 1) * source[k]
 
 sw x29, 0(x10) #dest[k] = (source[k] + 1) * source[k]
 addi x11, x11, x29 #sum += dest[k]
 jalr x0, 0(x1)

end:
