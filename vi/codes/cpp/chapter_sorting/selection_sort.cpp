/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sắp xếp chọn */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // Vòng lặp trong: tìm phần tử nhỏ nhất trong khoảng chưa sắp xếp
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // Ghi lại chỉ số của phần tử nhỏ nhất
        }
        // Hoán đổi phần tử nhỏ nhất với phần tử đầu tiên của khoảng chưa sắp xếp
        swap(nums[i], nums[k]);
    }
}

/* Mã chạy chương trình */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "After selection sort completes, nums = ";
    printVector(nums);

    return 0;
}
