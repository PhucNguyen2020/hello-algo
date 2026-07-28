/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Leo cầu thang có ràng buộc: Quy hoạch động */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    val dp = Array(n + 1) { IntArray(3) }
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (i in 3..n) {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

/* Đoạn mã driver */
fun main() {
    val n = 9

    val res = climbingStairsConstraintDP(n)
    println("Climbing $n stairs has $res solutions")
}