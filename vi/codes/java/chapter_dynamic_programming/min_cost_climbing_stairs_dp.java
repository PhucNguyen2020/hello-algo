/**
 * File: min_cost_climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_cost_climbing_stairs_dp {
    /* Chi phí tối thiểu leo cầu thang: Quy hoạch động */
    public static int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
        int[] dp = new int[n + 1];
        // Trạng thái khởi tạo: gán trước lời giải cho bài toán con nhỏ nhất
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Chi phí tối thiểu leo cầu thang: Quy hoạch động tối ưu không gian */
    public static int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }

    public static void main(String[] args) {
        int[] cost = { 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
        System.out.println(String.format("Input staircase cost list is %s", Arrays.toString(cost)));

        int res = minCostClimbingStairsDP(cost);
        System.out.println(String.format("Minimum cost to climb staircase is %d", res));

        res = minCostClimbingStairsDPComp(cost);
        System.out.println(String.format("Minimum cost to climb staircase is %d", res));
    }
}
