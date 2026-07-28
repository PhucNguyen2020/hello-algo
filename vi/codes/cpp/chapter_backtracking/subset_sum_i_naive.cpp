/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Bài toán tổng tập con I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các lựa chọn
    for (size_t i = 0; i < choices.size(); i++) {
        // Cắt tỉa: nếu tổng của tập con vượt quá target, bỏ qua lựa chọn này
        if (total + choices[i] > target) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
        state.push_back(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
        state.pop_back();
    }
}

/* Giải bài toán tổng tập con I (bao gồm cả các tập con trùng lặp) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // Trạng thái (tập con)
    int total = 0;           // Tổng của tập con
    vector<vector<int>> res; // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets with sum equal to " << target << " are res = " << endl;
    printVectorMatrix(res);

    return 0;
}
