/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Tìm kiếm */
fun dfs(i: Int): Int {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* Leo cầu thang: Tìm kiếm */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* Đoạn mã driver */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("Climbing $n stairs has $res solutions")
}