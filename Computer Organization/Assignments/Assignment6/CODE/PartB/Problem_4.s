
.globl main

main:
# a)
    # g = t0
    # h = t1
if:
    bge t1, t0, else # t1 >= t0
    addi t0, t0, 9 # t0 = t0 + 9
    slli t2, t0, 2 # t2 = t0 * 4
    srai t3, t0, 1 # t3 = t0 / 2
    add t0, t2, t3 # t0 = t0 * 5
    j end
else:
    addi t1, t1, -5 # t1 = t1 - 5
    srai t1, t1, 3 # t1 = t1 / 8
end:
    
# b)
if2:
    blt t1, t0, else2 # t1 < t0
    slli t2, t1, 1 # t2 = t1 * 2
    add t1, t2, t1 # t1 = t1 * 3
    add t0, t1, t0 # t0 = t0 + t1
    andi t0, t0, 15 # t0 = t0 & 15
    j end2 # jump to end
else2:
    slli t0, t0, 1 # t0 = t0 * 2
    sub t0, t0, t1 # t0 = t0 - t1 
    slli t2, t1, 3 # t2 = t1 * 8
    slli t3, t1, 2 # t3 = t1 * 4
    add t1, t2, t3 # t1 = t1 * 12
end2: 
