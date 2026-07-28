"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """Di chuyển một đĩa"""
    # Lấy một đĩa ra khỏi đỉnh của src
    pan = src.pop()
    # Đặt đĩa lên đỉnh của tar
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """Giải bài toán Tháp Hà Nội f(i)"""
    # Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó sang tar
    if i == 1:
        move(src, tar)
        return
    # Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar làm trung gian
    dfs(i - 1, src, tar, buf)
    # Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
    move(src, tar)
    # Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src làm trung gian
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """Giải bài toán Tháp Hà Nội"""
    n = len(A)
    # Di chuyển n đĩa trên cùng từ A sang C, dùng B làm trung gian
    dfs(n, A, B, C)


"""Chương trình chính"""
if __name__ == "__main__":
    # Đuôi của danh sách là đỉnh của cột
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("Initial state:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("After moving the disks:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
