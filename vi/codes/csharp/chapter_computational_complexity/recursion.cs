/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* Đệ quy */
    int Recur(int n) {
        // Điều kiện dừng
        if (n == 1)
            return 1;
        // Đệ: gọi đệ quy
        int res = Recur(n - 1);
        // Quy: trả về kết quả
        return n + res;
    }

    /* Mô phỏng đệ quy bằng vòng lặp */
    int ForLoopRecur(int n) {
        // Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp lệnh gọi của hệ thống
        Stack<int> stack = new();
        int res = 0;
        // Đệ: gọi đệ quy
        for (int i = n; i > 0; i--) {
            // Mô phỏng "đệ" bằng "đẩy vào ngăn xếp"
            stack.Push(i);
        }
        // Quy: trả về kết quả
        while (stack.Count > 0) {
            // Mô phỏng "quy" bằng "lấy ra khỏi ngăn xếp"
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Đệ quy đuôi */
    int TailRecur(int n, int res) {
        // Điều kiện dừng
        if (n == 0)
            return res;
        // Gọi đệ quy đuôi
        return TailRecur(n - 1, res + n);
    }

    /* Dãy Fibonacci: đệ quy */
    int Fib(int n) {
        // Điều kiện dừng f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Gọi đệ quy f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Trả về kết quả f(n)
        return res;
    }

    /* Chương trình chính */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\nRecursive function sum result res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\nUsing iteration to simulate recursive sum result res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\nTail recursive function sum result res = " + res);

        res = Fib(n);
        Console.WriteLine("\nThe " + n + "th term of the Fibonacci sequence is " + res);
    }
}
