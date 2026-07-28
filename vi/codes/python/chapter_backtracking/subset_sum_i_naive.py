"""
File: subset_sum_i_naive.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int],
    target: int,
    total: int,
    choices: list[int],
    res: list[list[int]],
):
    """Giải thuật quay lui: Tổng tập con I"""
    # Khi tổng tập con bằng target, ghi lại lời giải
    if total == target:
        res.append(list(state))
        return
    # Duyệt qua tất cả các lựa chọn
    for i in range(len(choices)):
        # Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
        if total + choices[i] > target:
            continue
        # Thử: thực hiện lựa chọn, cập nhật tổng total
        state.append(choices[i])
        # Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res)
        # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Giải bài toán tổng tập con I (bao gồm cả các tập trùng lặp)"""
    state = []  # Trạng thái (tập con)
    total = 0  # Tổng tập con
    res = []  # Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, total, nums, res)
    return res


"""Mã chạy chương trình"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Mảng đầu vào nums = {nums}, target = {target}")
    print(f"Tất cả các tập con có tổng bằng {target} res = {res}")
    print(f"Lưu ý rằng kết quả xuất ra bởi phương pháp này chứa các tập trùng lặp")
