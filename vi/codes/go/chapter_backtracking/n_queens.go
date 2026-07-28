// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Giải thuật quay lui: bài toán n hậu */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// Khi tất cả các hàng đã được đặt, ghi lại lời giải
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// Duyệt qua tất cả các cột
	for col := 0; col < n; col++ {
		// Tính đường chéo chính và đường chéo phụ tương ứng với ô này
		diag1 := row - col + n - 1
		diag2 := row + col
		// Cắt tỉa: không cho phép quân hậu xuất hiện trên cùng cột, đường chéo chính và đường chéo phụ của ô này
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Thử: đặt quân hậu vào ô này
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Đặt quân hậu ở hàng tiếp theo
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Quay lui: khôi phục ô này thành ô trống
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Giải bài toán n hậu */
func nQueens(n int) [][][]string {
	// Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Ghi lại xem cột đó đã có quân hậu hay chưa
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
