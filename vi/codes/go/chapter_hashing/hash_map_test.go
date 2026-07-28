// File: hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashMap(t *testing.T) {
	/* Khởi tạo bảng băm */
	hmap := make(map[int]string)

	/* Thao tác thêm */
	// Thêm cặp khóa-giá trị (key, value) vào bảng băm
	hmap[12836] = "Xiao Ha"
	hmap[15937] = "Xiao Luo"
	hmap[16750] = "Xiao Suan"
	hmap[13276] = "Xiao Fa"
	hmap[10583] = "Xiao Ya"
	fmt.Println("\nAfter adding is complete, hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Thao tác truy vấn */
	// Nhập khóa vào bảng băm để lấy giá trị
	name := hmap[15937]
	fmt.Println("\nInput student ID 15937, query name ", name)

	/* Thao tác xóa */
	// Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
	delete(hmap, 10583)
	fmt.Println("\nAfter removing 10583, hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Duyệt bảng băm */
	// Duyệt các cặp khóa-giá trị
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Chỉ duyệt khóa
	fmt.Println("\nTraverse keys only Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// Chỉ duyệt giá trị
	fmt.Println("\nTraverse values only Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello Algo"

	hash = addHash(key)
	fmt.Println("Additive hash value is " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Multiplicative hash value is " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR hash value is " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Rotational hash value is " + strconv.Itoa(hash))
}
