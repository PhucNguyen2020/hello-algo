/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Leo cầu thang: quy hoạch động */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    var dp = Array(repeating: 0, count: n + 1)
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = 1
    dp[2] = 2
    // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Leo cầu thang: quy hoạch động tối ưu không gian */
func climbingStairsDPComp(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var a = 1
    var b = 2
    for _ in 3 ... n {
        (a, b) = (b, a + b)
    }
    return b
}

@main
enum ClimbingStairsDP {
    /* Mã điều khiển */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("Climbing \(n) stairs has \(res) solutions")

        res = climbingStairsDPComp(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
