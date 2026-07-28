// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* Cấu trúc */
type node struct {
	val  int
	next *node
}

/* Tạo cấu trúc node */
func newNode(val int) *node {
	return &node{val: val}
}

/* Hàm */
func function() int {
	// Thực hiện một số thao tác...
	return 0
}

/* Độ phức tạp không gian hằng số */
func spaceConstant(n int) {
	// Hằng số, biến, đối tượng chiếm không gian O(1)
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// Biến trong vòng lặp chiếm không gian O(1)
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// Hàm trong vòng lặp chiếm không gian O(1)
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* Độ phức tạp không gian tuyến tính */
func spaceLinear(n int) {
	// Mảng có độ dài n chiếm không gian O(n)
	_ = make([]int, n)
	// Danh sách có độ dài n chiếm không gian O(n)
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// Bảng băm có độ dài n chiếm không gian O(n)
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* Độ phức tạp không gian tuyến tính (triển khai đệ quy) */
func spaceLinearRecur(n int) {
	fmt.Println("Đệ quy n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* Độ phức tạp không gian bậc hai */
func spaceQuadratic(n int) {
	// Ma trận chiếm không gian O(n^2)
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* Độ phức tạp không gian bậc hai (triển khai đệ quy) */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("Trong đệ quy n = %d, độ dài nums = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* Đoạn mã điều khiển */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
