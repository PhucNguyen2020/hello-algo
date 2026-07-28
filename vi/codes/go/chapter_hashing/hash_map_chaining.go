// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* Bảng băm giải quyết đụng độ bằng phương pháp nối chuỗi (separate chaining) */
type hashMapChaining struct {
	size        int      // Số lượng cặp khóa-giá trị
	capacity    int      // Dung lượng bảng băm
	loadThres   float64  // Ngưỡng hệ số tải để kích hoạt mở rộng
	extendRatio int      // Hệ số nhân khi mở rộng
	buckets     [][]pair // Mảng các bucket
}

/* Hàm khởi tạo */
func newHashMapChaining() *hashMapChaining {
	buckets := make([][]pair, 4)
	for i := 0; i < 4; i++ {
		buckets[i] = make([]pair, 0)
	}
	return &hashMapChaining{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     buckets,
	}
}

/* Hàm băm */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* Hệ số tải */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* Thao tác truy vấn */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// Duyệt bucket, nếu tìm thấy key thì trả về val tương ứng
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// Trả về chuỗi rỗng nếu không tìm thấy key
	return ""
}

/* Thao tác thêm */
func (m *hashMapChaining) put(key int, val string) {
	// Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// Duyệt bucket, nếu gặp key được chỉ định thì cập nhật val tương ứng rồi trả về
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// Nếu key không tồn tại, thêm cặp khóa-giá trị vào cuối
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* Thao tác xóa */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// Duyệt bucket và xóa cặp khóa-giá trị khỏi đó
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// Xóa phần tử khỏi slice
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* Mở rộng bảng băm */
func (m *hashMapChaining) extend() {
	// Lưu tạm bảng băm gốc
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// Khởi tạo bảng băm mới đã được mở rộng
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// Di chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* In bảng băm */
func (m *hashMapChaining) print() {
	var builder strings.Builder

	for _, bucket := range m.buckets {
		builder.WriteString("[")
		for _, p := range bucket {
			builder.WriteString(strconv.Itoa(p.key) + " -> " + p.val + " ")
		}
		builder.WriteString("]")
		fmt.Println(builder.String())
		builder.Reset()
	}
}
