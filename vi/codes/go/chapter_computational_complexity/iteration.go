// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* Vòng lặp for */
func forLoop(n int) int {
	res := 0
	// Tính tổng 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Vòng lặp while */
func whileLoop(n int) int {
	res := 0
	// Khởi tạo biến điều kiện
	i := 1
	// Tính tổng 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// Cập nhật biến điều kiện
		i++
	}
	return res
}

/* Vòng lặp while (hai lần cập nhật) */
func whileLoopII(n int) int {
	res := 0
	// Khởi tạo biến điều kiện
	i := 1
	// Tính tổng 1, 4, 10, ...
	for i <= n {
		res += i
		// Cập nhật biến điều kiện
		i++
		i *= 2
	}
	return res
}

/* Vòng lặp for lồng nhau */
func nestedForLoop(n int) string {
	res := ""
	// Lặp i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Lặp j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
