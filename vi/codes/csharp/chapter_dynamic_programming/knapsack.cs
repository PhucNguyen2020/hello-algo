/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* Bài toán cái túi 0-1: Tìm kiếm vét cạn */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Tính giá trị lớn nhất của việc không cho vào và cho vật phẩm i vào
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Trả về giá trị lớn hơn trong hai lựa chọn
        return Math.Max(no, yes);
    }

    /* Bài toán cái túi 0-1: Tìm kiếm có ghi nhớ */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Nếu đã có bản ghi, trả về nó ngay
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Tính giá trị lớn nhất của việc không cho vào và cho vật phẩm i vào
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Ghi lại và trả về giá trị lớn hơn trong hai lựa chọn
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* Bài toán cái túi 0-1: Quy hoạch động */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Khởi tạo bảng dp
        int[,] dp = new int[n + 1, cap + 1];
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // Nếu vượt quá dung lượng túi, không chọn vật phẩm i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* Bài toán cái túi 0-1: Quy hoạch động tối ưu không gian */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Khởi tạo bảng dp
        int[] dp = new int[cap + 1];
        // Chuyển trạng thái
        for (int i = 1; i <= n; i++) {
            // Duyệt theo thứ tự ngược
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // Nếu vượt quá dung lượng túi, không chọn vật phẩm i
                    dp[c] = dp[c];
                } else {
                    // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;
        int n = weight.Length;

        // Tìm kiếm vét cạn
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("Maximum item value not exceeding knapsack capacity is " + res);

        // Tìm kiếm có ghi nhớ
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("Maximum item value not exceeding knapsack capacity is " + res);

        // Quy hoạch động
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("Maximum item value not exceeding knapsack capacity is " + res);

        // Quy hoạch động tối ưu không gian
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("Maximum item value not exceeding knapsack capacity is " + res);
    }
}
