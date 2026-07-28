/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Đổi tiền xu: Quy hoạch động */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Khởi tạo bảng dp
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Đổi tiền xu: Quy hoạch động tối ưu không gian */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Khởi tạo bảng dp
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // Chuyển trạng thái
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[a] = dp[a];
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // Quy hoạch động
    int res = coinChangeDP(coins, amt);
    cout << "Minimum number of coins needed to make target amount is " << res << endl;

    // Quy hoạch động tối ưu không gian
    res = coinChangeDPComp(coins, amt);
    cout << "Minimum number of coins needed to make target amount is " << res << endl;

    return 0;
}
