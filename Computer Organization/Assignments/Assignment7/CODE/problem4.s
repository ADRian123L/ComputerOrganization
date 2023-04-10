.globl main

.data
    # Array of integers:
    arr: .word 64, 25, 12, 22, 11, 32, 1, 3, 4, 5, 6, 7, 1, 0, 56
    len: .word 15

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
                        # s1 is j
                        # s2 is min_idx
                        # s4 is a0
                        # s5 is a1
                        # s6 si a1 - 1 (size)
                        # s7 is min_idx

                        # Save the s registers into the stack:
                        addi sp, sp, -32
                        sw s0, 0(sp)
                        sw s1, 4(sp)
                        sw s2, 8(sp)
                        sw s3, 12(sp)
                        sw s4, 16(sp)
                        sw s5, 20(sp)
                        sw s6, 24(sp)
                        sw x1, 28(sp)

                        # Store a0 and a1:
                        add s4, a0, x0
                        add s5, a1, x0
            
                        # Sort the array:
                        addi s6, a1, -1 # pass n - 1 
                        add s0, x0, x0 # i = 0
                        for:
                            bge s0, s6, end_loop # i > n goto end_loop

                            # Call findMinimum function:
                            slli t0, s0, 2  
                            add a0, s4, t0 # pass &array[i]
                            sub a1, s5, s0 # pass n - i 
                            jal x1, findMinimum
                            
                            

                            # Set min_idx to the value in a0:
                            add s2, a0, x0 

                            if_swap:
                                beq s2, s0, continue # min_idx == i
                                # Call the swap function:
                                add t0, s2, s0 # t0 = min_idx + i
                                slli t0, t0, 2 
                                add a0, s4, t0 # a0 = &array[min_idx + i]
                                slli t0, s0, 2 
                                add a1, s4, t0 # a1 = &array[i]
                                jal x1, swap # Call swap

                            continue:

                            # Increment i:
                            addi s0, s0, 1

                            # Jump to Loop:
                            j for

                        end_loop:

                        # Restore the s registers:
                        lw s0, 0(sp)
                        lw s1, 4(sp)
                        lw s2, 8(sp)
                        lw s3, 12(sp)
                        lw s4, 16(sp)
                        lw s5, 20(sp)
                        lw s6, 24(sp)
                        lw x1, 28(sp)

                        # Empty the stack:
                        addi sp, sp, 32

                        # Return:
                        jalr x0, x1, 0


        # findMinimum takes a0 (base address) and a1 (number of elements).
        findMinimum:
                    # t0 is min_idx
                    # t1 is min_E

                    # Initialize min_idx and min_E:
                    add t0, x0, x0 # min_idx = 0
                    add t2, a0, t0 # a0 + min_idx
                    lw t1, 0(t2) # t1 = array[a0 + min_idx]

                    # Loop through the array:
                    # t3 is i
                    addi t3, x0, 1
                    for_loop_2:
                        # Condition:
                        bge t3, a1, end_loop_2 # i > a0 goto end_loop_2
                        # Body:
                        slli t4, t3, 2
                        add t4, a0, t4 # t4 = &array[i]
                        
                        # t5 = arr[i]
                        lw t5, 0(t4)
                        if_2:
                            bge t5, t1, continue_2  # array[i] >= arrar[a0 + min_idx]  
                            add t0, t3, x0
                            slli t6, t0, 2
                            add t6, a0, t6
                            lw t1, 0(t6) # t1 == array[i]

                        continue_2:
                        
                        # Increment i:
                        addi t3, t3, 1

                        # Jump to Loop:
                        jal x0, for_loop_2
                    
                    end_loop_2:
                    # Return min_idx:
                    add a0, t0, x0
                    # Return:
                    jalr x0, x1, 0

        # swap takes a0 (address of first element) and a1 (address of second element).
        swap:
                # t0 is temp
                # t1 is a0
		
                # Interchange the values:
                lw t0, 0(a0) # temp = a0
                lw t1, 0(a1) # a0 = a1 
                sw t1, 0(a0) 
                sw t0, 0(a1)
	
                # Return:
                jalr x0, x1, 0

