/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Độ phức tạp hằng số */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* Độ phức tạp tuyến tính */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* Độ phức tạp tuyến tính (duyệt mảng) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // Số lần lặp tỷ lệ thuận với độ dài mảng
    for _ in nums {
        count += 1
    }
    return count
}

/* Độ phức tạp bậc hai */
func quadratic(n: Int) -> Int {
    var count = 0
    // Số lần lặp có quan hệ bậc hai với kích thước dữ liệu n
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* Độ phức tạp bậc hai (sắp xếp nổi bọt) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // Bộ đếm
    // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Vòng lặp trong: đẩy phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối phạm vi đó
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Hoán đổi nums[j] và nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // Một lần hoán đổi phần tử gồm 3 thao tác đơn vị
            }
        }
    }
    return count
}

/* Độ phức tạp theo cấp số nhân (triển khai bằng vòng lặp) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // Số ô nhân đôi sau mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Độ phức tạp theo cấp số nhân (triển khai đệ quy) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* Độ phức tạp logarit (triển khai bằng vòng lặp) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* Độ phức tạp logarit (triển khai đệ quy) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* Độ phức tạp tuyến tính-logarit */
func linearLogRecur(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
    for _ in stride(from: 0, to: n, by: 1) {
        count += 1
    }
    return count
}

/* Độ phức tạp giai thừa (triển khai đệ quy) */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // Phân nhánh từ 1 thành n
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Mã điều khiển */
    static func main() {
        // Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
        let n = 8
        print("Input data size n = \(n)")

        var count = constant(n: n)
        print("Constant-time operations count = \(count)")

        count = linear(n: n)
        print("Linear-time operations count = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("Linear-time (array traversal) operations count = \(count)")

        count = quadratic(n: n)
        print("Quadratic-time operations count = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("Quadratic-time (bubble sort) operations count = \(count)")

        count = exponential(n: n)
        print("Exponential-time (iterative) operations count = \(count)")
        count = expRecur(n: n)
        print("Exponential-time (recursive) operations count = \(count)")

        count = logarithmic(n: n)
        print("Logarithmic-time (iterative) operations count = \(count)")
        count = logRecur(n: n)
        print("Logarithmic-time (recursive) operations count = \(count)")

        count = linearLogRecur(n: n)
        print("Linearithmic-time (recursive) operations count = \(count)")

        count = factorialRecur(n: n)
        print("Factorial-time (recursive) operations count = \(count)")
    }
}
