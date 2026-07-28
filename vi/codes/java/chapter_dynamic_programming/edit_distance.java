/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* Khoảng cách chỉnh sửa: Tìm kiếm vét cạn */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // Nếu cả s và t đều rỗng, trả về 0
        if (i == 0 && j == 0)
            return 0;
        // Nếu s rỗng, trả về độ dài của t
        if (i == 0)
            return j;
        // Nếu t rỗng, trả về độ dài của s
        if (j == 0)
            return i;
        // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // Trả về số bước chỉnh sửa tối thiểu
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* Khoảng cách chỉnh sửa: Tìm kiếm ghi nhớ */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // Nếu cả s và t đều rỗng, trả về 0
        if (i == 0 && j == 0)
            return 0;
        // Nếu s rỗng, trả về độ dài của t
        if (i == 0)
            return j;
        // Nếu t rỗng, trả về độ dài của s
        if (j == 0)
            return i;
        // Nếu đã có bản ghi, trả về trực tiếp
        if (mem[i][j] != -1)
            return mem[i][j];
        // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Ghi lại và trả về số bước chỉnh sửa tối thiểu
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Khoảng cách chỉnh sửa: Quy hoạch động */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // Chuyển trạng thái: các hàng và cột còn lại
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* Khoảng cách chỉnh sửa: Quy hoạch động tối ưu không gian */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // Chuyển trạng thái: hàng đầu tiên
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // Chuyển trạng thái: các hàng còn lại
        for (int i = 1; i <= n; i++) {
            // Chuyển trạng thái: cột đầu tiên
            int leftup = dp[0]; // Tạm thời lưu dp[i-1, j-1]
            dp[0] = i;
            // Chuyển trạng thái: các cột còn lại
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                    dp[j] = leftup;
                } else {
                    // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Cập nhật cho dp[i-1, j-1] của vòng tiếp theo
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // Tìm kiếm vét cạn
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Tìm kiếm ghi nhớ
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Quy hoạch động
        res = editDistanceDP(s, t);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Quy hoạch động tối ưu không gian
        res = editDistanceDPComp(s, t);
        System.out.println("Changing " + s + " to " + t + " requires a minimum of " + res + " edits");
    }
}
