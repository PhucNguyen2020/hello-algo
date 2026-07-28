// File: subset_sum_i.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Giải thuật quay lui: tổng tập con I */
func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
	// Khi tổng tập con bằng target, ghi lại lời giải
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Duyệt qua tất cả các lựa chọn
	// Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
	for i := start; i < len(*choices); i++ {
		// Cắt tỉa 1: nếu tổng tập con vượt quá target thì kết thúc vòng lặp ngay
		// Vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn nên tổng tập con chắc chắn sẽ vượt quá target
		if target-(*choices)[i] < 0 {
			break
		}
		// Thử: thực hiện lựa chọn, cập nhật target, start
		*state = append(*state, (*choices)[i])
		// Tiến hành vòng lựa chọn tiếp theo
		backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
		// Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
		*state = (*state)[:len(*state)-1]
	}
}

/* Giải bài toán tổng tập con I */
func subsetSumI(nums []int, target int) [][]int {
	state := make([]int, 0) // State (tập con)
	sort.Ints(nums)         // Sắp xếp nums
	start := 0              // Điểm bắt đầu duyệt
	res := make([][]int, 0) // Danh sách kết quả (danh sách các tập con)
	backtrackSubsetSumI(start, target, &state, &nums, &res)
	return res
}
