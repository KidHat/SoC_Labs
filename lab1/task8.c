#include <stdio.h>

#define N 6
#define M 6

/* Fixed 6x6 matrix for repeatable result */
static int matrix[M][N] = {
    {  3,  -1,  5,  -7,  2,   0 },
    { -4,   6, -2,   1, -3,   5 },
    {  9,  -8,  7,  -6,  4,  -1 },
    { -5,  -5,  2,   2, -9,   3 },
    {  0,   4, -4,  -4,  8,  -2 },
    {  1,   2,  3,  -3, -1, -10 }
};

static int sum_negative(const int data[M][N])
{
    int sum = 0;
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            if (data[i][j] < 0) {
                sum += data[i][j];
            }
        }
    }
    return sum;
}

int main(void)
{
    int result = sum_negative(matrix);
    printf("Sum of negative elements: %d\n", result);
    return 0;
}
