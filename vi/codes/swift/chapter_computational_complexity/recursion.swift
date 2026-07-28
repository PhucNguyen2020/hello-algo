/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Đệ quy */
func recur(n: Int) -> Int {
    // Điều kiện dừng
    if n == 1 {
        return 1
    }
    // Đệ quy: gọi đệ quy
    let res = recur(n: n - 1)
    // Trả về: trả về kết quả
    return n + res
}

/* Mô phỏng đệ quy bằng vòng lặp */
func forLoopRecur(n: Int) -> Int {
    // Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp lệnh gọi của hệ thống
    var stack: [Int] = []
    var res = 0
    // Đệ quy: gọi đệ quy
    for i in (1 ... n).reversed() {
        // Mô phỏng "đệ quy" bằng "đẩy vào ngăn xếp"
        stack.append(i)
    }
    // Trả về: trả về kết quả
    while !stack.isEmpty {
        // Mô phỏng "trả về" bằng "lấy ra khỏi ngăn xếp"
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* Đệ quy đuôi */
func tailRecur(n: Int, res: Int) -> Int {
    // Điều kiện dừng
    if n == 0 {
        return res
    }
    // Gọi đệ quy đuôi
    return tailRecur(n: n - 1, res: res + n)
}

/* Dãy Fibonacci: đệ quy */
func fib(n: Int) -> Int {
    // Điều kiện dừng f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // Gọi đệ quy f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // Trả về kết quả f(n)
    return res
}

@main
enum Recursion {
    /* Mã điều khiển */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nRecursion sum result res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nUsing iteration to simulate recursion sum result res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nTail recursion sum result res = \(res)")

        res = recursion.fib(n: n)
        print("\nThe \(n)th Fibonacci number is \(res)")
    }
}
