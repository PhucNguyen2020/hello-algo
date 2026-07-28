"""
File: climbing_stairs_constraint_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_constraint_dp(n: int) -> int:
    """Leo cầu thang có ràng buộc: Quy hoạch động"""
    if n == 1 or n == 2:
        return 1
    # Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    dp = [[0] * 3 for _ in range(n + 1)]
    # Trạng thái khởi tạo: gán trước lời giải cho bài toán con nhỏ nhất
    dp[1][1], dp[1][2] = 1, 0
    dp[2][1], dp[2][2] = 0, 1
    # Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for i in range(3, n + 1):
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    return dp[n][1] + dp[n][2]


"""Chương trình chính"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_constraint_dp(n)
    print(f"Climbing {n} stairs has {res} solutions")
