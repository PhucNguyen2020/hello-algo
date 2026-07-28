// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* Tạo một mảng gồm các phần tử { 1, 2, ..., n }, thứ tự đã bị xáo trộn */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// Tạo mảng nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// Xáo trộn ngẫu nhiên các phần tử của mảng
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* Tìm chỉ số của số 1 trong mảng nums */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// Khi phần tử 1 nằm ở đầu mảng, đạt được độ phức tạp thời gian tốt nhất O(1)
		// Khi phần tử 1 nằm ở cuối mảng, đạt được độ phức tạp thời gian xấu nhất O(n)
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
