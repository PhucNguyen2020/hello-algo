"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """Tìm kiếm ghi nhớ hóa"""
    # Đã biết dp[1] và dp[2], trả về chúng
    if i == 1 or i == 2:
        return i
    # Nếu bản ghi dp[i] đã tồn tại, trả về nó trực tiếp
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # Ghi lại dp[i]
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """Leo cầu thang: Tìm kiếm ghi nhớ hóa"""
    # mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Chương trình chính"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"Climbing {n} stairs has {res} solutions")
