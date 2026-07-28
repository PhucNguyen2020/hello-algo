"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """Leo cầu thang: Quy hoạch động"""
    if n == 1 or n == 2:
        return n
    # Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    dp = [0] * (n + 1)
    # Trạng thái khởi tạo: gán trước lời giải cho bài toán con nhỏ nhất
    dp[1], dp[2] = 1, 2
    # Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """Leo cầu thang: Quy hoạch động tối ưu không gian"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Chương trình chính"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"Climbing {n} stairs has {res} solutions")

    res = climbing_stairs_dp_comp(n)
    print(f"Climbing {n} stairs has {res} solutions")
