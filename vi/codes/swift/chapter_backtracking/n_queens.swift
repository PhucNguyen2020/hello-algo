/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Giải thuật quay lui: N quân hậu */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // Khi tất cả các hàng đã được đặt xong, ghi lại lời giải
    if row == n {
        res.append(state)
        return
    }
    // Duyệt tất cả các cột
    for col in 0 ..< n {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Đặt tiếp hàng kế tiếp
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Quay lui: khôi phục ô này về trạng thái trống
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Giải bài toán N quân hậu */
func nQueens(n: Int) -> [[[String]]] {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Ghi nhận cột nào đang có quân hậu
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Ghi nhận đường chéo chính nào đang có quân hậu
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Ghi nhận đường chéo phụ nào đang có quân hậu
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* Mã điều khiển */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("Input board size is \(n)")
        print("Total queen placement solutions: \(res.count)")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
