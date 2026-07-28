/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Phương pháp 1: Duyệt vét cạn */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // Hai vòng lặp lồng nhau, độ phức tạp thời gian là O(n^2)
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* Phương pháp 2: Bảng băm hỗ trợ */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // Bảng băm hỗ trợ, độ phức tạp không gian là O(n)
    unordered_map<int, int> dic;
    // Một vòng lặp, độ phức tạp thời gian là O(n)
    for (int i = 0; i < size; i++) {
        if (dic.find(target - nums[i]) != dic.end()) {
            return {dic[target - nums[i]], i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* Mã chạy chương trình */
int main() {
    // ======= Trường hợp kiểm thử =======
    vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // ====== Mã chạy chương trình ======
    // Phương pháp 1
    vector<int> res = twoSumBruteForce(nums, target);
    cout << "Method 1 res = ";
    printVector(res);
    // Phương pháp 2
    res = twoSumHashTable(nums, target);
    cout << "Method 2 res = ";
    printVector(res);

    return 0;
}
