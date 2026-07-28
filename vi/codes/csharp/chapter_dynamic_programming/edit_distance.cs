/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* Khoảng cách chỉnh sửa: Tìm kiếm vét cạn */
    int EditDistanceDFS(string s, string t, int i, int j) {
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
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // Trả về số bước chỉnh sửa tối thiểu
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* Khoảng cách chỉnh sửa: Tìm kiếm có ghi nhớ */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // Nếu cả s và t đều rỗng, trả về 0
        if (i == 0 && j == 0)
            return 0;
        // Nếu s rỗng, trả về độ dài của t
        if (i == 0)
            return j;
        // Nếu t rỗng, trả về độ dài của s
        if (j == 0)
            return i;
        // Nếu đã có bản ghi, trả về nó ngay
        if (mem[i][j] != -1)
            return mem[i][j];
        // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Ghi lại và trả về số bước chỉnh sửa tối thiểu
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Khoảng cách chỉnh sửa: Quy hoạch động */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // Chuyển trạng thái: các hàng và cột còn lại
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* Khoảng cách chỉnh sửa: Quy hoạch động tối ưu không gian */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
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
                if (s[i - 1] == t[j - 1]) {
                    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                    dp[j] = leftup;
                } else {
                    // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Cập nhật dp[i-1, j-1] cho vòng tiếp theo
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // Tìm kiếm vét cạn
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("Change " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Tìm kiếm có ghi nhớ
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("Change " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Quy hoạch động
        res = EditDistanceDP(s, t);
        Console.WriteLine("Change " + s + " to " + t + " requires a minimum of " + res + " edits");

        // Quy hoạch động tối ưu không gian
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("Change " + s + " to " + t + " requires a minimum of " + res + " edits");
    }
}
