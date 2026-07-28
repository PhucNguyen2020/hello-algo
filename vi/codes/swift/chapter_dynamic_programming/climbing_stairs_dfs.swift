/**
 * File: climbing_stairs_dfs.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tìm kiếm */
func dfs(i: Int) -> Int {
    // Đã biết dp[1] và dp[2], trả về chúng
    if i == 1 || i == 2 {
        return i
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1) + dfs(i: i - 2)
    return count
}

/* Leo cầu thang: tìm kiếm */
func climbingStairsDFS(n: Int) -> Int {
    dfs(i: n)
}

@main
enum ClimbingStairsDFS {
    /* Mã điều khiển */
    static func main() {
        let n = 9

        let res = climbingStairsDFS(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
