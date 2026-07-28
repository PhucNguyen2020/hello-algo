/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Tìm kiếm tuyến tính (mảng) */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Duyệt mảng
    for i in nums.indices {
        // Tìm thấy phần tử target, trả về chỉ số của nó
        if nums[i] == target {
            return i
        }
    }
    // Không tìm thấy phần tử target, trả về -1
    return -1
}

/* Tìm kiếm tuyến tính (danh sách liên kết) */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Duyệt danh sách liên kết
    while head != nil {
        // Tìm thấy nút target, trả về nó
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // Không tìm thấy nút target, trả về null
    return nil
}

@main
enum LinearSearch {
    /* Mã điều khiển */
    static func main() {
        let target = 3

        /* Thực hiện tìm kiếm tuyến tính trong mảng */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Chỉ số của phần tử target 3 = \(index)")

        /* Thực hiện tìm kiếm tuyến tính trong danh sách liên kết */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("Đối tượng nút tương ứng với giá trị nút target 3 là \(node!)")
    }
}
