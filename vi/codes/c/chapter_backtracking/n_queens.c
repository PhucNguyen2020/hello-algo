/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Giải thuật quay lui: bài toán N quân hậu */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // Khi đã đặt xong tất cả các hàng, ghi lại lời giải
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // Duyệt qua tất cả các cột
    for (int col = 0; col < n; col++) {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Đặt hàng tiếp theo
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // Quay lui: khôi phục ô này thành ô trống
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Giải bài toán N quân hậu */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // Ghi lại xem cột này đã có quân hậu chưa
    bool diags1[2 * MAX_SIZE - 1] = {false}; // Ghi lại xem đường chéo chính này đã có quân hậu chưa
    bool diags2[2 * MAX_SIZE - 1] = {false}; // Ghi lại xem đường chéo phụ này đã có quân hậu chưa

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("Input board size is %d\n", n);
    printf("Total queen placement solutions: %d\n", returnSize);
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("[");
            for (int k = 0; res[i][j][k] != '\0'; ++k) {
                printf("%c", res[i][j][k]);
                if (res[i][j][k + 1] != '\0') {
                    printf(", ");
                }
            }
            printf("]\n");
        }
        printf("---------------------\n");
    }

    // Giải phóng bộ nhớ
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
