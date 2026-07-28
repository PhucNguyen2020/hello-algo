/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sinh một mảng gồm các phần tử { 1, 2, ..., n }, thứ tự đã bị xáo trộn */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Sinh mảng nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Dùng thời gian hệ thống để sinh hạt giống ngẫu nhiên
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Xáo trộn ngẫu nhiên các phần tử của mảng
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Tìm chỉ số của số 1 trong mảng nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // Khi phần tử 1 nằm ở đầu mảng, đạt độ phức tạp thời gian tốt nhất O(1)
        // Khi phần tử 1 nằm ở cuối mảng, đạt độ phức tạp thời gian xấu nhất O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\nArray [ 1, 2, ..., n ] after shuffling = ";
        printVector(nums);
        cout << "Index of number 1 is " << index << endl;
    }
    return 0;
}
