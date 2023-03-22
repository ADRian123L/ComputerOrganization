#    Purpose: The program implements the solutions for finding the maximum and minimum 
#    values in an array.
#    Author: Adrian Lozada


.globl main

# Variables:
.data 
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length: .word 10

.text
main:
    # Load the address of array into a0 and the length into a1:
    la a0, array
    la a1, length

    # The function:
    #  t0 = max
    #  t1 = min
    #  t2 = counter
    #  t3 = the length of the array
    #  t4 = value of array[i]
    
    lw t1, 0(a0) # Load the first value of the array into t1
    lw t0, 0(a0) # Load the first value of the array into t0
    add t2, zero, zero # Initialize the counter to 0
    lw t3, 0(a1) # Load the length of the array into t3
    lw t4, 0(a0) # Load the first value of the array into t4
    for:
        bge t2, t3, end # If the counter is gr. or eq to length go: end
        bge t1, t4, skip_min # Does not change the min value
        add t1, t4, zero # Change the min value
        skip_min:
        blt t4, t0, skip_max # Does not change the max value
        add t0, t4, zero # Change the max value
        skip_max:
        addi t2, t2, 1 # Increment the counter
        addi a0, a0, 4 # Increment the address of the array
        lw t4, 0(a0) # Load the next value of the array into t4
        j for # Go to the for loop
        end:
        # End of the function
        ecall