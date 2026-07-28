// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* Cặp khóa-giá trị */
type pair struct {
	key int
	val string
}

/* Bảng băm cài đặt dựa trên mảng */
type arrayHashMap struct {
	buckets []*pair
}

/* Khởi tạo bảng băm */
func newArrayHashMap() *arrayHashMap {
	// Khởi tạo mảng với 100 bucket
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* Hàm băm */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* Thao tác truy vấn */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* Thao tác thêm */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* Thao tác xóa */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// Đặt thành nil để xóa
	a.buckets[index] = nil
}

/* Lấy tất cả cặp khóa-giá trị */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* Lấy tất cả khóa */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* Lấy tất cả giá trị */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* In bảng băm */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
