// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Giải thuật quay lui: tổng tập con I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// Khi tổng tập con bằng target, ghi lại lời giải
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Duyệt qua tất cả các lựa chọn
	for i := 0; i < len(*choices); i++ {
		// Cắt tỉa: nếu tổng tập con vượt quá target thì bỏ qua lựa chọn này
		if total+(*choices)[i] > target {
			continue
		}
		// Thử: thực hiện lựa chọn, cập nhật tổng các phần tử total
		*state = append(*state, (*choices)[i])
		// Tiến hành vòng lựa chọn tiếp theo
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
		*state = (*state)[:len(*state)-1]
	}
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // State (tập con)
	total := 0              // Tổng tập con
	res := make([][]int, 0) // Danh sách kết quả (danh sách các tập con)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
