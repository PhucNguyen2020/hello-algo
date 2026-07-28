/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Leo cầu thang có ràng buộc: quy hoạch động */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for i in 3 ... n {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

@main
enum ClimbingStairsConstraintDP {
    /* Mã điều khiển */
    static func main() {
        let n = 9

        let res = climbingStairsConstraintDP(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
