/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sắp xếp đếm (counting sort) */
// Cài đặt đơn giản, không thể dùng để sắp xếp đối tượng
func countingSortNaive(nums: inout [Int]) {
    // 1. Đếm phần tử lớn nhất m trong mảng
    let m = nums.max()!
    // 2. Đếm số lần xuất hiện của mỗi số
    // counter[num] biểu thị số lần xuất hiện của num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Duyệt counter, điền lại các phần tử vào mảng gốc nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Sắp xếp đếm (counting sort) */
// Cài đặt đầy đủ, có thể sắp xếp đối tượng và là một giải thuật sắp xếp ổn định
func countingSort(nums: inout [Int]) {
    // 1. Đếm phần tử lớn nhất m trong mảng
    let m = nums.max()!
    // 2. Đếm số lần xuất hiện của mỗi số
    // counter[num] biểu thị số lần xuất hiện của num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Tính tổng tiền tố của counter, chuyển "số lần xuất hiện" thành "chỉ số cuối cùng"
    // counter[num]-1 là chỉ số cuối cùng mà num xuất hiện trong res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Duyệt nums theo thứ tự ngược, đặt từng phần tử vào mảng kết quả res
    // Khởi tạo mảng res để ghi lại kết quả
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Đặt num vào chỉ số tương ứng
        counter[num] -= 1 // Giảm tổng tiền tố đi 1, để lấy chỉ số kế tiếp cho num
    }
    // Dùng mảng kết quả res để ghi đè lên mảng gốc nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Mã điều khiển */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("Sau khi sắp xếp đếm (không thể sắp xếp đối tượng), nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("Sau khi sắp xếp đếm, nums1 = \(nums1)")
    }
}
