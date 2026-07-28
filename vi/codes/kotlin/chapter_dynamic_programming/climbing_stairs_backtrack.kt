/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Quay lui */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // Khi leo đến bậc thang thứ n, tăng số lời giải lên 1
    if (state == n)
        res[0] = res[0] + 1
    // Duyệt qua tất cả các lựa chọn
    for (choice in choices) {
        // Cắt tỉa: không được phép vượt quá bậc thang thứ n
        if (state + choice > n) continue
        // Thử: thực hiện lựa chọn, cập nhật trạng thái
        backtrack(choices, state + choice, n, res)
        // Quay lui
    }
}

/* Leo cầu thang: Quay lui */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Có thể chọn leo 1 hoặc 2 bậc
    val state = 0 // Bắt đầu leo từ bậc thang thứ 0
    val res = mutableListOf<Int>()
    res.add(0) // Dùng res[0] để lưu số lời giải
    backtrack(choices, state, n, res)
    return res[0]
}

/* Đoạn mã driver */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("Climbing $n stairs has $res solutions")
}