/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Đệ quy */
function recur(n) {
    // Điều kiện dừng
    if (n === 1) return 1;
    // Đệ quy: gọi đệ quy
    const res = recur(n - 1);
    // Trả về: trả về kết quả
    return n + res;
}

/* Mô phỏng đệ quy bằng vòng lặp */
function forLoopRecur(n) {
    // Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
    const stack = [];
    let res = 0;
    // Đệ quy: gọi đệ quy
    for (let i = n; i > 0; i--) {
        // Mô phỏng "đệ quy" bằng thao tác "push"
        stack.push(i);
    }
    // Trả về: trả về kết quả
    while (stack.length) {
        // Mô phỏng "trả về" bằng thao tác "pop"
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Đệ quy đuôi */
function tailRecur(n, res) {
    // Điều kiện dừng
    if (n === 0) return res;
    // Gọi đệ quy đuôi
    return tailRecur(n - 1, res + n);
}

/* Dãy Fibonacci: đệ quy */
function fib(n) {
    // Điều kiện dừng f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Gọi đệ quy f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Trả về kết quả f(n)
    return res;
}

/* Đoạn mã chạy thử */
const n = 5;
let res;

res = recur(n);
console.log(`Recursion sum result res = ${res}`);

res = forLoopRecur(n);
console.log(`Using iteration to simulate recursion sum result res = ${res}`);

res = tailRecur(n, 0);
console.log(`Tail recursion sum result res = ${res}`);

res = fib(n);
console.log(`The ${n}th Fibonacci number is ${res}`);

