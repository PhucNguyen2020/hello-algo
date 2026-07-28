/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Đổi tiền xu: Giải thuật tham lam */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Giả sử danh sách coins đã được sắp xếp
    int i = coins.size() - 1;
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

/* Driver Code */
int main() {
    // Giải thuật tham lam: Có thể đảm bảo tìm được lời giải tối ưu toàn cục
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;

    // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;
    cout << "Actually the minimum number needed is 3, i.e., 20 + 20 + 20" << endl;

    // Giải thuật tham lam: Không thể đảm bảo tìm được lời giải tối ưu toàn cục
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;
    cout << "Actually the minimum number needed is 2, i.e., 49 + 49" << endl;

    return 0;
}
