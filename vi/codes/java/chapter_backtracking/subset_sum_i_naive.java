/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Giải thuật quay lui: Tổng tập con I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Khi tổng tập con bằng target, ghi lại lời giải
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        for (int i = 0; i < choices.length; i++) {
            // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
            if (total + choices[i] > target) {
                continue;
            }
            // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
            state.add(choices[i]);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, target, total + choices[i], choices, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            state.remove(state.size() - 1);
        }
    }

    /* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Trạng thái (tập con)
        int total = 0; // Tổng tập con
        List<List<Integer>> res = new ArrayList<>(); // Danh sách kết quả (danh sách các tập con)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("Mảng đầu vào nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Tất cả các tập con có tổng bằng " + target + " là res = " + res);
        System.out.println("Lưu ý rằng phương pháp này xuất ra kết quả chứa các tập trùng lặp");
    }
}
