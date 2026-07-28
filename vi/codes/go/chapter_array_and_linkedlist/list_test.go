// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Chương trình chính */
func TestList(t *testing.T) {
	/* Khởi tạo danh sách */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("List nums =", nums)

	/* Cập nhật phần tử */
	num := nums[1] // Truy cập phần tử tại vị trí 1
	fmt.Println("Access element at index 1, get num =", num)

	/* Thêm phần tử vào cuối */
	nums[1] = 0 // Cập nhật phần tử tại vị trí 1 thành 0
	fmt.Println("Update element at index 1 to 0, get nums =", nums)

	/* Xóa phần tử */
	nums = nil
	fmt.Println("After clearing list, nums =", nums)

	/* Duyệt trực tiếp các phần tử của danh sách */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("After adding elements, nums =", nums)

	/* Sắp xếp danh sách */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Chèn số 6 vào vị trí 3
	fmt.Println("Insert number 6 at index 3, get nums =", nums)

	/* Xóa phần tử */
	nums = append(nums[:3], nums[4:]...) // Xóa phần tử tại vị trí 3
	fmt.Println("Remove element at index 3, get nums =", nums)

	/* Duyệt danh sách theo chỉ số */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* Duyệt trực tiếp các phần tử của danh sách */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* Nối hai danh sách */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Nối danh sách nums1 vào nums
	fmt.Println("Concatenate list nums1 to nums, get nums =", nums)

	/* Sắp xếp danh sách */
	sort.Ints(nums) // Sau khi sắp xếp, các phần tử trong danh sách được xếp từ nhỏ đến lớn
	fmt.Println("After sorting list, nums =", nums)
}
