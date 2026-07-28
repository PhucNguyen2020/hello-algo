"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Quay lui"""
    # Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
    if state == n:
        res[0] += 1
    # Duyệt qua tất cả các lựa chọn
    for choice in choices:
        # Cắt tỉa: không được phép vượt quá bậc thang thứ n
        if state + choice > n:
            continue
        # Thử: đưa ra một lựa chọn, cập nhật trạng thái
        backtrack(choices, state + choice, n, res)
        # Quay lui


def climbing_stairs_backtrack(n: int) -> int:
    """Leo cầu thang: Quay lui"""
    choices = [1, 2]  # Có thể chọn leo 1 hoặc 2 bậc
    state = 0  # Bắt đầu leo từ bậc thang thứ 0
    res = [0]  # Dùng res[0] để ghi lại số lời giải
    backtrack(choices, state, n, res)
    return res[0]


"""Chương trình chính"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Climbing {n} stairs has {res} solutions")
