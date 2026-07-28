// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
Ở đây ta xem Slice của Go như là Array. Điều này giúp giảm
chi phí học tập và cho phép ta tập trung vào cấu trúc dữ liệu và giải thuật.
*/

import (
	"fmt"
	"testing"
)

/* Chương trình chính */
func TestArray(t *testing.T) {
	/* Khởi tạo mảng */
	var arr [5]int
	fmt.Println("Array arr =", arr)
	// Trong Go, khai báo có độ dài ([5]int) sẽ tạo ra một array, không khai báo độ dài ([]int) sẽ tạo ra một slice
	// Vì array trong Go được thiết kế để độ dài xác định lúc biên dịch, nên chỉ hằng số mới có thể dùng để chỉ định độ dài
	// Để thuận tiện khi triển khai hàm extend(), bên dưới ta xem slice như là array
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Array nums =", nums)

	/* Chèn phần tử */
	randomNum := randomAccess(nums)
	fmt.Println("Get random element in nums", randomNum)

	/* Duyệt mảng */
	nums = extend(nums, 3)
	fmt.Println("Extend array length to 8, get nums =", nums)

	/* Chèn phần tử */
	insert(nums, 6, 3)
	fmt.Println("Insert number 6 at index 3, get nums =", nums)

	/* Xóa phần tử */
	remove(nums, 2)
	fmt.Println("Remove element at index 2, get nums =", nums)

	/* Duyệt mảng */
	traverse(nums)

	/* Tìm phần tử */
	index := find(nums, 3)
	fmt.Println("Find element 3 in nums, get index =", index)
}
