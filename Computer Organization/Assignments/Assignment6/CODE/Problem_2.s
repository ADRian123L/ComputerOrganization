# Purpose: The program implements NOR.
# Author: Adrian Lozada
# Date: 20/3/2023

.globl main

.text
main:
    # Test:
    addi x20, x0, 9 # s4 = 0
    addi x21, x0, 12 # s5 = 0
    addi x5, x0, -1 # t0 = -1

# The answer to question number two.
    # s3 = s4 NOR s5
    or s3, s4, s5 # s3 = s4 OR s5
    xor s3, s3, x5 # s3 = s3 XOR -1
    add x0, x0, x0

    # End of program
    ecall
