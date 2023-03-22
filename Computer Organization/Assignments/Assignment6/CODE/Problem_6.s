# Purpose: This file comments the purpose of some assembly code snippets.
# Author: Adrian Lozada

.globl main

.data

.text
main:
    # Problem a:
    # The snippet of code loads the first and third element of the arr array,
    # it adds them together, and stores the sum as the second element of the array
    # arr.
    lw t0, 0(a0) # Loads the first element (3) of array arr into t0.
    lw t1, 8(a0) # Loads the third element (4) of array arr into t1.
    add t2, t0, t1  # Adds the two elements and stores the sum (7) in t2.
    sw t2, 4(a0) # Stores the sum in the second element of array arr.
    
    # Problem b:
    # The snippet of code implements a loop. The loop iterates six times 
    # (the number of elements in the array), and uses t0 as an iteration counter.
    # Furthermore, the snippet of code uses t4 as a pointer to the address of each 
    # element in the array arr. At every iteration the snippet of code multiplies 
    # each element of the array arr by negative one.
    add t0, x0, x0 # Sets t0 to 0.
loop: slti t1, t0, 6 # Sets t1 to 1 if t0 is less than 6, otherwise sets it to 0.
    beq t1, x0, end # Branches to the label end if t1 equals 0.
    slli t2, t0, 2 # Shifts t0 logically left by 2 bits and puts the result in t2.
    add t3, a0, t2 # Adds t3 and a0 and puts the result in t3.
    lw t4, 0(t3) # Loads the word value stores at address of t3 into t4.
    sub t4, x0, t4 # Subtracts t4 from x0 (negates t4) and puts the result in t4.
    sw t4, 0(t3) # Stores the word value of t4 at the address of t3.
    addi t0, t0, 1 # Increments t0 by 1.
    j loop # Jumps to the label loop.
end: