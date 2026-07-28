/**
 * File: min_path_sum.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tổng đường đi nhỏ nhất: Tìm kiếm vét cạn */
int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
    // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Nếu chỉ số hàng hoặc cột vượt phạm vi, trả về chi phí +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Tính chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i-1, j) và (i, j-1)
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // Trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* Tổng đường đi nhỏ nhất: Tìm kiếm ghi nhớ */
int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
    // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Nếu chỉ số hàng hoặc cột vượt phạm vi, trả về chi phí +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Nếu đã có bản ghi, trả về trực tiếp
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Chi phí đường đi nhỏ nhất của ô bên trái và ô phía trên
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Ghi lại và trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Tổng đường đi nhỏ nhất: Quy hoạch động */
int minPathSumDP(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Khởi tạo bảng dp
    vector<vector<int>> dp(n, vector<int>(m));
    dp[0][0] = grid[0][0];
    // Chuyển trạng thái: hàng đầu tiên
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Chuyển trạng thái: cột đầu tiên
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Tổng đường đi nhỏ nhất: Quy hoạch động tối ưu không gian */
int minPathSumDPComp(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Khởi tạo bảng dp
    vector<int> dp(m);
    // Chuyển trạng thái: hàng đầu tiên
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Chuyển trạng thái: các hàng còn lại
    for (int i = 1; i < n; i++) {
        // Chuyển trạng thái: cột đầu tiên
        dp[0] = dp[0] + grid[i][0];
        // Chuyển trạng thái: các cột còn lại
        for (int j = 1; j < m; j++) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
int main() {
    vector<vector<int>> grid = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = grid.size(), m = grid[0].size();

    // Tìm kiếm vét cạn
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "Minimum path sum from top-left to bottom-right is " << res << endl;

    // Tìm kiếm ghi nhớ
    vector<vector<int>> mem(n, vector<int>(m, -1));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    cout << "Minimum path sum from top-left to bottom-right is " << res << endl;

    // Quy hoạch động
    res = minPathSumDP(grid);
    cout << "Minimum path sum from top-left to bottom-right is " << res << endl;

    // Quy hoạch động tối ưu không gian
    res = minPathSumDPComp(grid);
    cout << "Minimum path sum from top-left to bottom-right is " << res << endl;

    return 0;
}
