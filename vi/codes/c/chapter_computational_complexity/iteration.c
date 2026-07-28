/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* Vòng lặp for */
int forLoop(int n) {
    int res = 0;
    // Tính tổng 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Vòng lặp while */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Cập nhật biến điều kiện
    }
    return res;
}

/* Vòng lặp while (cập nhật hai lần) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Cập nhật biến điều kiện
        i++;
        i *= 2;
    }
    return res;
}

/* Vòng lặp for lồng nhau */
char *nestedForLoop(int n) {
    // n * n là số điểm, chuỗi "(i, j), " có độ dài tối đa 6+10*2, cộng thêm khoảng trống cho ký tự null \0
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // Lặp i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // Lặp j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nFor loop sum result res = %d\n", res);

    res = whileLoop(n);
    printf("\nWhile loop sum result res = %d\n", res);

    res = whileLoopII(n);
    printf("\nWhile loop (two updates) sum result res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nNested for loop traversal result %s\r\n", resStr);
    free(resStr);

    return 0;
}
