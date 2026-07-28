// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Kiểm tra xem state hiện tại có phải là lời giải hay không */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* Ghi lại lời giải */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới state hiện tại hay không */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* Cập nhật state */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* Khôi phục state */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* Giải thuật quay lui: ví dụ 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// Kiểm tra xem đây có phải là lời giải hay không
	if isSolution(state) {
		// Ghi lại lời giải
		recordSolution(state, res)
	}
	// Duyệt qua tất cả các lựa chọn
	for _, choice := range *choices {
		// Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
		if isValid(state, choice) {
			// Thử: thực hiện lựa chọn, cập nhật state
			makeChoice(state, choice)
			// Tiến hành vòng lựa chọn tiếp theo
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
			undoChoice(state, choice)
		}
	}
}
