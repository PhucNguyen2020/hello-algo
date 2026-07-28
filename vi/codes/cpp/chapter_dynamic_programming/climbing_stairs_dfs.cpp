/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm */
int dfs(int i) {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Leo cầu thang: Tìm kiếm */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    return 0;
}
