/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* Giải thuật quay lui: N quân hậu */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // Khi đã đặt xong tất cả các hàng, ghi lại lời giải
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // Duyệt qua tất cả các cột
        for (int col = 0; col < n; col++) {
            // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Cắt tỉa: không cho phép quân hậu tồn tại trên cột, đường chéo chính và đường chéo phụ của ô này
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Thử: đặt quân hậu vào ô này
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Đặt quân hậu ở hàng tiếp theo
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Quay lui: khôi phục ô này về ô trống
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Giải bài toán N quân hậu */
    public static List<List<List<String>>> nQueens(int n) {
        // Khởi tạo bàn cờ kích thước n*n, trong đó 'Q' là quân hậu và '#' là ô trống
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Ghi lại cột nào đã có quân hậu
        boolean[] diags1 = new boolean[2 * n - 1]; // Ghi lại đường chéo chính nào đã có quân hậu
        boolean[] diags2 = new boolean[2 * n - 1]; // Ghi lại đường chéo phụ nào đã có quân hậu
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("Input board size is " + n);
        System.out.println("Total queen placement solutions: " + res.size() + "");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
