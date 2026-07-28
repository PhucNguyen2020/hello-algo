// File: time_complexity_test.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

func TestTimeComplexity(t *testing.T) {
	n := 8
	fmt.Println("Kích thước dữ liệu đầu vào n =", n)

	count := constant(n)
	fmt.Println("Số thao tác bậc hằng số =", count)

	count = linear(n)
	fmt.Println("Số thao tác bậc tuyến tính =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Số thao tác bậc tuyến tính (duyệt mảng) =", count)

	count = quadratic(n)
	fmt.Println("Số thao tác bậc hai =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Số thao tác bậc hai (sắp xếp nổi bọt) =", count)

	count = exponential(n)
	fmt.Println("Số thao tác theo cấp số mũ (triển khai bằng vòng lặp) =", count)
	count = expRecur(n)
	fmt.Println("Số thao tác theo cấp số mũ (triển khai đệ quy) =", count)

	count = logarithmic(n)
	fmt.Println("Số thao tác logarit (triển khai bằng vòng lặp) =", count)
	count = logRecur(n)
	fmt.Println("Số thao tác logarit (triển khai đệ quy) =", count)

	count = linearLogRecur(n)
	fmt.Println("Số thao tác tuyến tính-logarit (triển khai đệ quy) =", count)

	count = factorialRecur(n)
	fmt.Println("Số thao tác giai thừa (triển khai đệ quy) =", count)
}
