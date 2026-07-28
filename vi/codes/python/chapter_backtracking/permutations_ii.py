"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Giải thuật quay lui: Hoán vị II"""
    # Khi độ dài của state bằng số lượng phần tử, ghi lại lời giải
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Duyệt qua tất cả các lựa chọn
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Cắt tỉa: không cho phép chọn lặp lại phần tử và không cho phép chọn lặp lại các phần tử có giá trị bằng nhau
        if not selected[i] and choice not in duplicated:
            # Thử: thực hiện lựa chọn, cập nhật state
            duplicated.add(choice)  # Ghi lại giá trị phần tử đã được chọn
            selected[i] = True
            state.append(choice)
            # Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, choices, selected, res)
            # Quay lui: hoàn tác lựa chọn, khôi phục về state trước đó
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """Hoán vị II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations res = {res}")
