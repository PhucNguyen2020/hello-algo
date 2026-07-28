"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """Lớp nút của cây nhị phân"""

    def __init__(self, val: int = 0):
        self.val: int = val  # Giá trị của nút
        self.height: int = 0  # Chiều cao của nút
        self.left: TreeNode | None = None  # Tham chiếu đến nút con trái
        self.right: TreeNode | None = None  # Tham chiếu đến nút con phải

    # Về quy tắc mã hóa tuần tự hóa, vui lòng tham khảo:
    # https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    # Biểu diễn mảng của cây nhị phân:
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # Biểu diễn danh sách liên kết của cây nhị phân:
    #             /——— 15
    #         /——— 7
    #     /——— 3
    #    |    \——— 6
    #    |        \——— 12
    # ——— 1
    #     \——— 2
    #        |    /——— 9
    #         \——— 4
    #             \——— 8


def list_to_tree_dfs(arr: list[int], i: int) -> TreeNode | None:
    """Chuyển đổi một danh sách thành cây nhị phân: đệ quy"""
    # Nếu chỉ số vượt quá độ dài mảng, hoặc phần tử tương ứng là None, trả về None
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # Xây dựng nút hiện tại
    root = TreeNode(arr[i])
    # Đệ quy xây dựng cây con trái và cây con phải
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """Chuyển đổi một danh sách thành cây nhị phân"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """Chuyển đổi cây nhị phân thành danh sách: đệ quy"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """Chuyển đổi cây nhị phân thành danh sách"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
