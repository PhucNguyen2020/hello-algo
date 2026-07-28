/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Đổi tiền xu II: Quy hoạch động */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // Khởi tạo bảng dp
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Khởi tạo cột đầu tiên
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // Chuyển trạng thái
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Đổi tiền xu II: Quy hoạch động tối ưu không gian */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // Khởi tạo bảng dp
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // Chuyển trạng thái
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[a] = dp[a];
            } else {
                // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // Quy hoạch động
    int res = coinChangeIIDP(coins, amt);
    cout << "Number of coin combinations to make target amount is " << res << endl;

    // Quy hoạch động tối ưu không gian
    res = coinChangeIIDPComp(coins, amt);
    cout << "Number of coin combinations to make target amount is " << res << endl;

    return 0;
}
