"""
File: n_queens.py
Created Time: 2023-04-26
Author: krahets (krahets@163.com)
"""


def backtrack(
    row: int,
    n: int,
    state: list[list[str]],
    res: list[list[list[str]]],
    cols: list[bool],
    diags1: list[bool],
    diags2: list[bool],
):
    """Giải thuật quay lui: N quân hậu"""
    # Khi tất cả các hàng đã được đặt xong, ghi lại lời giải
    if row == n:
        res.append([list(row) for row in state])
        return
    # Duyệt qua tất cả các cột
    for col in range(n):
        # Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        diag1 = row - col + n - 1
        diag2 = row + col
        # Cắt tỉa: không cho phép có quân hậu trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Thử: đặt quân hậu vào ô này
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Đặt quân hậu ở hàng tiếp theo
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Quay lui: khôi phục ô này thành ô trống
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Giải bài toán N quân hậu"""
    # Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu, '#' đại diện cho ô trống
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Ghi lại xem cột này đã có quân hậu hay chưa
    diags1 = [False] * (2 * n - 1)  # Ghi lại xem đường chéo chính này đã có quân hậu hay chưa
    diags2 = [False] * (2 * n - 1)  # Ghi lại xem đường chéo phụ này đã có quân hậu hay chưa
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Input chessboard size is {n}")
    print(f"There are {len(res)} queen placement solutions")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
