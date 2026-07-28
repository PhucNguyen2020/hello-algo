// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* Độ phức tạp thời gian hằng số */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* Độ phức tạp thời gian tuyến tính */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Độ phức tạp thời gian tuyến tính (duyệt mảng) */
func arrayTraversal(nums []int) int {
	count := 0
	// Số lần lặp tỷ lệ thuận với độ dài mảng
	for range nums {
		count++
	}
	return count
}

/* Độ phức tạp thời gian bậc hai */
func quadratic(n int) int {
	count := 0
	// Số lần lặp có quan hệ bậc hai với kích thước dữ liệu n
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* Độ phức tạp thời gian bậc hai (sắp xếp nổi bọt) */
func bubbleSort(nums []int) int {
	count := 0 // Bộ đếm
	// Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// Vòng lặp trong: đẩy phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối phạm vi đó
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Hoán đổi nums[j] và nums[j + 1]
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // Hoán đổi phần tử gồm 3 thao tác đơn vị
			}
		}
	}
	return count
}

/* Độ phức tạp thời gian theo cấp số mũ (triển khai bằng vòng lặp) */
func exponential(n int) int {
	count, base := 0, 1
	// Số ô nhân đôi sau mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* Độ phức tạp thời gian theo cấp số mũ (triển khai đệ quy) */
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* Độ phức tạp thời gian logarit (triển khai bằng vòng lặp) */
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* Độ phức tạp thời gian logarit (triển khai đệ quy) */
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* Độ phức tạp thời gian tuyến tính-logarit */
func linearLogRecur(n int) int {
	if n <= 1 {
		return 1
	}
	count := linearLogRecur(n/2) + linearLogRecur(n/2)
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Độ phức tạp thời gian giai thừa (triển khai đệ quy) */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// Chia từ 1 thành n
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
