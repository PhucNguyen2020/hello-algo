/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Hoán vị I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Khi độ dài trạng thái bằng số phần tử, ghi lại lời giải
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các lựa chọn
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
        if (!selected[i]) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            selected[i] = true;
            state.push_back(choice);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, choices, selected, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* Hoán vị I */
vector<vector<int>> permutationsI(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    vector<int> nums = {1, 2, 3};

    vector<vector<int>> res = permutationsI(nums);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "All permutations res = ";
    printVectorMatrix(res);

    return 0;
}
