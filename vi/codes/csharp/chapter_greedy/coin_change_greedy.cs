/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* Đổi tiền xu: Giải thuật tham lam */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Giả sử danh sách đồng xu đã được sắp xếp
        int i = coins.Length - 1;
        int count = 0;
        // Lặp để đưa ra lựa chọn tham lam cho đến khi không còn số tiền dư
        while (amt > 0) {
            // Tìm đồng xu nhỏ hơn và gần nhất với số tiền còn lại
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Chọn coins[i]
            amt -= coins[i];
            count++;
        }
        // Nếu không tìm được lời giải khả thi, trả về -1
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // Giải thuật tham lam: Có thể đảm bảo tìm được lời giải tối ưu toàn cục
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);

        // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);
        Console.WriteLine("Actually the minimum number needed is 3, i.e., 20 + 20 + 20");

        // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);
        Console.WriteLine("Actually the minimum number needed is 2, i.e., 49 + 49");
    }
}