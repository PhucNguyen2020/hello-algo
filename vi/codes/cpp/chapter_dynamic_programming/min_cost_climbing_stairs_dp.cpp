/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Chi phí tối thiểu để leo cầu thang: Quy hoạch động */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    vector<int> dp(n + 1);
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Chi phí tối thiểu để leo cầu thang: Quy hoạch động tối ưu không gian */
int minCostClimbingStairsDPComp(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "Input stair cost list is ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "Minimum cost to climb stairs is " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "Minimum cost to climb stairs is " << res << endl;

    return 0;
}
