/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* Tổng đường đi nhỏ nhất: Tìm kiếm vét cạn */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Nếu chỉ số hàng hoặc cột vượt biên, trả về chi phí +∞
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Tính chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i-1, j) và (i, j-1)
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // Trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
        return Math.Min(left, up) + grid[i][j];
    }

    /* Tổng đường đi nhỏ nhất: Tìm kiếm có ghi nhớ */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Nếu chỉ số hàng hoặc cột vượt biên, trả về chi phí +∞
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Nếu đã có bản ghi, trả về nó ngay
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Chi phí đường đi nhỏ nhất của ô bên trái và ô phía trên
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // Ghi lại và trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Tổng đường đi nhỏ nhất: Quy hoạch động */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Khởi tạo bảng dp
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // Chuyển trạng thái: hàng đầu tiên
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // Chuyển trạng thái: cột đầu tiên
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // Chuyển trạng thái: các hàng và cột còn lại
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* Tổng đường đi nhỏ nhất: Quy hoạch động tối ưu không gian */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Khởi tạo bảng dp
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // Chuyển trạng thái: hàng đầu tiên
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // Chuyển trạng thái: các hàng còn lại
        for (int i = 1; i < n; i++) {
            // Chuyển trạng thái: cột đầu tiên
            dp[0] = dp[0] + grid[i][0];
            // Chuyển trạng thái: các cột còn lại
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    [Test]
    public void Test() {
        int[][] grid =
        [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2]
        ];

        int n = grid.Length, m = grid[0].Length;

        // Tìm kiếm vét cạn
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Tìm kiếm có ghi nhớ
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Quy hoạch động
        res = MinPathSumDP(grid);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Quy hoạch động tối ưu không gian
        res = MinPathSumDPComp(grid);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);
    }
}
