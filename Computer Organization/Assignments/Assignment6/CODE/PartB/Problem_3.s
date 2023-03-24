.globl main
 
 .text
 main:
    # a)
    addi s7, x0, 45
    # b)
    addi s7, x0, -119
    # c)
    lui s7, 0xFEDCC
    addi s7, s7, 0x8AB
    # d)
    lui s7, 0xAABCD
    addi s7, s7, 0x325