/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Khởi tạo khoảng đóng [0, n-1], tức i, j trỏ đến phần tử đầu tiên và cuối cùng của mảng
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Vòng lặp, thoát khi khoảng tìm kiếm rỗng (rỗng khi i > j)
    while i <= j {
        let m = i + (j - i) / 2 // Tính chỉ số điểm giữa m
        if nums[m] < target { // Điều này có nghĩa target nằm trong khoảng [m+1, j]
            i = m + 1
        } else if nums[m] > target { // Điều này có nghĩa target nằm trong khoảng [i, m-1]
            j = m - 1
        } else { // Tìm thấy phần tử target, trả về chỉ số của nó
            return m
        }
    }
    // Không tìm thấy phần tử target, trả về -1
    return -1
}

/* Tìm kiếm nhị phân (khoảng đóng trái, mở phải) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Khởi tạo khoảng đóng trái, mở phải [0, n), tức i, j trỏ đến phần tử đầu tiên và (phần tử cuối cùng + 1)
    var i = nums.startIndex
    var j = nums.endIndex
    // Vòng lặp, thoát khi khoảng tìm kiếm rỗng (rỗng khi i = j)
    while i < j {
        let m = i + (j - i) / 2 // Tính chỉ số điểm giữa m
        if nums[m] < target { // Điều này có nghĩa target nằm trong khoảng [m+1, j)
            i = m + 1
        } else if nums[m] > target { // Điều này có nghĩa target nằm trong khoảng [i, m)
            j = m
        } else { // Tìm thấy phần tử target, trả về chỉ số của nó
            return m
        }
    }
    // Không tìm thấy phần tử target, trả về -1
    return -1
}

@main
enum BinarySearch {
    /* Mã điều khiển */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu) */
        var index = binarySearch(nums: nums, target: target)
        print("Chỉ số của phần tử target 6 = \(index)")

        /* Tìm kiếm nhị phân (khoảng đóng trái, mở phải) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Chỉ số của phần tử target 6 = \(index)")
    }
}
