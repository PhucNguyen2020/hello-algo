/**
* File: subset_sum_i.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i {
    /* Giải thuật quay lui: Tổng tập con I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Khi tổng của tập con bằng target, ghi lại lời giải
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
        for (int i = start; i < choices.Length; i++) {
            // Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay
            // Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
            if (target - choices[i] < 0) {
                break;
            }
            // Thử: thực hiện lựa chọn, cập nhật target, start
            state.Add(choices[i]);
            // Tiến hành vòng lựa chọn tiếp theo
            Backtrack(state, target - choices[i], choices, i, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Giải bài toán tổng tập con I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // Trạng thái (tập con)
        Array.Sort(nums); // Sắp xếp nums
        int start = 0; // Điểm bắt đầu duyệt
        List<List<int>> res = []; // Danh sách kết quả (danh sách các tập con)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumI(nums, target);
        Console.WriteLine("Input array nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("All subsets with sum equal to " + target + " are res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
