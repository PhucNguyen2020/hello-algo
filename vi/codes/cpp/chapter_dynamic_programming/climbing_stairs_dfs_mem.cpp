/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm ghi nhớ */
int dfs(int i, vector<int> &mem) {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i == 1 || i == 2)
        return i;
    // Nếu đã có bản ghi dp[i], trả về trực tiếp
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Ghi lại dp[i]
    mem[i] = count;
    return count;
}

/* Leo cầu thang: Tìm kiếm ghi nhớ */
int climbingStairsDFSMem(int n) {
    // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    return 0;
}
