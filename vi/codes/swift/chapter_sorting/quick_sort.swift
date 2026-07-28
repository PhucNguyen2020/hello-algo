/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Lớp sắp xếp nhanh */
/* Phân hoạch kiểu lính canh (sentinel partition) */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // Dùng nums[left] làm phần tử trục (pivot)
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // Tìm từ phải sang trái phần tử đầu tiên nhỏ hơn phần tử trục
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // Tìm từ trái sang phải phần tử đầu tiên lớn hơn phần tử trục
        }
        nums.swapAt(i, j) // Hoán đổi hai phần tử này
    }
    nums.swapAt(i, left) // Hoán đổi phần tử trục về ranh giới giữa hai mảng con
    return i // Trả về chỉ số của phần tử trục
}

/* Sắp xếp nhanh (quick sort) */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Dừng đệ quy khi độ dài mảng con là 1
    if left >= right {
        return
    }
    // Phân hoạch kiểu lính canh
    let pivot = partition(nums: &nums, left: left, right: right)
    // Đệ quy xử lý mảng con bên trái và mảng con bên phải
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Lớp sắp xếp nhanh (tối ưu chọn phần tử trục trung vị) */
/* Chọn trung vị của ba phần tử ứng viên */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m nằm giữa l và r
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l nằm giữa m và r
    }
    return right
}

/* Phân hoạch kiểu lính canh (trung vị của ba) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Chọn trung vị của ba phần tử ứng viên
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Hoán đổi trung vị về vị trí ngoài cùng bên trái của mảng
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Dừng đệ quy khi độ dài mảng con là 1
    if left >= right {
        return
    }
    // Phân hoạch kiểu lính canh
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Đệ quy xử lý mảng con bên trái và mảng con bên phải
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Dừng khi độ dài mảng con là 1
    while left < right {
        // Thao tác phân hoạch kiểu lính canh
        let pivot = partition(nums: &nums, left: left, right: right)
        // Thực hiện sắp xếp nhanh trên mảng con ngắn hơn trong hai mảng con
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Đệ quy sắp xếp mảng con bên trái
            left = pivot + 1 // Khoảng chưa sắp xếp còn lại là [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Đệ quy sắp xếp mảng con bên phải
            right = pivot - 1 // Khoảng chưa sắp xếp còn lại là [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Mã điều khiển */
    static func main() {
        /* Sắp xếp nhanh */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("Sau khi sắp xếp nhanh, nums = \(nums)")

        /* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("Sau khi sắp xếp nhanh (tối ưu chọn phần tử trục trung vị), nums1 = \(nums1)")

        /* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("Sau khi sắp xếp nhanh (tối ưu độ sâu đệ quy), nums2 = \(nums2)")
    }
}
