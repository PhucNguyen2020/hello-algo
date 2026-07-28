/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* Đệ quy */
fun recur(n: Int): Int {
    // Điều kiện dừng
    if (n == 1)
        return 1
    // Đi xuống: gọi đệ quy
    val res = recur(n - 1)
    // Đi lên: trả về kết quả
    return n + res
}

/* Mô phỏng đệ quy bằng vòng lặp */
fun forLoopRecur(n: Int): Int {
    // Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
    val stack = Stack<Int>()
    var res = 0
    // Đi xuống: gọi đệ quy
    for (i in n downTo 0) {
        // Mô phỏng "đệ quy" bằng "push"
        stack.push(i)
    }
    // Đi lên: trả về kết quả
    while (stack.isNotEmpty()) {
        // Mô phỏng "trả về" bằng "pop"
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Đệ quy đuôi */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Thêm từ khóa tailrec để bật tối ưu hóa đệ quy đuôi
    // Điều kiện dừng
    if (n == 0)
        return res
    // Gọi đệ quy đuôi
    return tailRecur(n - 1, res + n)
}

/* Dãy Fibonacci: đệ quy */
fun fib(n: Int): Int {
    // Điều kiện dừng f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Gọi đệ quy f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Trả về kết quả f(n)
    return res
}

/* Code chạy chính */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nRecursion sum result res = $res")

    res = forLoopRecur(n)
    println("\nUsing iteration to simulate recursion sum result res = $res")

    res = tailRecur(n, 0)
    println("\nTail recursion sum result res = $res")

    res = fib(n)
    println("\nThe ${n}th Fibonacci number is $res")
}