// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Truy cập ngẫu nhiên một phần tử */
func randomAccess(nums []int) (randomNum int) {
	// Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
	randomIndex := rand.Intn(len(nums))
	// Lấy và trả về phần tử ngẫu nhiên
	randomNum = nums[randomIndex]
	return
}

/* Mở rộng độ dài mảng */
func extend(nums []int, enlarge int) []int {
	// Khởi tạo một mảng có độ dài đã được mở rộng
	res := make([]int, len(nums)+enlarge)
	// Sao chép tất cả phần tử từ mảng gốc sang mảng mới
	for i, num := range nums {
		res[i] = num
	}
	// Trả về mảng mới đã mở rộng
	return res
}

/* Chèn phần tử num vào vị trí index trong mảng */
func insert(nums []int, num int, index int) {
	// Dịch tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Gán num cho phần tử tại vị trí index
	nums[index] = num
}

/* Xóa phần tử tại vị trí index */
func remove(nums []int, index int) {
	// Dịch tất cả phần tử sau vị trí index tiến lên một vị trí
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* Duyệt mảng */
func traverse(nums []int) {
	count := 0
	// Duyệt mảng theo chỉ số
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// Duyệt trực tiếp các phần tử của mảng
	for _, num := range nums {
		count += num
	}
	// Duyệt đồng thời chỉ số và phần tử
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Tìm phần tử được chỉ định trong mảng */
func find(nums []int, target int) (index int) {
	index = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			index = i
			break
		}
	}
	return
}
