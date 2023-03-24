
.globl main

.data

.text
main:
    # Solution 1
    and s3, s4, s5 # s3 = s4 & s5
    xori s3, s3, -1 # s3 = ~s3