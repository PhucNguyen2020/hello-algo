/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Bài toán cái túi không giới hạn: Quy hoạch động */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Khởi tạo bảng dp
        int[][] dp = new int[n + 1][cap + 1];
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Nếu vượt quá dung lượng túi, không chọn vật phẩm i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Bài toán cái túi không giới hạn: Quy hoạch động tối ưu không gian */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Khởi tạo bảng dp
        int[] dp = new int[cap + 1];
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Nếu vượt quá dung lượng túi, không chọn vật phẩm i
                    dp[c] = dp[c];
                } else {
                    // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 1, 2, 3 };
        int[] val = { 5, 11, 15 };
        int cap = 4;

        // Quy hoạch động
        int res = unboundedKnapsackDP(wgt, val, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);

        // Quy hoạch động tối ưu không gian
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);
    }
}
