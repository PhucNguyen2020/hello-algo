/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Quay lui */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
        if (state == n)
            res[0]++;
        // Duyệt qua tất cả các lựa chọn
        foreach (int choice in choices) {
            // Cắt tỉa: không được phép vượt quá bậc thang thứ n
            if (state + choice > n)
                continue;
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            Backtrack(choices, state + choice, n, res);
            // Quay lui
        }
    }

    /* Leo cầu thang: Quay lui */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Có thể chọn leo lên 1 hoặc 2 bậc
        int state = 0; // Bắt đầu leo từ bậc thang thứ 0
        List<int> res = [0]; // Dùng res[0] để lưu số lời giải
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Leo {n} bậc thang có {res} lời giải");
    }
}
