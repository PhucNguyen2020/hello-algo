/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* Vòng lặp for */
    int ForLoop(int n) {
        int res = 0;
        // Tính tổng 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Vòng lặp while */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Khởi tạo biến điều kiện
        // Tính tổng 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // Cập nhật biến điều kiện
        }
        return res;
    }

    /* Vòng lặp while (hai lần cập nhật) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Khởi tạo biến điều kiện
        // Tính tổng 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Cập nhật biến điều kiện
            i += 1;
            i *= 2;
        }
        return res;
    }

    /* Vòng lặp for lồng nhau */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Lặp i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Lặp j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* Chương trình chính */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nfor loop sum result res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile loop sum result res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile loop (two updates) sum result res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\nDouble for loop traversal result " + resStr);
    }
}
