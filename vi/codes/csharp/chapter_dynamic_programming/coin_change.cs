/**
* File: coin_change.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change {
    /* Đổi tiền xu: Quy hoạch động */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Khởi tạo bảng dp
        int[,] dp = new int[n + 1, amt + 1];
        // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // Chuyển trạng thái: các hàng và cột còn lại
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }

    /* Đổi tiền xu: Quy hoạch động tối ưu không gian */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Khởi tạo bảng dp
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                    dp[a] = dp[a];
                } else {
                    // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 4;

        // Quy hoạch động
        int res = CoinChangeDP(coins, amt);
        Console.WriteLine("Minimum number of coins needed to make target amount is " + res);

        // Quy hoạch động tối ưu không gian
        res = CoinChangeDPComp(coins, amt);
        Console.WriteLine("Minimum number of coins needed to make target amount is " + res);
    }
}
