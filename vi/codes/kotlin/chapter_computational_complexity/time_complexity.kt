/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* Độ phức tạp hằng số */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* Độ phức tạp tuyến tính */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* Độ phức tạp tuyến tính (duyệt mảng) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // Số lần lặp tỉ lệ thuận với độ dài mảng
    for (num in nums) {
        count++
    }
    return count
}

/* Độ phức tạp bình phương */
fun quadratic(n: Int): Int {
    var count = 0
    // Số lần lặp liên quan bậc hai với kích thước dữ liệu n
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* Độ phức tạp bình phương (sắp xếp nổi bọt) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // Bộ đếm
    // Vòng lặp ngoài: vùng chưa sắp xếp là [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Vòng lặp trong: đưa phần tử lớn nhất trong vùng chưa sắp xếp [0, i] về cuối vùng đó
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Hoán đổi nums[j] và nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // Hoán đổi phần tử gồm 3 thao tác đơn vị
            }
        }
    }
    return count
}

/* Độ phức tạp mũ (cài đặt bằng vòng lặp) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // Số ô nhân đôi sau mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Độ phức tạp mũ (cài đặt đệ quy) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* Độ phức tạp logarit (cài đặt bằng vòng lặp) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* Độ phức tạp logarit (cài đặt đệ quy) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* Độ phức tạp tuyến tính-logarit */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* Độ phức tạp giai thừa (cài đặt đệ quy) */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // Chia từ 1 thành n
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Code chạy chính */
fun main() {
    // Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
    val n = 8
    println("Input data size n = $n")

    var count = constant(n)
    println("Constant-time operations count = $count")

    count = linear(n)
    println("Linear-time operations count = $count")
    count = arrayTraversal(IntArray(n))
    println("Linear-time (array traversal) operations count = $count")

    count = quadratic(n)
    println("Quadratic-time operations count = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Quadratic-time (bubble sort) operations count = $count")

    count = exponential(n)
    println("Exponential-time (iterative) operations count = $count")
    count = expRecur(n)
    println("Exponential-time (recursive) operations count = $count")

    count = logarithmic(n)
    println("Logarithmic-time (iterative) operations count = $count")
    count = logRecur(n)
    println("Logarithmic-time (recursive) operations count = $count")

    count = linearLogRecur(n)
    println("Linearithmic-time (recursive) operations count = $count")

    count = factorialRecur(n)
    println("Factorial-time (recursive) operations count = $count")
}