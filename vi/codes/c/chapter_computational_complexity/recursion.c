/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Đệ quy */
int recur(int n) {
    // Điều kiện dừng
    if (n == 1)
        return 1;
    // Đệ quy: gọi đệ quy
    int res = recur(n - 1);
    // Trả về: trả về kết quả
    return n + res;
}

/* Mô phỏng đệ quy bằng vòng lặp */
int forLoopRecur(int n) {
    int stack[1000]; // Dùng một mảng lớn để mô phỏng ngăn xếp
    int top = -1;    // Chỉ số đỉnh ngăn xếp
    int res = 0;
    // Đệ quy: gọi đệ quy
    for (int i = n; i > 0; i--) {
        // Mô phỏng "đệ quy" bằng thao tác "đẩy vào ngăn xếp"
        stack[1 + top++] = i;
    }
    // Trả về: trả về kết quả
    while (top >= 0) {
        // Mô phỏng "trả về" bằng thao tác "lấy ra khỏi ngăn xếp"
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* Đệ quy đuôi */
int tailRecur(int n, int res) {
    // Điều kiện dừng
    if (n == 0)
        return res;
    // Gọi đệ quy đuôi
    return tailRecur(n - 1, res + n);
}

/* Dãy Fibonacci: đệ quy */
int fib(int n) {
    // Điều kiện dừng f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Gọi đệ quy f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Trả về kết quả f(n)
    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\nRecursion sum result res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nUsing iteration to simulate recursion sum result res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nTail recursion sum result res = %d\n", res);

    res = fib(n);
    printf("\nThe %dth Fibonacci number is %d\n", n, res);

    return 0;
}
