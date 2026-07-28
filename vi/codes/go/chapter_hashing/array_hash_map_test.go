// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Khởi tạo bảng băm */
	hmap := newArrayHashMap()

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
	fmt.Println("\nInput student ID 15937, query name " + name)

	/* Thao tác xóa */
	// Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
	hmap.remove(10583)
	fmt.Println("\nAfter removing 10583, hash table is\nKey -> Value")
	hmap.print()

	/* Duyệt bảng băm */
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nTraverse keys only Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nTraverse values only Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
