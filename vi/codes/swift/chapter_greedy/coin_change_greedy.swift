/**
 * File: coin_change_greedy.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Đổi tiền: Giải thuật tham lam */
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // Giả sử danh sách coins đã được sắp xếp
    var i = coins.count - 1
    var count = 0
    var amt = amt
    // Lặp để đưa ra lựa chọn tham lam cho đến khi không còn số tiền cần đổi
    while amt > 0 {
        // Tìm đồng xu nhỏ hơn và gần nhất với số tiền còn lại
        while i > 0 && coins[i] > amt {
            i -= 1
        }
        // Chọn coins[i]
        amt -= coins[i]
        count += 1
    }
    // Nếu không tìm được lời giải khả thi, trả về -1
    return amt == 0 ? count : -1
}

@main
enum CoinChangeGreedy {
    /* Mã điều khiển */
    static func main() {
        // Giải thuật tham lam: Có thể đảm bảo tìm được lời giải tối ưu toàn cục
        var coins = [1, 5, 10, 20, 50, 100]
        var amt = 186
        var res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum coins needed to make \(amt) is \(res)")

        // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
        coins = [1, 20, 50]
        amt = 60
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum coins needed to make \(amt) is \(res)")
        print("Actually the minimum number needed is 3, i.e., 20 + 20 + 20")

        // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
        coins = [1, 49, 50]
        amt = 98
        res = coinChangeGreedy(coins: coins, amt: amt)
        print("\ncoins = \(coins), amount = \(amt)")
        print("Minimum coins needed to make \(amt) is \(res)")
        print("Actually the minimum number needed is 2, i.e., 49 + 49")
    }
}
