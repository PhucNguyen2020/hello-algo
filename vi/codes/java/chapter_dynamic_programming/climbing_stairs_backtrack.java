/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* Quay lui */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Duyệt qua tất cả các lựa chọn
        for (Integer choice : choices) {
            // Cắt tỉa: không được phép vượt quá bậc thang thứ n
            if (state + choice > n)
                continue;
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            backtrack(choices, state + choice, n, res);
            // Quay lui
        }
    }

    /* Leo cầu thang: Quay lui */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Có thể chọn leo lên 1 hoặc 2 bậc
        int state = 0; // Bắt đầu leo từ bậc thang thứ 0
        List<Integer> res = new ArrayList<>();
        res.add(0); // Dùng res[0] để ghi lại số lời giải
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Climbing %d stairs has %d solutions", n, res));
    }
}
