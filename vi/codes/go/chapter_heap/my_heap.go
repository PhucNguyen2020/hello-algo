// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Sử dụng slice thay vì mảng để tránh vấn đề mở rộng kích thước
	data []any
}

/* Hàm khởi tạo, xây dựng đống rỗng */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Hàm khởi tạo, xây dựng đống từ slice */
func newMaxHeap(nums []any) *maxHeap {
	// Thêm các phần tử của danh sách vào đống nguyên trạng
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Đống hóa (heapify) tất cả các nút trừ nút lá
		h.siftDown(i)
	}
	return h
}

/* Lấy chỉ số của nút con trái */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* Lấy chỉ số của nút con phải */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* Lấy chỉ số của nút cha */
func (h *maxHeap) parent(i int) int {
	// Phép chia lấy phần nguyên (làm tròn xuống)
	return (i - 1) / 2
}

/* Hoán đổi các phần tử */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* Lấy kích thước đống */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Kiểm tra đống có rỗng không */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Truy cập phần tử đỉnh */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Phần tử đi vào đống */
func (h *maxHeap) push(val any) {
	// Thêm nút
	h.data = append(h.data, val)
	// Đống hóa từ dưới lên trên
	h.siftUp(len(h.data) - 1)
}

/* Bắt đầu từ nút i, đống hóa từ dưới lên trên */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Lấy nút cha của nút i
		p := h.parent(i)
		// Khi "vượt qua nút gốc" hoặc "nút không cần sửa chữa", kết thúc đống hóa
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Hoán đổi hai nút
		h.swap(i, p)
		// Lặp lại đống hóa hướng lên trên
		i = p
	}
}

/* Phần tử rời khỏi đống */
func (h *maxHeap) pop() any {
	// Xử lý trường hợp rỗng
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Xóa nút
	h.swap(0, h.size()-1)
	// Xóa nút
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Trả về phần tử đỉnh
	h.siftDown(0)

	// Trả về phần tử đỉnh đống
	return val
}

/* Bắt đầu từ nút i, đống hóa từ trên xuống dưới */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Tìm nút có giá trị lớn nhất trong các nút i, l, r, ký hiệu là max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Hoán đổi hai nút
		if max == i {
			break
		}
		// Hoán đổi hai nút
		h.swap(i, max)
		// Lặp lại đống hóa hướng xuống dưới
		i = max
	}
}

/* Mã điều khiển (Driver Code) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
