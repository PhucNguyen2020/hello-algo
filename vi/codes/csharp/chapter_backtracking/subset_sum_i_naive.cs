/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Giải thuật quay lui: Tổng tập con I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Khi tổng của tập con bằng target, ghi lại lời giải
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        for (int i = 0; i < choices.Length; i++) {
            // Cắt tỉa: nếu tổng của tập con vượt quá target, bỏ qua lựa chọn này
            if (total + choices[i] > target) {
                continue;
            }
            // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
            state.Add(choices[i]);
            // Tiến hành vòng lựa chọn tiếp theo
            Backtrack(state, target, total + choices[i], choices, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Giải bài toán tổng tập con I (bao gồm cả các tập con trùng lặp) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // Trạng thái (tập con)
        int total = 0; // Tổng tập con
        List<List<int>> res = []; // Danh sách kết quả (danh sách các tập con)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets with sum equal to " + target + " are res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("Please note that this method outputs results containing duplicate sets");
    }
}
