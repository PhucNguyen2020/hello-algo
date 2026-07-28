/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* Giải thuật quay lui: Tổng tập con II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Khi tổng tập con bằng target, ghi lại lời giải
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Duyệt qua tất cả các lựa chọn
        // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
        // Cắt tỉa 3: bắt đầu duyệt từ start để tránh chọn lặp lại cùng một phần tử
        for (int i = start; i < choices.length; i++) {
            // Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay
            // Vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
            if (target - choices[i] < 0) {
                break;
            }
            // Cắt tỉa 4: nếu phần tử này bằng phần tử bên trái nó, nghĩa là nhánh tìm kiếm này bị trùng lặp, bỏ qua ngay
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Thử: thực hiện lựa chọn, cập nhật target, start
            state.add(choices[i]);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            state.remove(state.size() - 1);
        }
    }

    /* Giải bài toán tổng tập con II */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Trạng thái (tập con)
        Arrays.sort(nums); // Sắp xếp nums
        int start = 0; // Điểm bắt đầu duyệt
        List<List<Integer>> res = new ArrayList<>(); // Danh sách kết quả (danh sách các tập con)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("Mảng đầu vào nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Tất cả các tập con có tổng bằng " + target + " là res = " + res);
    }
}
