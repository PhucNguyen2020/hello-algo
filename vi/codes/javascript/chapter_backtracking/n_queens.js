/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Giải thuật quay lui: bài toán n quân hậu */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // Khi đã đặt xong tất cả các hàng, ghi lại lời giải
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Duyệt qua tất cả các cột
    for (let col = 0; col < n; col++) {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Đặt quân hậu cho hàng tiếp theo
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Quay lui: khôi phục ô này về ô trống
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Giải bài toán n quân hậu */
function nQueens(n) {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu, '#' đại diện cho ô trống
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Ghi lại xem cột có quân hậu hay không
    const diags1 = Array(2 * n - 1).fill(false); // Ghi lại xem đường chéo chính có quân hậu hay không
    const diags2 = Array(2 * n - 1).fill(false); // Ghi lại xem đường chéo phụ có quân hậu hay không
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Mã điều khiển
const n = 4;
const res = nQueens(n);

console.log(`Input board size is ${n}`);
console.log(`Total queen placement solutions: ${res.length}`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
