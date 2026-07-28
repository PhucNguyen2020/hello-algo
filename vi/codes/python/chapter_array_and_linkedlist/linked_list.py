"""
File: linked_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, print_linked_list


def insert(n0: ListNode, P: ListNode):
    """Chèn nút P vào sau nút n0 trong danh sách liên kết"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """Xóa nút đầu tiên đứng sau nút n0 trong danh sách liên kết"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """Truy cập nút tại vị trí index trong danh sách liên kết"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """Tìm nút đầu tiên có giá trị target trong danh sách liên kết"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Khởi tạo danh sách liên kết
    # Khởi tạo từng nút
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Xây dựng liên kết giữa các nút
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("The initialized linked list is")
    print_linked_list(n0)

    # Chèn nút
    p = ListNode(0)
    insert(n0, p)
    print("The linked list after inserting a node is")
    print_linked_list(n0)

    # Xóa nút
    remove(n0)
    print("The linked list after removing a node is")
    print_linked_list(n0)

    # Truy cập nút
    node: ListNode = access(n0, 3)
    print("The value of the node at index 3 in the linked list = {}".format(node.val))

    # Tìm nút
    index: int = find(n0, 2)
    print("The index of the node with value 2 in the linked list = {}".format(index))
