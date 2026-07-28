/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm nhị phân điểm chèn (không có phần tử trùng lặp) */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Khởi tạo khoảng đóng [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Tính chỉ số điểm giữa m
        if (nums[m] < target) {
            i = m + 1; // target nằm trong khoảng [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target nằm trong khoảng [i, m-1]
        } else {
            return m; // Tìm thấy target, trả về điểm chèn m
        }
    }
    // Không tìm thấy target, trả về điểm chèn i
    return i;
}

/* Tìm kiếm nhị phân điểm chèn (có phần tử trùng lặp) */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Khởi tạo khoảng đóng [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Tính chỉ số điểm giữa m
        if (nums[m] < target) {
            i = m + 1; // target nằm trong khoảng [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target nằm trong khoảng [i, m-1]
        } else {
            j = m - 1; // Phần tử nhỏ hơn target đầu tiên nằm trong khoảng [i, m-1]
        }
    }
    // Trả về điểm chèn i
    return i;
}

/* Mã chạy chương trình */
int main() {
    // Mảng không có phần tử trùng lặp
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\nArray nums = ";
    printVector(nums);
    // Tìm kiếm nhị phân điểm chèn
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "Insertion point index for element " << target << " is " << index << endl;
    }

    // Mảng có phần tử trùng lặp
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);
    // Tìm kiếm nhị phân điểm chèn
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "Insertion point index for element " << target << " is " << index << endl;
    }

    return 0;
}
