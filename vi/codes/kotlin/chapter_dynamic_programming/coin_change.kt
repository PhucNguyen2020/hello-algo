/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Đổi tiền xu: Quy hoạch động */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Khởi tạo bảng dp
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* Đổi tiền xu: Quy hoạch động tối ưu không gian */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Khởi tạo bảng dp
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // Chuyển trạng thái
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[a] = dp[a]
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* Đoạn mã driver */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // Quy hoạch động
    var res = coinChangeDP(coins, amt)
    println("Minimum coins needed to make target amount is $res")

    // Quy hoạch động tối ưu không gian
    res = coinChangeDPComp(coins, amt)
    println("Minimum coins needed to make target amount is $res")
}