/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* Xóa nút đầu tiên đứng sau nút n0 trong danh sách liên kết */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* Truy cập nút tại vị trí index trong danh sách liên kết */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* Tìm nút đầu tiên có giá trị bằng target trong danh sách liên kết */
fun find(head: ListNode?, target: Int): Int {
    var index = 0
    var h = head
    while (h != null) {
        if (h._val == target)
            return index
        h = h.next
        index++
    }
    return -1
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    /* Khởi tạo danh sách liên kết */
    // Khởi tạo từng nút
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // Xây dựng tham chiếu giữa các nút
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("Initialized linked list is")
    printLinkedList(n0)

    /* Chèn nút */
    insert(n0, ListNode(0))
    println("Linked list after inserting node is")
    printLinkedList(n0)

    /* Xóa nút */
    remove(n0)
    println("Linked list after removing node is")
    printLinkedList(n0)

    /* Truy cập nút */
    val node = access(n0, 3)!!
    println("Value of node at index 3 in linked list = ${node._val}")

    /* Tìm kiếm nút */
    val index = find(n0, 2)
    println("Index of node with value 2 in linked list = $index")
}