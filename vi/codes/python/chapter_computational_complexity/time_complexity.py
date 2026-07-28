"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """Độ phức tạp bậc hằng số"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """Độ phức tạp bậc tuyến tính"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """Độ phức tạp bậc tuyến tính (duyệt mảng)"""
    count = 0
    # Số lần lặp tỉ lệ thuận với độ dài mảng
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Độ phức tạp bậc bình phương"""
    count = 0
    # Số lần lặp có quan hệ bình phương với kích thước dữ liệu n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Độ phức tạp bậc bình phương (sắp xếp nổi bọt)"""
    count = 0  # Bộ đếm
    # Vòng lặp ngoài: vùng chưa sắp xếp là [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Vòng lặp trong: đưa phần tử lớn nhất trong vùng chưa sắp xếp [0, i] về cuối bên phải của vùng đó
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Hoán đổi nums[j] và nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Việc hoán đổi phần tử gồm 3 thao tác đơn vị
    return count


def exponential(n: int) -> int:
    """Độ phức tạp bậc mũ (cài đặt bằng vòng lặp)"""
    count = 0
    base = 1
    # Số ô nhân đôi qua mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """Độ phức tạp bậc mũ (cài đặt bằng đệ quy)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """Độ phức tạp bậc logarit (cài đặt bằng vòng lặp)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """Độ phức tạp bậc logarit (cài đặt bằng đệ quy)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """Độ phức tạp bậc tuyến tính-logarit"""
    if n <= 1:
        return 1
    # Chia thành hai phần, quy mô bài toán con giảm đi một nửa
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # Bài toán con hiện tại chứa n thao tác
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Độ phức tạp bậc giai thừa (cài đặt bằng đệ quy)"""
    if n == 0:
        return 1
    count = 0
    # Chia từ 1 thành n
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Mã chạy chương trình"""
if __name__ == "__main__":
    # Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
    n = 8
    print("Input data size n =", n)

    count = constant(n)
    print("Number of operations of constant order =", count)

    count = linear(n)
    print("Number of operations of linear order =", count)
    count = array_traversal([0] * n)
    print("Number of operations of linear order (traversing array) =", count)

    count = quadratic(n)
    print("Number of operations of quadratic order =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("Number of operations of quadratic order (bubble sort) =", count)

    count = exponential(n)
    print("Number of operations of exponential order (loop implementation) =", count)
    count = exp_recur(n)
    print("Number of operations of exponential order (recursive implementation) =", count)

    count = logarithmic(n)
    print("Number of operations of logarithmic order (loop implementation) =", count)
    count = log_recur(n)
    print("Number of operations of logarithmic order (recursive implementation) =", count)

    count = linear_log_recur(n)
    print("Number of operations of linearithmic order (recursive implementation) =", count)

    count = factorial_recur(n)
    print("Number of operations of factorial order (recursive implementation) =", count)
