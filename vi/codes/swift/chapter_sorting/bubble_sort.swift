/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sắp xếp nổi bọt */
func bubbleSort(nums: inout [Int]) {
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Vòng lặp trong: đưa phần tử lớn nhất trong khoảng chưa sắp xếp [0, i] về đầu bên phải của khoảng đó
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Hoán đổi nums[j] và nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* Sắp xếp nổi bọt (tối ưu bằng cờ hiệu) */
func bubbleSortWithFlag(nums: inout [Int]) {
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // Khởi tạo cờ hiệu
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Hoán đổi nums[j] và nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // Ghi nhận có hoán đổi phần tử
            }
        }
        if !flag { // Vòng "nổi bọt" này không có phần tử nào được hoán đổi, thoát ngay
            break
        }
    }
}

@main
enum BubbleSort {
    /* Mã điều khiển */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("Sau khi sắp xếp nổi bọt, nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("Sau khi sắp xếp nổi bọt, nums1 = \(nums1)")
    }
}
