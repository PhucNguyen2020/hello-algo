// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Phương thức Push của heap.Interface, triển khai việc đẩy phần tử vào đống
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Phương thức Pop của heap.Interface, triển khai việc lấy phần tử đỉnh đống ra
func (h *minHeap) Pop() any {
	// Phần tử cần lấy ra được lưu ở cuối
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top lấy phần tử đỉnh đống
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Tìm k phần tử lớn nhất trong mảng dựa trên đống */
func topKHeap(nums []int, k int) *minHeap {
	// Module heapq của Python mặc định triển khai đống nhỏ nhất
	h := &minHeap{}
	heap.Init(h)
	// Đưa k phần tử đầu tiên của mảng vào đống
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Bắt đầu từ phần tử thứ (k+1), duy trì độ dài đống là k
	for i := k; i < len(nums); i++ {
		// Nếu phần tử hiện tại lớn hơn phần tử đỉnh, phần tử đỉnh rời khỏi đống, phần tử hiện tại đi vào đống
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
