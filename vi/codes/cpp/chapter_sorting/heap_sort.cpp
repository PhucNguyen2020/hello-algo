/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Độ dài heap là n, bắt đầu heap hóa nút i, từ trên xuống dưới */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // Nếu nút i là lớn nhất hoặc chỉ số l, r vượt quá giới hạn, không cần tiếp tục heap hóa, thoát vòng lặp
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Hoán đổi hai nút
        if (ma == i) {
            break;
        }
        // Hoán đổi hai nút
        swap(nums[i], nums[ma]);
        // Vòng lặp heap hóa xuống dưới
        i = ma;
    }
}

/* Sắp xếp vun đống (heap sort) */
void heapSort(vector<int> &nums) {
    // Thao tác xây dựng heap: heap hóa tất cả các nút trừ nút lá
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Trích xuất phần tử lớn nhất trong heap và lặp lại n-1 vòng
    for (int i = nums.size() - 1; i > 0; --i) {
        // Xóa nút
        swap(nums[0], nums[i]);
        // Bắt đầu heap hóa nút gốc, từ trên xuống dưới
        siftDown(nums, i, 0);
    }
}

/* Mã chạy chương trình */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "After heap sort completes, nums = ";
    printVector(nums);

    return 0;
}
