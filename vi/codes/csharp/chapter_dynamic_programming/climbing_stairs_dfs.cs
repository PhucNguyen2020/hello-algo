/**
* File: climbing_stairs_dfs.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* Tìm kiếm */
    int DFS(int i) {
        // Đã biết dp[1] và dp[2], trả về chúng
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* Leo cầu thang: Tìm kiếm */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFS(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");
    }
}
