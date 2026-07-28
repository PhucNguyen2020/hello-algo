// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Giải thuật quay lui: hoán vị I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Khi độ dài state bằng số lượng phần tử, ghi lại lời giải
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Duyệt qua tất cả các lựa chọn
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Cắt tỉa: không cho phép chọn lại một phần tử đã được chọn
		if !(*selected)[i] {
			// Thử: thực hiện lựa chọn, cập nhật state
			(*selected)[i] = true
			*state = append(*state, choice)
			// Tiến hành vòng lựa chọn tiếp theo
			backtrackI(state, choices, selected, res)
			// Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Hoán vị I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
