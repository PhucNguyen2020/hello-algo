"""
File: preorder_traversal_iii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """Duyệt trước (preorder): Ví dụ 3"""
    # Cắt tỉa
    if root is None or root.val == 3:
        return
    # Thử
    path.append(root)
    if root.val == 7:
        # Ghi lại lời giải
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # Quay lui
    path.pop()


"""Mã chạy chương trình"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nKhởi tạo cây nhị phân")
    print_tree(root)

    # Duyệt trước
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\nXuất tất cả đường đi từ nút gốc đến nút có giá trị 7, loại trừ các đường đi có nút giá trị 3")
    for path in res:
        print([node.val for node in path])
