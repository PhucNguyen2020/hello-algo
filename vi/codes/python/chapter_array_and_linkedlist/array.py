"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Truy cập ngẫu nhiên một phần tử"""
    # Chọn ngẫu nhiên một số trong khoảng [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Lấy và trả về phần tử ngẫu nhiên
    random_num = nums[random_index]
    return random_num


# Lưu ý rằng list trong Python là một mảng động, có thể mở rộng trực tiếp
# Vì mục đích học tập, hàm này coi list như một mảng có độ dài không đổi
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Mở rộng độ dài mảng"""
    # Khởi tạo một mảng có độ dài đã mở rộng
    res = [0] * (len(nums) + enlarge)
    # Sao chép tất cả các phần tử từ mảng gốc sang mảng mới
    for i in range(len(nums)):
        res[i] = nums[i]
    # Trả về mảng mới đã mở rộng
    return res


def insert(nums: list[int], num: int, index: int):
    """Chèn phần tử num vào vị trí index trong mảng"""
    # Dịch chuyển tất cả các phần tử từ vị trí index trở về sau lùi lại một vị trí
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Gán num vào phần tử tại vị trí index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Xóa phần tử tại vị trí index"""
    # Dịch chuyển tất cả các phần tử sau vị trí index tiến lên một vị trí
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Duyệt mảng"""
    count = 0
    # Duyệt mảng theo chỉ số
    for i in range(len(nums)):
        count += nums[i]
    # Duyệt trực tiếp các phần tử của mảng
    for num in nums:
        count += num
    # Duyệt đồng thời chỉ số và phần tử
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Tìm phần tử được chỉ định trong mảng"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Khởi tạo mảng
    arr = [0] * 5
    print("Array arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Array nums =", nums)

    # Truy cập ngẫu nhiên
    random_num: int = random_access(nums)
    print("Get random element from nums", random_num)

    # Mở rộng độ dài
    nums: list[int] = extend(nums, 3)
    print("Extend the array length to 8, get nums =", nums)

    # Chèn phần tử
    insert(nums, 6, 3)
    print("Insert number 6 at index 3, get nums =", nums)

    # Xóa phần tử
    remove(nums, 2)
    print("Remove the element at index 2, get nums =", nums)

    # Duyệt mảng
    traverse(nums)

    # Tìm phần tử
    index: int = find(nums, 3)
    print("Search for element 3 in nums, get index =", index)
