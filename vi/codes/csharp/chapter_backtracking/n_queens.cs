/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* Giải thuật quay lui: Bài toán N quân hậu */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // Khi đã đặt hết tất cả các hàng, ghi lại lời giải
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // Duyệt qua tất cả các cột
        for (int col = 0; col < n; col++) {
            // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Thử: đặt quân hậu vào ô này
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Đặt tiếp hàng kế tiếp
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Quay lui: khôi phục ô này thành ô trống
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Giải bài toán N quân hậu */
    List<List<List<string>>> NQueens(int n) {
        // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Ghi lại xem cột đó đã có quân hậu hay chưa
        bool[] diags1 = new bool[2 * n - 1]; // Ghi lại xem đường chéo chính đó đã có quân hậu hay chưa
        bool[] diags2 = new bool[2 * n - 1]; // Ghi lại xem đường chéo phụ đó đã có quân hậu hay chưa
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Input board size is " + n);
        Console.WriteLine("Total queen placement solutions: " + res.Count + " solutions");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
