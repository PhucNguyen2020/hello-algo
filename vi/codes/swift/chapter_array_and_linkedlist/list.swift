/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo danh sách */
        var nums = [1, 3, 2, 5, 4]
        print("List nums = \(nums)")

        /* Cập nhật phần tử */
        let num = nums[1]
        print("Access element at index 1, get num = \(num)")

        /* Thêm phần tử vào cuối danh sách */
        nums[1] = 0
        print("Update element at index 1 to 0, get nums = \(nums)")

        /* Xóa phần tử */
        nums.removeAll()
        print("After clearing list, nums = \(nums)")

        /* Duyệt trực tiếp các phần tử của danh sách */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("After adding elements, nums = \(nums)")

        /* Sắp xếp danh sách */
        nums.insert(6, at: 3)
        print("Insert number 6 at index 3, get nums = \(nums)")

        /* Xóa phần tử */
        nums.remove(at: 3)
        print("Delete element at index 3, get nums = \(nums)")

        /* Duyệt danh sách theo chỉ số */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* Duyệt trực tiếp các phần tử của danh sách */
        count = 0
        for x in nums {
            count += x
        }

        /* Nối hai danh sách */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("After concatenating list nums1 to nums, get nums = \(nums)")

        /* Sắp xếp danh sách */
        nums.sort()
        print("After sorting list, nums = \(nums)")
    }
}
