/**
 * File: subset_sum_ii.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Giải thuật quay lui: Bài toán tổng tập con II */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Duyệt tất cả các lựa chọn
    // Cắt tỉa 2: duyệt bắt đầu từ start để tránh sinh ra các tập con trùng lặp
    // Cắt tỉa 3: duyệt bắt đầu từ start để tránh chọn lại cùng một phần tử
    for (int i = start; i < choices.size(); i++) {
        // Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay
        // Vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if (target - choices[i] < 0) {
            break;
        }
        // Cắt tỉa 4: nếu phần tử này bằng phần tử bên trái, nghĩa là nhánh tìm kiếm này bị trùng lặp, bỏ qua ngay
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.push_back(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
        state.pop_back();
    }
}

/* Giải bài toán tổng tập con II */
vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
    vector<int> state;              // Trạng thái (tập con)
    sort(nums.begin(), nums.end()); // Sắp xếp nums
    int start = 0;                  // Điểm bắt đầu duyệt
    vector<vector<int>> res;        // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Mã chạy chính (Driver Code) */
int main() {
    vector<int> nums = {4, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumII(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets with sum equal to " << target << " are res = " << endl;
    printVectorMatrix(res);

    return 0;
}
