/**
 * File: climbing_stairs_dfs_mem.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class climbing_stairs_dfs_mem {
    /* Tìm kiếm ghi nhớ */
    public static int dfs(int i, int[] mem) {
        // Đã biết dp[1] và dp[2], trả về chúng
        if (i == 1 || i == 2)
            return i;
        // Nếu đã có bản ghi dp[i], trả về trực tiếp
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Ghi lại dp[i]
        mem[i] = count;
        return count;
    }

    /* Leo cầu thang: Tìm kiếm ghi nhớ */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("Climbing %d stairs has %d solutions", n, res));
    }
}