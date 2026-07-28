"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """Tìm kiếm nhị phân: bài toán f(i, j)"""
    # Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
    if i > j:
        return -1
    # Tính chỉ số điểm giữa m
    m = (i + j) // 2
    if nums[m] < target:
        # Đệ quy bài toán con f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # Đệ quy bài toán con f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
        return m


def binary_search(nums: list[int], target: int) -> int:
    """Tìm kiếm nhị phân"""
    n = len(nums)
    # Giải bài toán f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Chương trình chính"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu)
    index = binary_search(nums, target)
    print("Index of target element 6 = ", index)
