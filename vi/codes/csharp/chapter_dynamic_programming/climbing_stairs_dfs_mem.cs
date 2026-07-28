/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* Tìm kiếm có ghi nhớ */
    int DFS(int i, int[] mem) {
        // Đã biết dp[1] và dp[2], trả về chúng
        if (i == 1 || i == 2)
            return i;
        // Nếu đã có bản ghi dp[i], trả về nó ngay
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // Ghi lại dp[i]
        mem[i] = count;
        return count;
    }

    /* Leo cầu thang: Tìm kiếm có ghi nhớ */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");
    }
}
