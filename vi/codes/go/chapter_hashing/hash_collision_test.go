// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Khởi tạo bảng băm */
	hmap := newHashMapChaining()

	/* Thao tác thêm */
	// Thêm cặp khóa-giá trị (key, value) vào bảng băm
	hmap.put(12836, "Xiao Ha")
	hmap.put(15937, "Xiao Luo")
	hmap.put(16750, "Xiao Suan")
	hmap.put(13276, "Xiao Fa")
	hmap.put(10583, "Xiao Ya")
	fmt.Println("\nAfter adding is complete, hash table is\nKey -> Value")
	hmap.print()

	/* Thao tác truy vấn */
	// Nhập khóa vào bảng băm để lấy giá trị
	name := hmap.get(15937)
	fmt.Println("\nInput student ID 15937, found name", name)

	/* Thao tác xóa */
	// Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
	hmap.remove(12836)
	fmt.Println("\nAfter removing 12836, hash table is\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Khởi tạo bảng băm */
	hmap := newHashMapOpenAddressing()

	/* Thao tác thêm */
	// Thêm cặp khóa-giá trị (key, value) vào bảng băm
	hmap.put(12836, "Xiao Ha")
	hmap.put(15937, "Xiao Luo")
	hmap.put(16750, "Xiao Suan")
	hmap.put(13276, "Xiao Fa")
	hmap.put(10583, "Xiao Ya")
	fmt.Println("\nAfter adding is complete, hash table is\nKey -> Value")
	hmap.print()

	/* Thao tác truy vấn */
	// Nhập khóa vào bảng băm để lấy giá trị
	name := hmap.get(13276)
	fmt.Println("\nInput student ID 13276, query name ", name)

	/* Thao tác xóa */
	// Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
	hmap.remove(16750)
	fmt.Println("\nAfter removing 16750, hash table is\nKey -> Value")
	hmap.print()
}
