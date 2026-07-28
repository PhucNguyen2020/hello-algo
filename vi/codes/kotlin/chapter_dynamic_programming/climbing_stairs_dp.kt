/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Leo cầu thang: Quy hoạch động */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    val dp = IntArray(n + 1)
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = 1
    dp[2] = 2
    // Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Leo cầu thang: Quy hoạch động tối ưu không gian */
fun climbingStairsDPComp(n: Int): Int {
    if (n == 1 || n == 2) return n
    var a = 1
    var b = 2
    for (i in 3..n) {
        val temp = b
        b += a
        a = temp
    }
    return b
}

/* Đoạn mã driver */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("Climbing $n stairs has $res solutions")

    res = climbingStairsDPComp(n)
    println("Climbing $n stairs has $res solutions")
}