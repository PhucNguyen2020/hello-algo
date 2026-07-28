/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tìm kiếm nhị phân: bài toán con f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
    if i > j {
        return -1
    }
    // Tính chỉ số điểm giữa m
    let m = (i + j) / 2
    if nums[m] < target {
        // Đệ quy vào bài toán con f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // Đệ quy vào bài toán con f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
        return m
    }
}

/* Tìm kiếm nhị phân */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Giải bài toán f(0, n-1)
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* Mã điều khiển */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu)
        let index = binarySearch(nums: nums, target: target)
        print("Index of target element 6 = \(index)")
    }
}
