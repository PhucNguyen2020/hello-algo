// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Hàm điều khiển chương trình */
func TestMyList(t *testing.T) {
	/* Khởi tạo danh sách */
	nums := newMyList()
	/* Thêm phần tử vào cuối danh sách */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("List nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* Chèn phần tử vào giữa danh sách */
	nums.insert(6, 3)
	fmt.Printf("Insert number 6 at index 3, get nums = %v\n", nums.toArray())

	/* Xóa phần tử */
	nums.remove(3)
	fmt.Printf("Remove element at index 3, get nums = %v\n", nums.toArray())

	/* Truy cập phần tử */
	num := nums.get(1)
	fmt.Printf("Access element at index 1, get num = %v\n", num)

	/* Cập nhật phần tử */
	nums.set(0, 1)
	fmt.Printf("Update element at index 1 to 0, get nums = %v\n", nums.toArray())

	/* Kiểm tra cơ chế mở rộng dung lượng */
	for i := 0; i < 10; i++ {
		// Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng danh sách, kích hoạt cơ chế mở rộng
		nums.add(i)
	}
	fmt.Printf("After expansion, list nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
