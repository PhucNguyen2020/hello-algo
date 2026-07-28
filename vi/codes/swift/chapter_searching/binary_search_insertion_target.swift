/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tìm kiếm nhị phân cho điểm chèn (không có phần tử trùng lặp) */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Khởi tạo khoảng đóng [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Tính chỉ số điểm giữa m
        if nums[m] < target {
            i = m + 1 // target nằm trong khoảng [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target nằm trong khoảng [i, m-1]
        } else {
            return m // Tìm thấy target, trả về điểm chèn m
        }
    }
    // Không tìm thấy target, trả về điểm chèn i
    return i
}

/* Tìm kiếm nhị phân cho điểm chèn (có phần tử trùng lặp) */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Khởi tạo khoảng đóng [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Tính chỉ số điểm giữa m
        if nums[m] < target {
            i = m + 1 // target nằm trong khoảng [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target nằm trong khoảng [i, m-1]
        } else {
            j = m - 1 // Phần tử đầu tiên nhỏ hơn target nằm trong khoảng [i, m-1]
        }
    }
    // Trả về điểm chèn i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Mã điều khiển */
    static func main() {
        // Mảng không có phần tử trùng lặp
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nMảng nums = \(nums)")
        // Tìm kiếm nhị phân cho điểm chèn
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Chỉ số điểm chèn của phần tử \(target) là \(index)")
        }

        // Mảng có phần tử trùng lặp
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nMảng nums = \(nums)")
        // Tìm kiếm nhị phân cho điểm chèn
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Chỉ số điểm chèn của phần tử \(target) là \(index)")
        }
    }
}

#endif
