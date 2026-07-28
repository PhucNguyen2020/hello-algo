/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* Giải thuật quay lui: Hoán vị II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử có giá trị bằng nhau
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Thử: thực hiện lựa chọn, cập nhật trạng thái
                duplicated.Add(choice); // Ghi lại giá trị phần tử đã chọn
                selected[i] = true;
                state.Add(choice);
                // Tiến hành vòng lựa chọn tiếp theo
                Backtrack(state, choices, selected, res);
                // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Hoán vị II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("Input array nums = " + string.Join(", ", nums));
        Console.WriteLine("All permutations res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
