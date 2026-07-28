/**
 * File: insertion_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sắp xếp chèn */
void insertionSort(vector<int> &nums) {
    // Vòng lặp ngoài: khoảng đã sắp xếp là [0, i-1]
    for (int i = 1; i < nums.size(); i++) {
        int base = nums[i], j = i - 1;
        // Vòng lặp trong: chèn base vào đúng vị trí trong khoảng đã sắp xếp [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // Dịch nums[j] sang phải một vị trí
            j--;
        }
        nums[j + 1] = base; // Gán base vào đúng vị trí
    }
}

/* Mã chạy chương trình */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    insertionSort(nums);
    cout << "After insertion sort completes, nums = ";
    printVector(nums);

    return 0;
}
