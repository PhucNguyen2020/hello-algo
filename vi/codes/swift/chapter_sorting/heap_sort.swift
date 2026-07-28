/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Độ dài đống (heap) là n, bắt đầu vun đống nút i, từ trên xuống dưới */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // Nếu nút i là lớn nhất, hoặc chỉ số l, r vượt biên, không cần tiếp tục vun đống, dừng lại
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // Hoán đổi hai nút
        if ma == i {
            break
        }
        // Hoán đổi hai nút
        nums.swapAt(i, ma)
        // Tiếp tục vun đống xuống dưới
        i = ma
    }
}

/* Sắp xếp vun đống (heap sort) */
func heapSort(nums: inout [Int]) {
    // Thao tác xây dựng đống: vun đống tất cả các nút trừ các nút lá
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // Lấy ra phần tử lớn nhất từ đống, lặp lại n-1 vòng
    for i in nums.indices.dropFirst().reversed() {
        // Xóa nút
        nums.swapAt(0, i)
        // Bắt đầu vun đống nút gốc, từ trên xuống dưới
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Mã điều khiển */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("Sau khi sắp xếp vun đống, nums = \(nums)")
    }
}
