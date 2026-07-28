"""
File: build_tree.py
Created Time: 2023-07-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


def dfs(
    preorder: list[int],
    inorder_map: dict[int, int],
    i: int,
    l: int,
    r: int,
) -> TreeNode | None:
    """Xây dựng cây nhị phân: chia để trị"""
    # Dừng khi khoảng của cây con rỗng
    if r - l < 0:
        return None
    # Khởi tạo nút gốc
    root = TreeNode(preorder[i])
    # Truy vấn m để phân chia cây con trái và phải
    m = inorder_map[preorder[i]]
    # Bài toán con: xây dựng cây con trái
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
    # Bài toán con: xây dựng cây con phải
    root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
    # Trả về nút gốc
    return root


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    """Xây dựng cây nhị phân"""
    # Khởi tạo bảng băm, lưu ánh xạ từ phần tử của duyệt giữa đến chỉ số
    inorder_map = {val: i for i, val in enumerate(inorder)}
    root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
    return root


"""Chương trình chính"""
if __name__ == "__main__":
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    print(f"Preorder traversal = {preorder}")
    print(f"Inorder traversal = {inorder}")

    root = build_tree(preorder, inorder)
    print("The built binary tree is:")
    print_tree(root)
