/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Trộn mảng con bên trái và mảng con bên phải */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // Khoảng của mảng con bên trái là [left, mid], khoảng của mảng con bên phải là [mid+1, right]
    // Tạo mảng tạm tmp để lưu kết quả trộn
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Khởi tạo chỉ số bắt đầu của mảng con bên trái và bên phải
    var i = left, j = mid + 1, k = 0
    // Khi cả hai mảng con vẫn còn phần tử, so sánh và sao chép phần tử nhỏ hơn vào mảng tạm
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // Sao chép các phần tử còn lại của mảng con bên trái và bên phải vào mảng tạm
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // Sao chép các phần tử từ mảng tạm tmp trở lại mảng gốc nums tại khoảng tương ứng
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Sắp xếp trộn (merge sort) */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Điều kiện dừng
    if left >= right { // Dừng đệ quy khi độ dài mảng con là 1
        return
    }
    // Giai đoạn chia để trị
    let mid = left + (right - left) / 2 // Tính điểm giữa
    mergeSort(nums: &nums, left: left, right: mid) // Đệ quy xử lý mảng con bên trái
    mergeSort(nums: &nums, left: mid + 1, right: right) // Đệ quy xử lý mảng con bên phải
    // Giai đoạn trộn
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Mã điều khiển */
    static func main() {
        /* Sắp xếp trộn */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("Sau khi sắp xếp trộn, nums = \(nums)")
    }
}
