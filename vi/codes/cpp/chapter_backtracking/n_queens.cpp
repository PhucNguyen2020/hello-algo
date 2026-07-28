/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Bài toán N quân hậu */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // Khi đã đặt xong tất cả các hàng, ghi lại lời giải
    if (row == n) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các cột
    for (int col = 0; col < n; col++) {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính, đường chéo phụ của ô này
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Đặt tiếp hàng kế tiếp
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Quay lui: khôi phục ô này thành ô trống
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Giải bài toán N quân hậu */
vector<vector<vector<string>>> nQueens(int n) {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu, '#' đại diện cho ô trống
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Ghi lại xem cột nào đã có quân hậu
    vector<bool> diags1(2 * n - 1, false); // Ghi lại xem đường chéo chính nào đã có quân hậu
    vector<bool> diags2(2 * n - 1, false); // Ghi lại xem đường chéo phụ nào đã có quân hậu
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Input board size is " << n << endl;
    cout << "Total queen placement solutions: " << res.size() << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
