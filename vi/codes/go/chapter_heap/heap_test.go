// File: heap_test.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"container/heap"
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func testPush(h *intHeap, val int) {
	// Gọi hàm của heap.Interface để thêm phần tử
	heap.Push(h, val)
	fmt.Printf("\nAfter element %d pushes to heap \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Gọi hàm của heap.Interface để xóa phần tử
	val := heap.Pop(h)
	fmt.Printf("\nAfter heap top element %d pops from heap \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Khởi tạo đống */
	// Cân nhắc đảo dấu các phần tử trước khi đưa vào đống, có thể đảo ngược quan hệ lớn nhỏ, từ đó triển khai đống lớn nhất
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Phần tử đi vào đống */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Lấy phần tử đỉnh đống */
	top := maxHeap.Top()
	fmt.Printf("Heap top element is %d\n", top)

	/* Độ phức tạp thời gian là O(n), không phải O(nlogn) */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Lấy kích thước đống */
	size := len(*maxHeap)
	fmt.Printf("Heap size is %d\n", size)

	/* Kiểm tra đống có rỗng không */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Is heap empty %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Khởi tạo đống */
	// Cân nhắc đảo dấu các phần tử trước khi đưa vào đống, có thể đảo ngược quan hệ lớn nhỏ, từ đó triển khai đống lớn nhất
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("After input array and building heap\n")
	maxHeap.print()

	/* Lấy phần tử đỉnh đống */
	peek := maxHeap.peek()
	fmt.Printf("\nHeap top element is %d\n", peek)

	/* Phần tử đi vào đống */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nAfter element %d enters heap\n", val)
	maxHeap.print()

	/* Độ phức tạp thời gian là O(n), không phải O(nlogn) */
	peek = maxHeap.pop()
	fmt.Printf("\nAfter heap top element %d exits heap\n", peek)
	maxHeap.print()

	/* Lấy kích thước đống */
	size := maxHeap.size()
	fmt.Printf("\nHeap element count is %d\n", size)

	/* Kiểm tra đống có rỗng không */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nIs heap empty %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Khởi tạo đống */
	// Cân nhắc đảo dấu các phần tử trước khi đưa vào đống, có thể đảo ngược quan hệ lớn nhỏ, từ đó triển khai đống lớn nhất
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("The largest " + strconv.Itoa(k) + " elements are")
	PrintHeap(*res)
}
