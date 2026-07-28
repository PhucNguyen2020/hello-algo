/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Đổi tiền xu: quy hoạch động */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Khởi tạo bảng dp
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* Đổi tiền xu: quy hoạch động tối ưu không gian */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Khởi tạo bảng dp
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // Chuyển trạng thái
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[a] = dp[a]
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* Mã điều khiển */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // Quy hoạch động
        var res = coinChangeDP(coins: coins, amt: amt)
        print("Minimum coins needed to make target amount is \(res)")

        // Quy hoạch động tối ưu không gian
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("Minimum coins needed to make target amount is \(res)")
    }
}
