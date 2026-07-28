"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Lớp nút của danh sách liên kết"""

    def __init__(self, val: int):
        self.val: int = val  # Giá trị của nút
        self.next: ListNode | None = None  # Tham chiếu đến nút kế tiếp


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """Chuyển đổi một danh sách thành danh sách liên kết"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """Chuyển đổi một danh sách liên kết thành danh sách"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
