/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* Giải thuật quay lui: Hoán vị II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại phần tử có giá trị trùng nhau
            if (!selected[i] && !duplicated.contains(choice)) {
                // Thử: thực hiện lựa chọn, cập nhật trạng thái
                duplicated.add(choice); // Ghi lại giá trị phần tử đã chọn
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

    /* Hoán vị II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("Input array nums = " + Arrays.toString(nums));
        System.out.println("All permutations res = " + res);
    }
}
