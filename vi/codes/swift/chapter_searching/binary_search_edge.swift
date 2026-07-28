/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Tìm kiếm nhị phân cho vị trí target ngoài cùng bên trái */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // Tương đương với việc tìm điểm chèn của target
    let i = binarySearchInsertion(nums: nums, target: target)
    // Không tìm thấy target, trả về -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Tìm thấy target, trả về chỉ số i
    return i
}

/* Tìm kiếm nhị phân cho vị trí target ngoài cùng bên phải */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Chuyển thành tìm vị trí ngoài cùng bên trái của target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j trỏ đến target ngoài cùng bên phải, i trỏ đến phần tử đầu tiên lớn hơn target
    let j = i - 1
    // Không tìm thấy target, trả về -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Tìm thấy target, trả về chỉ số j
    return j
}

@main
enum BinarySearchEdge {
    /* Mã điều khiển */
    static func main() {
        // Mảng có phần tử trùng lặp
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nMảng nums = \(nums)")

        // Tìm kiếm nhị phân biên trái và biên phải
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Chỉ số của phần tử \(target) ngoài cùng bên trái là \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Chỉ số của phần tử \(target) ngoài cùng bên phải là \(index)")
        }
    }
}
