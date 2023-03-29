# The program is used to practice RISC-V assembly language programming.

.globl main

.data


.text
main:
    
# The function adds two numbers and returns the result.
sum:
    if:
        addi sp, sp, -12
        sw ra, 8(sp)
        sw t0, 4(sp)
        sw t1, 0(sp)
        addi t2, x0, 0  
        bge t0, x0, else
        add t2, t1, t2
        jalr x0, 0(ra)
        else:
        add t2, t0, t2
        jalr x0, 0(ra)
        ifend:
        lw ra, 8(sp)
        lw t0, 4(sp)
        lw t1, 0(sp)
        addi sp, sp, 12
        ret
        