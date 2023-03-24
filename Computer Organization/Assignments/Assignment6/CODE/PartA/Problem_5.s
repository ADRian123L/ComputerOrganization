# Purpose: The program implements the C code in problem five.
# Author: Adrian Lozada

.globl main

.data
g: .word 4
h: .word 3

.text
main:
    lw t0, g # load g into t0
    lw t1, h # load h into t1
    # Problem a:
    srai t2, t0, 3 # divide by 8
    slli t2, t2, 3 # multiply by 8
    sub t3, t0, t2 # subtract
    addi t2, zero, 3 # set t2 to 3
    if:
        beq t3, t2, true # if t3 is equal to 3, go to true
        addi t2, zero, 5 # set t2 to 5
        beq t3, t2, true # if t3 is equal to 5, go to true
        j else
    true:
        slli t2, t1, 2 # multiply t1 by 4
        srai t3, t1, 1 # divide t2 by 4
        add t3, t3, t2 # add t3 and t2
        add t1, t1, t3 # add t1 and t3
        j end
    else:
        srai t3, t1, 4 # divide t1 by 16
        slli t3, t3, 4 # multiply t3 by 16
        sub t1, t1, t3 # subtract t3 from t0
    end:

    # Problem b:
    lw t0, g
    lw t1, h
    # Main program
    srai t3, t0, 4 # divide t0 by 16
    slli t3, t3, 4 # multiply t3 by 16
    sub t3, t0, t3 # subtract t3 from t0
    if2:
        addi t2, zero, 4 # set t2 to 4
        beq t3, t2, else2 # if t3 is equal to 4, go to else
        blt t3, t2, else2 # if t3 is less than 4, go to else
        addi t2, zero, 12 # set t2 to 12
        bge t3, t2, else2 # if t3 is greater than or equal to 12, go to else
        slli t3, t1, 2 # multiply t1 by 4
        add t1, t1, t3 # add t1 and t3
        add t1, t0, t1 # add t0 and t3
        srai t3, t1, 3 # divide t1 by 8
        slli t3, t3, 3 # multiply t3 by 8
        sub t1, t1, t3 # subtract t3 from t1
        jal end2
    else2:
        slli t2, t1, 3 # multiply t1 by 8
        srai t1, t1, 1  # divide t1 by 2
        add t1, t1, t2 # add t1 and t2
        add t1, t1, t0 # add t1 and t0
        slli t2, t1, 3 # multiply t1 by 8
        add t1, t2, t1 # add t1 and t2
    end2:
    # End of program
    addi x0, zero, 0