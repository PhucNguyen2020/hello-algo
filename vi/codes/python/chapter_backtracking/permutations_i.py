"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Giải thuật quay lui: Hoán vị I"""
    # Khi độ dài của state bằng số lượng phần tử, ghi lại lời giải
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Duyệt qua tất cả các lựa chọn
    for i, choice in enumerate(choices):
        # Cắt tỉa: không cho phép chọn lặp lại phần tử
        if not selected[i]:
            # Thử: thực hiện lựa chọn, cập nhật state
            selected[i] = True
            state.append(choice)
            # Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, choices, selected, res)
            # Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Hoán vị I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations res = {res}")
