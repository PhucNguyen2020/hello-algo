/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* Cắt tích lớn nhất: Giải thuật tham lam */
    int MaxProductCutting(int n) {
        // Khi n <= 3, phải cắt ra một đoạn 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Tham lam cắt ra các đoạn 3, a là số lượng đoạn 3, b là phần dư
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // Khi phần dư là 1, chuyển một cặp 1 * 3 thành 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // Khi phần dư là 2, không cần làm gì
            return (int)Math.Pow(3, a) * 2;
        }
        // Khi phần dư là 0, không cần làm gì
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // Giải thuật tham lam
        int res = MaxProductCutting(n);
        Console.WriteLine("Maximum cutting product is" + res);
    }
}