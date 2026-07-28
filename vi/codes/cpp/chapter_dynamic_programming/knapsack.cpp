#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* Bài toán cái túi 0-1: Tìm kiếm vét cạn */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // Nếu đã chọn hết các vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Nếu vượt quá dung lượng túi, chỉ có thể chọn không bỏ vào
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Tính giá trị lớn nhất giữa việc không bỏ và bỏ vật phẩm i vào túi
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Trả về giá trị lớn hơn trong hai lựa chọn
    return max(no, yes);
}

/* Bài toán cái túi 0-1: Tìm kiếm ghi nhớ */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // Nếu đã chọn hết các vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Nếu đã có bản ghi, trả về trực tiếp
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // Nếu vượt quá dung lượng túi, chỉ có thể chọn không bỏ vào
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Tính giá trị lớn nhất giữa việc không bỏ và bỏ vật phẩm i vào túi
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Ghi lại và trả về giá trị lớn hơn trong hai lựa chọn
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* Bài toán cái túi 0-1: Quy hoạch động */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Khởi tạo bảng dp
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // Chuyển trạng thái
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Nếu vượt quá dung lượng túi, không chọn vật phẩm i
                dp[i][c] = dp[i - 1][c];
            } else {
                // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Bài toán cái túi 0-1: Quy hoạch động tối ưu không gian */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Khởi tạo bảng dp
    vector<int> dp(cap + 1, 0);
    // Chuyển trạng thái
    for (int i = 1; i <= n; i++) {
        // Duyệt theo thứ tự ngược lại
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // Tìm kiếm vét cạn
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "Maximum item value not exceeding knapsack capacity is " << res << endl;

    // Tìm kiếm ghi nhớ
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "Maximum item value not exceeding knapsack capacity is " << res << endl;

    // Quy hoạch động
    res = knapsackDP(wgt, val, cap);
    cout << "Maximum item value not exceeding knapsack capacity is " << res << endl;

    // Quy hoạch động tối ưu không gian
    res = knapsackDPComp(wgt, val, cap);
    cout << "Maximum item value not exceeding knapsack capacity is " << res << endl;

    return 0;
}
