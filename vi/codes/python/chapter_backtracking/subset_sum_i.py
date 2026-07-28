"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Giải thuật quay lui: Tổng tập con I"""
    # Khi tổng tập con bằng target, ghi lại lời giải
    if target == 0:
        res.append(list(state))
        return
    # Duyệt qua tất cả các lựa chọn
    # Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    for i in range(start, len(choices)):
        # Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay lập tức
        # Điều này là vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn nên tổng tập con chắc chắn sẽ vượt quá target
        if target - choices[i] < 0:
            break
        # Thử: thực hiện lựa chọn, cập nhật target, start
        state.append(choices[i])
        # Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i, res)
        # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """Giải bài toán tổng tập con I"""
    state = []  # Trạng thái (tập con)
    nums.sort()  # Sắp xếp nums
    start = 0  # Điểm bắt đầu duyệt
    res = []  # Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, nums, start, res)
    return res


"""Mã chạy chương trình"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"Mảng đầu vào nums = {nums}, target = {target}")
    print(f"Tất cả các tập con có tổng bằng {target} res = {res}")
