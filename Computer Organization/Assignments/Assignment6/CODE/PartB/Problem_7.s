.globl main

.data
array: .asciiz "Hello World"

.text
main:
    la a0, array


    # Solution 1
    # Function:
    # t0 = pointer to array
    # t1 = current character
    # t2 = length of string
    add t0, x0, a0 # t0 = a0
    while: 
        lbu t1, 0(t0) # t1 = *t0
        beq t1, x0, end # if t1 == 0, goto end
        addi t0, t0, 1 # t0++
        j while # goto while
    end: 
        sub t2, t0, a0 # t2 = t0 - a0
    # End:
    add x0, x0, x0

