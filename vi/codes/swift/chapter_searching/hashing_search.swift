/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Tìm kiếm bằng băm (mảng) */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // Khóa của bảng băm: phần tử target, giá trị: chỉ số
    // Nếu khóa này không tồn tại trong bảng băm, trả về -1
    return map[target, default: -1]
}

/* Tìm kiếm bằng băm (danh sách liên kết) */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // Khóa của bảng băm: giá trị nút target, giá trị: đối tượng nút
    // Nếu khóa không có trong bảng băm, trả về null
    return map[target]
}

@main
enum HashingSearch {
    /* Mã điều khiển */
    static func main() {
        let target = 3

        /* Tìm kiếm bằng băm (mảng) */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // Khởi tạo bảng băm
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // khóa: phần tử, giá trị: chỉ số
        }
        let index = hashingSearchArray(map: map, target: target)
        print("Chỉ số của phần tử target 3 = \(index)")

        /* Tìm kiếm bằng băm (danh sách liên kết) */
        var head = ListNode.arrToLinkedList(arr: nums)
        // Khởi tạo bảng băm
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // khóa: giá trị nút, giá trị: nút
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("Đối tượng nút tương ứng với giá trị nút target 3 là \(node!)")
    }
}
