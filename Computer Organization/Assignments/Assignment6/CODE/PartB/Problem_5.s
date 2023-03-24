.globl  main

.text
main:

# a)
    andi t2, t0, 15 # t2 = t0 % 16
if:
    addi t3, x0, 9 # t3 = 9
    beq t2, t3, then # if t2 == t3
    addi t3, x0, 12 # t3 = 12
    beq t2, t3, then # if t2 == t3
    j else
then:
    srai t1, t1, 1 # t1 = t1 / 2
    sub t1, t0, t1 # t1 = t0 - t1
    slli t2, t1, 1 # t2 = t1 * 2
    srai t3, t1, 1 # t3 = t1 / 2
    add t0, t2, t3 # t1 = t2 + t3
    add t0, t0, t1 # t0 = t0 + t1
    j end
else:
    srai t2, t1, 1
    add t1, t1, t2
    add t1, t0, t1
    andi t0, t0, 7
end:

# b)
    andi t3, t0, 31 # t3 = t0 % 32
if2:
    addi t2, x0, 6 # t2 = 6 
    bge t2, t3, else2 # if t2 >= t3
    addi t2, x0, 17 # t2 = 17
    bge t2, t3, else2  # if t2 >= t3
    slli t2, t1, 2 # t2 = t1 * 4
    slli t3, t1, 1 # t3 = t1 * 2
    add t1, t2, t3 # t1 = t1 * 7
    add t1, t0, t1 # t1 = t1 + t0
    andi t0, t0, 3 # t0 = t0 % 4
    j end2
else2:
    slli t2, t1, 3 # t2 = t1 * 8
    srai t3, t1, 1 # t3 = t1 / 2
    sub t1, t2, t3 # t1 = t2 - t3
    add t1, t0, t1 # t1 = t1 + t0
    slli t2, t1, 3 # t2 = t1 * 8
    sub t1, t2, t1 # t1 = t2 - t1
end2:

