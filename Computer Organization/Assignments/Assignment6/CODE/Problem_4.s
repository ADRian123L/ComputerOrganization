# Purpose: The program implements the C code into assembly.
# Author: Adrian Lozada

.globl main

.data
g: .word 2
h: .word 1

.text
main:
    lw t0, g # t0 = g
    lw t1, h # t1 = h
    # Part a:
    # g: t0 and h: t1
    if: 
        bge t1, t0, else # if (h >= g): else
        addi t0, t0, 7 # g = g + 7
        addi t2, zero, 1 # t2 = 1
        sll t3, t0, t2 # g * 2
        sra t0, t0, t2 # g / 2
        add t0, t0, t3 # g = g * 2 + g / 2
        jal x0, end
    else:
        addi t1, t1, -6 # g = g - 6
        srai t1, t1, 4 # g = g / 16
    end:
    add x0, x0, x0 # nop

    # Part b:
    lw t0, g # t0 = g
    lw t1, h # t1 = h
    # g: t0 and h: t1
    if2: 
        blt t1, t0, else2 # if (g > h): else
        sub t0, t0, t1 # g = g - h
        srai t3, t0, 5 # g = g / 32
        slli t3, t3, 5 # g = g * g
        sub t0, t0, t3 # g = g - g * g
        jal a0, end2
    else2:
        slli t2, t1, 1 # h = h * 2
        add t1, t1, t2 # h = h * 3
        add t0, t1, t0 # g = g + h * 3
        slli t3, t0, 4 # h = g * 16
        slli t2, t0, 1 # h = g * 2
        sub t0, t3, t2 # g = g * 16 + g * 2
    end2:
    add x0, x0, x0 # nop
