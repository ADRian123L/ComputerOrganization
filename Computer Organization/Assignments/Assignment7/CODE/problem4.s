.globl main

.data
    # Array of integers:
    arr: .word 64, 25, 12, 22, 11, 32, 1, 3, 4, 5, 6, 7, 1, 0, 56, 123, 313, 12, 34, 434, 8
    len: .word 21

.text
main:
    # Test the selectionSort function:

    # Call the selectionSort function:
    la a0, arr
    lw a1, len
    jal x1, selectionSort

    # Print the sorted array:
    la a0, arr
    lw a1, len
    jal x1, printArray
	
    # Exit:
    li a7, 10
    ecall

    # Print the array:
    printArray:
                # t0 is i
                # t4 is a0
                # t5 is a1

                add t4, a0, x0
                add t5, a1, x0

                # Loop through the array:
                add t0, x0, x0
                for_print:
                    # Condition:
                    bge t0, t5, end_loop_print # t0 (counter) >= t5 goto end_loop_print
                    # Body:
                    slli t1, t0, 2
                    add t1, t4, t1
                    # t2 = arr[i]
                    lw t2, 0(t1)
                    
                    # Print the value:
                    li a7, 1
                    add a0, t2, x0
                    ecall
                    
                    # Print a new line char:
                    li a7, 11
                    addi a0, x0, '\n'
                    ecall

                    # Increment i:
                    addi t0, t0, 1

                    # Jump to Loop:
                    jal x0, for_print

                end_loop_print:
                # Return:
                jalr x0, x1, 0


# selectionSort takes a0 (base address) and a1 (number of elements).
        selectionSort:
                        # s0 is i
                        # s1 is min_idx
                        # s2 is a0 or arr[]
                        # s3 is a1 or n
                        # s4 is n - 1

                        # Save the s and ra registers into the stack:
                        addi sp, sp, -24
                        sw s0, 0(sp) 
                        sw s1, 4(sp)
                        sw s2, 8(sp)
                        sw s3, 12(sp)
                        sw s4, 16(sp)
                        sw ra, 20(sp)

                        # Store a0 and a1:
                        add s2, a0, zero
                        add s3, a1, zero 
            
                        # Sort the array:
                        addi s4, a1, -1 # pass n - 1 
                        add s0, zero, zero # i = 0
                        for:
                            bge s0, s4, end_loop # i >= n - 1 goto end_loop

                            # Call findMinimum function:
                            slli t0, s0, 2 # i * 4  
                            add a0, s2, t0 # pass &array[i] to a0
                            sub a1, s3, s0 # pass n - i 
                            jal ra, findMinimum

                            # Set min_idx to the value in a0:
                            add s1, a0, zero 

                            if_swap:
                                beq s1, zero, continue # min_idx == 0 goto continue

                                # Call the swap function:
                                add t0, s1, s0 # t0 = min_idx + i
                                slli t0, t0, 2 # (min_idx + i) * 4 
                                add a0, s2, t0 # a0 = &array[min_idx + i]
                                slli t0, s0, 2 # i * 4
                                add a1, s2, t0 # a1 = &array[i]
                                jal zero, swap # Call swap

                            continue:

                            # Increment i:
                            addi s0, s0, 1

                            # Jump to Loop:
                            jal zero, for

                        end_loop:

                        # Restore the s registers:
                        lw s0, 0(sp)
                        lw s1, 4(sp)
                        lw s2, 8(sp)
                        lw s3, 12(sp)
                        lw s4, 16(sp)
                        lw ra, 20(sp)

                        # Empty the stack:
                        addi sp, sp, 24 

                        # Return:
                        jalr zero, ra, 0

        # findMinimum takes a0 (base address) and a1 (number of elements).
        findMinimum:
                    # t0 is min_idx
                    # t1 is min_E

                    # Initialize min_idx and min_E:
                    add t0, zero, zero # min_idx = 0
                    add t2, a0, t0 # (a0 + min_idx) 
                    lw t1, 0(t2) # t1 = array[a0 + min_idx * 4]

                    # Loop through the array:

                    # t3 is i
                    addi t3, zero, 1

                    for_loop_2:
                        # Condition:
                        bge t3, a1, end_loop_2 # i >= a0 goto end_loop_2
                        # Body:
                        slli t4, t3, 2
                        add t4, a0, t4 # t4 = &array[i]
                        
                        # t5 = arr[i]
                        lw t5, 0(t4)

                        if_2:
                            bge t5, t1, continue_2  # array[i] >= min_E goto continue_2  
                            add t0, t3, zero # min_idx = i
                            slli t6, t0, 2 # min_idx * 4
                            add t6, a0, t6
                            lw t1, 0(t6) # t1 == array[i]

                        continue_2:
                        
                        # Increment i:
                        addi t3, t3, 1

                        # Jump to Loop:
                        jal zero, for_loop_2
                    
                    end_loop_2:
                    # Return min_idx:
                    add a0, t0, zero 
                    # Return:
                    jalr zero, ra, 0

        # swap takes a0 (address of first element) and a1 (address of second element).
        swap:
                # t0 is temp
                # t1 is temp_2 
		
                # Interchange the values:
                lw t0, 0(a0) # temp = *a0
                lw t1, 0(a1) # temp_2 = *a1 
                sw t1, 0(a0) # *a0 = temp_2 
                sw t0, 0(a1) # *a1 = temp
	
                # Return:
                jalr zero, ra, 0