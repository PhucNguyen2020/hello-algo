/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sắp xếp chọn (selection sort) */
func selectionSort(nums: inout [Int]) {
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [i, n-1]
    for i in nums.indices.dropLast() {
        // Vòng lặp trong: tìm phần tử nhỏ nhất trong khoảng chưa sắp xếp
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // Ghi lại chỉ số của phần tử nhỏ nhất
            }
        }
        // Hoán đổi phần tử nhỏ nhất với phần tử đầu tiên của khoảng chưa sắp xếp
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Mã điều khiển */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("Sau khi sắp xếp chọn, nums = \(nums)")
    }
}
