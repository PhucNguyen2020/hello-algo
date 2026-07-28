/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Leo cầu thang: Quy hoạch động */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    vector<int> dp(n + 1);
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = 1;
    dp[2] = 2;
    // Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Leo cầu thang: Quy hoạch động tối ưu không gian */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    res = climbingStairsDPComp(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    return 0;
}
