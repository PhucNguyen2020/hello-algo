/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm nhị phân điểm chèn (có phần tử trùng lặp) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Khởi tạo khoảng đóng [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Tính chỉ số điểm giữa m
        if (nums[m] < target) {
            i = m + 1; // target nằm trong khoảng [m+1, j]
        } else {
            j = m - 1; // Phần tử nhỏ hơn target đầu tiên nằm trong khoảng [i, m-1]
        }
    }
    // Trả về điểm chèn i
    return i;
}

/* Tìm kiếm nhị phân biên trái của target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // Tương đương với việc tìm điểm chèn của target
    int i = binarySearchInsertion(nums, target);
    // Không tìm thấy target, trả về -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Tìm thấy target, trả về chỉ số i
    return i;
}

/* Tìm kiếm nhị phân biên phải của target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Chuyển thành tìm biên trái của target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j trỏ đến target ở biên phải, i trỏ đến phần tử lớn hơn target đầu tiên
    int j = i - 1;
    // Không tìm thấy target, trả về -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Tìm thấy target, trả về chỉ số j
    return j;
}

/* Mã chạy chương trình */
int main() {
    // Mảng có phần tử trùng lặp
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);

    // Tìm kiếm nhị phân biên trái và biên phải
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "Index of leftmost element " << target << " is " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "Index of rightmost element " << target << " is " << index << endl;
    }

    return 0;
}
