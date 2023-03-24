
.globl main

main:
    # a)
    # The code snippet takes the second and third element of the array 'arr' and adds them together.
    # It then stores the result in the first element of the array 'arr'.
    lw t0, 4(a0) # Load the value stored at the address 4(a0) into t0. This is the second element of the array.
    lw t1, 8(a0) # Load the value stored at the address 8(a0) into t1. This is the third element of the array.
    add t2, t0, t1 # Add t0 and t1 and store the result in t2
    sw t2, 0(a0) # Store the value at register t2 at the address 0(a0). This is the first element of the array.

    # b)
    # This code snippet implements a loop that iterates six times (the number of elements in the 'arr' array). 
    # During each iteration, it negates the value of the current element in the array.
        addi t0, a0, 0 # Initialize t0 to the start of the array
        addi t1, a0, 24 # Initialize t1 to the end of the array
    loop: beq t0, t1, end # If t0 == t1, end the loop
        lw t2, 0(t0) # Load the value stored at the address stores in t0 into t2
        sub t2, x0, t2 # Negate t2
        sw t4, 0(t0) # Store the value in t4 at the address 0(t0)
        addi t0, t0, 4 # Increment t0 by 4
        j loop # Jump to the loop label
    end: