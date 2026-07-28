/**
 * File: coin_change_ii.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class coin_change_ii {
    /* Đổi tiền xu II: Quy hoạch động */
    static int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // Khởi tạo bảng dp
        int[][] dp = new int[n + 1][amt + 1];
        // Khởi tạo cột đầu tiên
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }

    /* Đổi tiền xu II: Quy hoạch động tối ưu không gian */
    static int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
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

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 5;

        // Quy hoạch động
        int res = coinChangeIIDP(coins, amt);
        System.out.println("Number of coin combinations to make target amount is " + res);

        // Quy hoạch động tối ưu không gian
        res = coinChangeIIDPComp(coins, amt);
        System.out.println("Number of coin combinations to make target amount is " + res);
    }
}
