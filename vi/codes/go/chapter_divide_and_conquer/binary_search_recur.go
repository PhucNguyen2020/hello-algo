// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Tìm kiếm nhị phân: bài toán con f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
	if i > j {
		return -1
	}
	// Tính chỉ số điểm giữa
	m := i + ((j - i) >> 1)
	// So sánh điểm giữa với phần tử mục tiêu
	if nums[m] < target {
		// Nếu nhỏ hơn, đệ quy trên nửa phải của mảng
		// Bài toán con đệ quy f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// Nếu lớn hơn, đệ quy trên nửa trái của mảng
		// Bài toán con đệ quy f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
		return m
	}
}

/* Tìm kiếm nhị phân */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
