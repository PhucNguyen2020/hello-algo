/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Truy cập ngẫu nhiên vào một phần tử */
func randomAccess(nums: [Int]) -> Int {
    // Chọn ngẫu nhiên một số trong khoảng [0, nums.count)
    let randomIndex = nums.indices.randomElement()!
    // Lấy và trả về phần tử ngẫu nhiên
    let randomNum = nums[randomIndex]
    return randomNum
}

/* Mở rộng độ dài mảng */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // Khởi tạo một mảng với độ dài đã mở rộng
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // Sao chép toàn bộ phần tử từ mảng gốc sang mảng mới
    for i in nums.indices {
        res[i] = nums[i]
    }
    // Trả về mảng mới đã mở rộng
    return res
}

/* Chèn phần tử num vào vị trí index trong mảng */
func insert(nums: inout [Int], num: Int, index: Int) {
    // Dịch tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // Gán num cho phần tử tại vị trí index
    nums[index] = num
}

/* Xóa phần tử tại vị trí index */
func remove(nums: inout [Int], index: Int) {
    // Dịch tất cả phần tử sau vị trí index tiến lên một vị trí
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* Duyệt mảng */
func traverse(nums: [Int]) {
    var count = 0
    // Duyệt mảng theo chỉ số
    for i in nums.indices {
        count += nums[i]
    }
    // Duyệt trực tiếp các phần tử của mảng
    for num in nums {
        count += num
    }
    // Duyệt đồng thời chỉ số và phần tử
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* Tìm phần tử chỉ định trong mảng */
func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

@main
enum _Array {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo mảng */
        let arr = Array(repeating: 0, count: 5)
        print("Array arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("Array nums = \(nums)")

        /* Chèn phần tử */
        let randomNum = randomAccess(nums: nums)
        print("Get random element \(randomNum) from nums")

        /* Duyệt mảng */
        nums = extend(nums: nums, enlarge: 3)
        print("Extend array length to 8, get nums = \(nums)")

        /* Chèn phần tử */
        insert(nums: &nums, num: 6, index: 3)
        print("Insert number 6 at index 3, get nums = \(nums)")

        /* Xóa phần tử */
        remove(nums: &nums, index: 2)
        print("Delete element at index 2, get nums = \(nums)")

        /* Duyệt mảng */
        traverse(nums: nums)

        /* Tìm phần tử */
        let index = find(nums: nums, target: 3)
        print("Find element 3 in nums, index = \(index)")
    }
}
