.data
N:
.word 6
M:
.word 6

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
.globl sum_negative

main:
    # a0 = base address of matrix
    la   a0, matrix
    # a1 = number of elements (6 * 6)
    li   a1, 36

    # call sum_negative(a0, a1), result in a0
    jal  ra, sum_negative

    # save result to memory (optional, for visibility)
    la   t0, sum
    sw   a0, 0(t0)

    # print result (Venus syscall: a0=1, a1=value)
    add  t1, a0, x0
    li   a0, 1
    add  a1, t1, x0
    ecall

    # print newline
    li   a0, 11
    li   a1, 10
    ecall

    # exit
    li   a0, 10
    ecall

# ----------------------------------------------------
# int sum_negative(int* data, int count)
# a0 = pointer to first element
# a1 = number of elements
# return a0 = sum of negative elements
# ----------------------------------------------------
sum_negative:
    add  t0, a0, x0      # t0 = current pointer
    add  t1, a1, x0      # t1 = remaining count
    li   t2, 0           # t2 = sum

loop:
    beq  t1, x0, done
    lw   t3, 0(t0)
    addi t0, t0, 4
    addi t1, t1, -1
    bge  t3, x0, loop
    add  t2, t2, t3
    j    loop

done:
    add  a0, t2, x0
    jalr x0, 0(ra)
