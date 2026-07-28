/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* Giải thuật quay lui: Hoán vị I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
            if (!selected[i]) {
                // Thử: thực hiện lựa chọn, cập nhật trạng thái
                selected[i] = true;
                state.add(choice);
                // Tiến hành vòng lựa chọn tiếp theo
                backtrack(state, choices, selected, res);
                // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Hoán vị I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("Input array nums = " + Arrays.toString(nums));
        System.out.println("All permutations res = " + res);
    }
}
