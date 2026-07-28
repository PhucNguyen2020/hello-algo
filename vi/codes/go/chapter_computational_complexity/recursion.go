// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* Đệ quy */
func recur(n int) int {
	// Điều kiện dừng
	if n == 1 {
		return 1
	}
	// Đệ quy: gọi đệ quy
	res := recur(n - 1)
	// Trả về: trả về kết quả
	return n + res
}

/* Mô phỏng đệ quy bằng lặp */
func forLoopRecur(n int) int {
	// Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
	stack := list.New()
	res := 0
	// Đệ quy: gọi đệ quy
	for i := n; i > 0; i-- {
		// Mô phỏng "đệ quy" bằng thao tác "đẩy vào"
		stack.PushBack(i)
	}
	// Trả về: trả về kết quả
	for stack.Len() != 0 {
		// Mô phỏng "trả về" bằng thao tác "lấy ra"
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* Đệ quy đuôi */
func tailRecur(n int, res int) int {
	// Điều kiện dừng
	if n == 0 {
		return res
	}
	// Gọi đệ quy đuôi
	return tailRecur(n-1, res+n)
}

/* Dãy Fibonacci: đệ quy */
func fib(n int) int {
	// Điều kiện dừng f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// Gọi đệ quy f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// Trả về kết quả f(n)
	return res
}
