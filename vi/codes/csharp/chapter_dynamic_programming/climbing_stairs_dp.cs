/**
* File: climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* Leo cầu thang: Quy hoạch động */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
        int[] dp = new int[n + 1];
        // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
        dp[1] = 1;
        dp[2] = 2;
        // Chuyển trạng thái: từng bước giải các bài toán con lớn hơn từ những bài nhỏ hơn
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* Leo cầu thang: Quy hoạch động tối ưu không gian */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }

    [Test]
    public void Test() {
        int n = 9;

        int res = ClimbingStairsDP(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");

        res = ClimbingStairsDPComp(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");
    }
}
