/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* Đổi tiền xu II: Quy hoạch động */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // Khởi tạo bảng dp
        int[,] dp = new int[n + 1, amt + 1];
        // Khởi tạo cột đầu tiên
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* Đổi tiền xu II: Quy hoạch động tối ưu không gian */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Khởi tạo bảng dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                    dp[a] = dp[a];
                } else {
                    // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 5;

        // Quy hoạch động
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("Number of coin combinations to make target amount is " + res);

        // Quy hoạch động tối ưu không gian
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("Number of coin combinations to make target amount is " + res);
    }
}
