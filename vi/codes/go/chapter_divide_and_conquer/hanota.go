// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* Di chuyển một đĩa */
func move(src, tar *list.List) {
	// Lấy một đĩa từ đỉnh của src
	pan := src.Back()
	// Đặt đĩa lên đỉnh của tar
	tar.PushBack(pan.Value)
	// Xóa đĩa trên cùng khỏi src
	src.Remove(pan)
}

/* Giải bài toán Tháp Hà Nội f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// Nếu chỉ còn một đĩa trong src, di chuyển trực tiếp nó sang tar
	if i == 1 {
		move(src, tar)
		return
	}
	// Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, sử dụng tar
	dfsHanota(i-1, src, tar, buf)
	// Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
	move(src, tar)
	// Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, sử dụng src
	dfsHanota(i-1, buf, src, tar)
}

/* Giải bài toán Tháp Hà Nội */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// Di chuyển n đĩa trên cùng từ A sang C, sử dụng B
	dfsHanota(n, A, B, C)
}
