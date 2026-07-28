/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sắp xếp chèn (insertion sort) */
func insertionSort(nums: inout [Int]) {
    // Vòng lặp ngoài: khoảng đã sắp xếp là [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // Vòng lặp trong: chèn base vào đúng vị trí trong khoảng đã sắp xếp [0, i-1]
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // Dịch nums[j] sang phải một vị trí
            j -= 1
        }
        nums[j + 1] = base // Gán base vào đúng vị trí
    }
}

@main
enum InsertionSort {
    /* Mã điều khiển */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("Sau khi sắp xếp chèn, nums = \(nums)")
    }
}
