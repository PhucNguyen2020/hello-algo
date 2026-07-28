"""
File: preorder_traversal_iii_template.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def is_solution(state: list[TreeNode]) -> bool:
    """Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """Ghi lại lời giải"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """Cập nhật trạng thái"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """Khôi phục trạng thái"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """Giải thuật quay lui: Ví dụ 3"""
    # Kiểm tra xem đây có phải là lời giải hay không
    if is_solution(state):
        # Ghi lại lời giải
        record_solution(state, res)
    # Duyệt qua tất cả các lựa chọn
    for choice in choices:
        # Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
        if is_valid(state, choice):
            # Thử: thực hiện lựa chọn, cập nhật trạng thái
            make_choice(state, choice)
            # Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, [choice.left, choice.right], res)
            # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
            undo_choice(state, choice)


"""Mã chạy chương trình"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nKhởi tạo cây nhị phân")
    print_tree(root)

    # Giải thuật quay lui
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nXuất tất cả đường đi từ nút gốc đến nút có giá trị 7, loại trừ các đường đi có nút giá trị 3")
    for path in res:
        print([node.val for node in path])
