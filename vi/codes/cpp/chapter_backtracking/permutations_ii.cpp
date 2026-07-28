/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Hoán vị II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Khi độ dài trạng thái bằng số phần tử, ghi lại lời giải
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các lựa chọn
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử bằng nhau
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated.emplace(choice); // Ghi lại giá trị phần tử đã chọn
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

/* Hoán vị II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "All permutations res = ";
    printVectorMatrix(res);

    return 0;
}
