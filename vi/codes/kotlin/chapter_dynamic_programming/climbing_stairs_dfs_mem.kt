/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Tìm kiếm có nhớ */
fun dfs(i: Int, mem: IntArray): Int {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i == 1 || i == 2) return i
    // Nếu đã có bản ghi dp[i], trả về ngay
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // Lưu lại dp[i]
    mem[i] = count
    return count
}

/* Leo cầu thang: Tìm kiếm có nhớ */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] lưu tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Đoạn mã driver */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("Climbing $n stairs has $res solutions")
}