// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Giải thuật quay lui: hoán vị II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Khi độ dài state bằng số lượng phần tử, ghi lại lời giải
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Duyệt qua tất cả các lựa chọn
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Cắt tỉa: không cho phép chọn lại một phần tử đã được chọn và không cho phép chọn lại các phần tử có giá trị bằng nhau
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Thử: thực hiện lựa chọn, cập nhật state
			// Ghi lại giá trị phần tử đã được chọn
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Tiến hành vòng lựa chọn tiếp theo
			backtrackII(state, choices, selected, res)
			// Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Hoán vị II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
