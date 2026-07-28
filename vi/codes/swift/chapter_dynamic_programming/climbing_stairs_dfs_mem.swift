/**
 * File: climbing_stairs_dfs_mem.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tìm kiếm có ghi nhớ (memoization) */
func dfs(i: Int, mem: inout [Int]) -> Int {
    // Đã biết dp[1] và dp[2], trả về chúng
    if i == 1 || i == 2 {
        return i
    }
    // Nếu đã có bản ghi dp[i], trả về ngay
    if mem[i] != -1 {
        return mem[i]
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
    // Ghi lại dp[i]
    mem[i] = count
    return count
}

/* Leo cầu thang: tìm kiếm có ghi nhớ */
func climbingStairsDFSMem(n: Int) -> Int {
    // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
    var mem = Array(repeating: -1, count: n + 1)
    return dfs(i: n, mem: &mem)
}

@main
enum ClimbingStairsDFSMem {
    /* Mã điều khiển */
    static func main() {
        let n = 9

        let res = climbingStairsDFSMem(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
