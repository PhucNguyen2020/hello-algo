// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Trong Go, đống lớn nhất (max heap) chứa số nguyên có thể được xây dựng bằng cách triển khai heap.Interface
// Triển khai heap.Interface cũng yêu cầu triển khai sort.Interface
type intHeap []any

// Hàm Push của heap.Interface, triển khai việc đẩy phần tử vào đống
func (h *intHeap) Push(x any) {
	// Push và Pop sử dụng con trỏ nhận (pointer receiver) làm tham số
	// Vì chúng không chỉ điều chỉnh nội dung của slice, mà còn thay đổi độ dài của slice.
	*h = append(*h, x.(int))
}

// Hàm Pop của heap.Interface, triển khai việc lấy phần tử đỉnh đống ra
func (h *intHeap) Pop() any {
	// Phần tử cần lấy ra được lưu ở cuối
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Hàm Len của sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Hàm Less của sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// Nếu triển khai đống nhỏ nhất (min heap), cần đổi thành dấu nhỏ hơn
	return (*h)[i].(int) > (*h)[j].(int)
}

// Hàm Swap của sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top lấy phần tử đỉnh đống
func (h *intHeap) Top() any {
	return (*h)[0]
}
