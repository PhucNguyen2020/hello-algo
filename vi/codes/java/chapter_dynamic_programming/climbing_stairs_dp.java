/**
 * File: climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* Leo cầu thang: Quy hoạch động */
    public static int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
        int[] dp = new int[n + 1];
        // Trạng thái khởi tạo: gán trước lời giải cho bài toán con nhỏ nhất
        dp[1] = 1;
        dp[2] = 2;
        // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* Leo cầu thang: Quy hoạch động tối ưu không gian */
    public static int climbingStairsDPComp(int n) {
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

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDP(n);
        System.out.println(String.format("Climbing %d stairs has %d solutions", n, res));

        res = climbingStairsDPComp(n);
        System.out.println(String.format("Climbing %d stairs has %d solutions", n, res));
    }
}
