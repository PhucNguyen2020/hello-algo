/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm nhị phân (khoảng đóng cả hai đầu) */
int binarySearch(vector<int> &nums, int target) {
    // Khởi tạo khoảng đóng [0, n-1], tức là i, j trỏ đến phần tử đầu tiên và cuối cùng của mảng
    int i = 0, j = nums.size() - 1;
    // Vòng lặp, thoát khi khoảng tìm kiếm rỗng (rỗng khi i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Tính chỉ số điểm giữa m
        if (nums[m] < target)    // Điều này có nghĩa là target nằm trong khoảng [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // Điều này có nghĩa là target nằm trong khoảng [i, m-1]
            j = m - 1;
        else // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
            return m;
    }
    // Không tìm thấy phần tử mục tiêu, trả về -1
    return -1;
}

/* Tìm kiếm nhị phân (khoảng đóng trái, mở phải) */
int binarySearchLCRO(vector<int> &nums, int target) {
    // Khởi tạo khoảng đóng trái, mở phải [0, n), tức là i, j trỏ đến phần tử đầu tiên và (phần tử cuối cùng + 1)
    int i = 0, j = nums.size();
    // Vòng lặp, thoát khi khoảng tìm kiếm rỗng (rỗng khi i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Tính chỉ số điểm giữa m
        if (nums[m] < target)    // Điều này có nghĩa là target nằm trong khoảng [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // Điều này có nghĩa là target nằm trong khoảng [i, m)
            j = m;
        else // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
            return m;
    }
    // Không tìm thấy phần tử mục tiêu, trả về -1
    return -1;
}

/* Mã chạy chương trình */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Tìm kiếm nhị phân (khoảng đóng cả hai đầu) */
    int index = binarySearch(nums, target);
    cout << "Index of target element 6 = " << index << endl;

    /* Tìm kiếm nhị phân (khoảng đóng trái, mở phải) */
    index = binarySearchLCRO(nums, target);
    cout << "Index of target element 6 = " << index << endl;

    return 0;
}
