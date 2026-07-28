/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Bài toán tổng tập con I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các lựa chọn
    // Cắt tỉa 2: duyệt bắt đầu từ start để tránh sinh ra các tập con trùng lặp
    for (int i = start; i < choices.size(); i++) {
        // Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay
        // Vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if (target - choices[i] < 0) {
            break;
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.push_back(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
        state.pop_back();
    }
}

/* Giải bài toán tổng tập con I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // Trạng thái (tập con)
    sort(nums.begin(), nums.end()); // Sắp xếp nums
    int start = 0;                  // Điểm bắt đầu duyệt
    vector<vector<int>> res;        // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets with sum equal to " << target << " are res = " << endl;
    printVectorMatrix(res);

    return 0;
}
