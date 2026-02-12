.data

N:
.word 6
M:
.word 6

# 6x6 matrix with mixed positive and negative values
matrix:
.word   3,  -1,   5,  -7,   2,   0
.word  -4,   6,  -2,   1,  -3,   5
.word   9,  -8,   7,  -6,   4,  -1
.word  -5,  -5,   2,   2,  -9,   3
.word   0,   4,  -4,  -4,   8,  -2
.word   1,   2,   3,  -3,  -1, -10

sum:
.word 0

.text
.globl main

main:
    la   t0, matrix     # t0 = pointer to current element
    li   t1, 36         # t1 = remaining element count (6*6)
    addi t2, x0, 0      # t2 = running sum

loop:
    beq  t1, x0, done   # if no elements left -> exit loop
    lw   t3, 0(t0)      # load current element
    addi t0, t0, 4      # advance pointer
    addi t1, t1, -1     # decrement counter
    blt  t3, x0, add_neg
    j    loop

add_neg:
    add  t2, t2, t3     # accumulate negative value
    j    loop

done:
    la   t4, sum
    sw   t2, 0(t4)      # store result

    addi a0, x0, 1      # print_int
    add  a1, t2, x0
    ecall

    addi a0, x0, 11     # print_character
    addi a1, x0, 10     # newline
    ecall

    addi a0, x0, 10     # exit
    ecall
