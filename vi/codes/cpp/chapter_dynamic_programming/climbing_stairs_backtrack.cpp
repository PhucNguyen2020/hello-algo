
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Quay lui */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
    if (state == n)
        res[0]++;
    // Duyệt qua tất cả các lựa chọn
    for (auto &choice : choices) {
        // Cắt tỉa: không được phép vượt quá bậc thang thứ n
        if (state + choice > n)
            continue;
        // Thử: đưa ra lựa chọn, cập nhật trạng thái
        backtrack(choices, state + choice, n, res);
        // Quay lui
    }
}

/* Leo cầu thang: Quay lui */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Có thể chọn leo lên 1 hoặc 2 bậc
    int state = 0;                // Bắt đầu leo từ bậc thang thứ 0
    vector<int> res = {0};        // Dùng res[0] để ghi lại số lời giải
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    return 0;
}
