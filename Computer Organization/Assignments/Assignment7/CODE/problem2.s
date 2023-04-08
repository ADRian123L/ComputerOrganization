.globl main

.data
    array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    size: .word 10
    number: .word 21

.text
main:
    la a0, array
    lw a1, size
    lw a2, number
    # Call the function.
    jal x0, find_int
    # End the program.
    addi a7, x0, 10
    ecall

# a0 is is the base of the array.
# a1 is the number of elements in the array.
# a2 is the number that the function searches for.

# The function returns the index in a0 (if found), otherwise -1.

find_int:
        addi t0, x0, 1 # t0 is 1.
        if: 
            blt a1, t0, return_1 # If size < 1 return -1
        add t0, a0, x0 # t0 is a pointer to a0.
        slli t3, a1, 2 # t3 is the size of the array in bytes.
        add t1 a0, t3 # t1 is a pointer to the last element of the array.
                
        loop:
            blt t1, t0, return_1 # t1 < t0
            lw t2, 0(t0) # t2 = *t0
            if_equal:
                    beq t2, a2, return_found # If t2 == a2 return the index.
            addi t0, t0, 4 # t0++
            jal x0, loop
                
        return_found:
                    sub a0, t0, a0 # Calculate the index.
                    srai a0, a0, 2
                    jalr x0, x1, 0
        return_1:
                addi a0, x0, -1 # Return -1.
                jalr x0, x1, 0