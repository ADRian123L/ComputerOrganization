# Purpose: This file comments the purpose of some assembly code snippets.
# Author: Adrian Lozada

.globl main

.data

.text
main:
    # Problem a:

    # This code snippet loads the first and third elements of the 'arr' array, 
    # adds them together, and stores the sum in the second element of the array.
        
    lw t0, 0(a0)    # Load the first element (3) of the 'arr' array into register t0.
    lw t1, 8(a0)    # Load the third element (4) of the 'arr' array into register t1.
    add t2, t0, t1  # Add the values in registers t0 and t1, storing the sum (7) in register t2.
    sw t2, 4(a0)    # Store the sum (value in t2) in the second element of the 'arr' array.

    # Problem b:

    # This code snippet implements a loop that iterates six times (the number of elements in the 'arr' array). 
    # During each iteration, it negates the value of the current element in the array.

    add t0, x0, x0       # Initialize t0 (loop counter) to 0.
loop:
    slti t1, t0, 6       # Set t1 to 1 if t0 is less than 6 (number of iterations), otherwise set it to 0.
    beq t1, x0, end      # If t1 equals 0 (t0 is not less than 6), branch to the label 'end'.
    slli t2, t0, 2       # Multiply t0 by 4 (bitwise left shift by 2) and store the result in t2 (element offset).
    add t3, a0, t2       # Calculate the address of the current element by adding a0 (base address of 'arr') and t2, store it in t3.
    lw t4, 0(t3)         # Load the value of the current element in the 'arr' array into t4.
    sub t4, x0, t4       # Negate the value of t4 (multiply by -1) by subtracting it from x0 (which is 0), and store the result in t4.
    sw t4, 0(t3)         # Store the negated value of t4 back into the current element of the 'arr' array.
    addi t0, t0, 1       # Increment the loop counter (t0) by 1.
    j loop               # Jump to the label 'loop' to continue iterating.
end:
