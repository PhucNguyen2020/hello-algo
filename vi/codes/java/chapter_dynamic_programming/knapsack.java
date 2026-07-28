/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* Bài toán cái túi 0-1: Tìm kiếm vét cạn */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Tính giá trị lớn nhất của việc không cho vào và cho vào vật phẩm i
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Trả về giá trị lớn hơn trong hai lựa chọn
        return Math.max(no, yes);
    }

    /* Bài toán cái túi 0-1: Tìm kiếm ghi nhớ */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Nếu đã có bản ghi, trả về trực tiếp
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Tính giá trị lớn nhất của việc không cho vào và cho vào vật phẩm i
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Ghi lại và trả về giá trị lớn hơn trong hai lựa chọn
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* Bài toán cái túi 0-1: Quy hoạch động */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
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
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Bài toán cái túi 0-1: Quy hoạch động tối ưu không gian */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Khởi tạo bảng dp
        int[] dp = new int[cap + 1];
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            // Duyệt theo thứ tự ngược
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;
        int n = wgt.length;

        // Tìm kiếm vét cạn
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);

        // Tìm kiếm ghi nhớ
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);

        // Quy hoạch động
        res = knapsackDP(wgt, val, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);

        // Quy hoạch động tối ưu không gian
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("Maximum item value not exceeding knapsack capacity is " + res);
    }
}
