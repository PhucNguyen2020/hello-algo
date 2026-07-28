/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* Xóa nút đầu tiên đứng sau nút n0 trong danh sách liên kết */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* Truy cập nút tại vị trí index trong danh sách liên kết */
func access(head: ListNode, index: Int) -> ListNode? {
    var head: ListNode? = head
    for _ in 0 ..< index {
        if head == nil {
            return nil
        }
        head = head?.next
    }
    return head
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
func find(head: ListNode, target: Int) -> Int {
    var head: ListNode? = head
    var index = 0
    while head != nil {
        if head?.val == target {
            return index
        }
        head = head?.next
        index += 1
    }
    return -1
}

@main
enum LinkedList {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo danh sách liên kết */
        // Khởi tạo từng nút
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // Xây dựng tham chiếu giữa các nút
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("Initialized linked list is")
        PrintUtil.printLinkedList(head: n0)

        /* Chèn nút */
        insert(n0: n0, P: ListNode(x: 0))
        print("Linked list after inserting node is")
        PrintUtil.printLinkedList(head: n0)

        /* Xóa nút */
        remove(n0: n0)
        print("Linked list after removing node is")
        PrintUtil.printLinkedList(head: n0)

        /* Truy cập nút */
        let node = access(head: n0, index: 3)
        print("Value of node at index 3 in linked list = \(node!.val)")

        /* Tìm kiếm nút */
        let index = find(head: n0, target: 2)
        print("Index of node with value 2 in linked list = \(index)")
    }
}
