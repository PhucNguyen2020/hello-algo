/**
* File: climbing_stairs_constraint_dp.cs
* Created Time: 2023-07-03
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* Leo cầu thang có ràng buộc: Quy hoạch động */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
        int[,] dp = new int[n + 1, 3];
        // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // Chuyển trạng thái: từng bước giải các bài toán con lớn hơn từ những bài nhỏ hơn
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsConstraintDP(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");
    }
}
