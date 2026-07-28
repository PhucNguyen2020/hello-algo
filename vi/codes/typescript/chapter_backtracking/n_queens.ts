/**
 * File: n_queens.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Giải thuật quay lui: N quân hậu */
function backtrack(
    row: number,
    n: number,
    state: string[][],
    res: string[][][],
    cols: boolean[],
    diags1: boolean[],
    diags2: boolean[]
): void {
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
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cột, đường chéo chính và đường chéo phụ của ô này
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Đặt tiếp hàng kế tiếp
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Quay lui: khôi phục ô này thành ô trống
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Giải bài toán N quân hậu */
function nQueens(n: number): string[][][] {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Ghi lại xem cột có quân hậu hay không
    const diags1 = Array(2 * n - 1).fill(false); // Ghi lại xem đường chéo chính có quân hậu hay không
    const diags2 = Array(2 * n - 1).fill(false); // Ghi lại xem đường chéo phụ có quân hậu hay không
    const res: string[][][] = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`Input board size is ${n}`);
console.log(`Total queen placement solutions: ${res.length}`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});

export {};
