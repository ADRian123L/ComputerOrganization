# Purpose: The program implements to solutions to some problems.
# Author: Adrian Lozada


.globl main

.data

.text
main:

    # Problem 1
    addi s7, zero, 59

    # Problem 2
    addi s7, zero, -199

    # Problem 3
    lui s7, 0xDDCBE
    addi s7, s7, 0x289

    # Problem 4
    lui s7, 0x11236
    lui s6, 0xBDF
    srli s5, s6, 12
    add s7, s7, s5

    # End
    ecall