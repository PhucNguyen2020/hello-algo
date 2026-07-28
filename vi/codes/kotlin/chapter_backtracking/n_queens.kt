/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Giải thuật quay lui: bài toán N quân hậu */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // Khi đã đặt hết các hàng, ghi lại lời giải
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // Duyệt qua tất cả các cột
    for (col in 0..<n) {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Thử: đặt quân hậu vào ô này
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Đặt tiếp hàng kế tiếp
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Quay lui: khôi phục ô này thành ô trống
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Giải bài toán N quân hậu */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Ghi lại xem cột này đã có quân hậu hay chưa
    val diags1 = BooleanArray(2 * n - 1) // Ghi lại xem đường chéo chính này đã có quân hậu hay chưa
    val diags2 = BooleanArray(2 * n - 1) // Ghi lại xem đường chéo phụ này đã có quân hậu hay chưa
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Đoạn mã điều khiển */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Input board size is $n")
    println("Total queen placement solutions: ${res.size}")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}
