/**
 * File: recursion.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.Stack;

public class recursion {
    /* Đệ quy */
    static int recur(int n) {
        // Điều kiện dừng
        if (n == 1)
            return 1;
        // Đệ quy: gọi đệ quy
        int res = recur(n - 1);
        // Trả về: trả về kết quả
        return n + res;
    }

    /* Mô phỏng đệ quy bằng vòng lặp */
    static int forLoopRecur(int n) {
        // Sử dụng ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Đệ quy: gọi đệ quy
        for (int i = n; i > 0; i--) {
            // Mô phỏng "đệ quy" bằng thao tác "push"
            stack.push(i);
        }
        // Trả về: trả về kết quả
        while (!stack.isEmpty()) {
            // Mô phỏng "trả về" bằng thao tác "pop"
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Đệ quy đuôi */
    static int tailRecur(int n, int res) {
        // Điều kiện dừng
        if (n == 0)
            return res;
        // Gọi đệ quy đuôi
        return tailRecur(n - 1, res + n);
    }

    /* Dãy Fibonacci: đệ quy */
    static int fib(int n) {
        // Điều kiện dừng f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Gọi đệ quy f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Trả về kết quả f(n)
        return res;
    }

    /* Mã điều khiển */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\nKết quả tổng của hàm đệ quy res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nKết quả tổng khi dùng vòng lặp để mô phỏng đệ quy res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\nKết quả tổng của hàm đệ quy đuôi res = " + res);

        res = fib(n);
        System.out.println("\nSố hạng thứ " + n + " của dãy Fibonacci là " + res);
    }
}
