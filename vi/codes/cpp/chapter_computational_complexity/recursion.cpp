/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Đệ quy */
int recur(int n) {
    // Điều kiện dừng
    if (n == 1)
        return 1;
    // Đệ: gọi đệ quy
    int res = recur(n - 1);
    // Quy: trả về kết quả
    return n + res;
}

/* Mô phỏng đệ quy bằng vòng lặp */
int forLoopRecur(int n) {
    // Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
    stack<int> stack;
    int res = 0;
    // Đệ: gọi đệ quy
    for (int i = n; i > 0; i--) {
        // Mô phỏng "đệ" bằng thao tác "push"
        stack.push(i);
    }
    // Quy: trả về kết quả
    while (!stack.empty()) {
        // Mô phỏng "quy" bằng thao tác "pop"
        res += stack.top();
        stack.pop();
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

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    cout << "\nRecursive function sum result res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nUsing iteration to simulate recursive sum result res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\nTail recursive function sum result res = " << res << endl;

    res = fib(n);
    cout << "\nThe " << n << "th term of the Fibonacci sequence is " << res << endl;

    return 0;
}
