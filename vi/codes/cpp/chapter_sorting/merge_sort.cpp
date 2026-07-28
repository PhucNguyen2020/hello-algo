/**
 * File: merge_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Gộp mảng con trái và mảng con phải */
void merge(vector<int> &nums, int left, int mid, int right) {
    // Khoảng mảng con trái là [left, mid], khoảng mảng con phải là [mid+1, right]
    // Tạo mảng tạm tmp để lưu kết quả gộp
    vector<int> tmp(right - left + 1);
    // Khởi tạo chỉ số bắt đầu của mảng con trái và phải
    int i = left, j = mid + 1, k = 0;
    // Khi cả hai mảng con vẫn còn phần tử, so sánh và sao chép phần tử nhỏ hơn vào mảng tạm
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++];
        else
            tmp[k++] = nums[j++];
    }
    // Sao chép các phần tử còn lại của mảng con trái và phải vào mảng tạm
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Sao chép các phần tử từ mảng tạm tmp trở lại mảng gốc nums tại khoảng tương ứng
    for (k = 0; k < tmp.size(); k++) {
        nums[left + k] = tmp[k];
    }
}

/* Sắp xếp trộn */
void mergeSort(vector<int> &nums, int left, int right) {
    // Điều kiện dừng
    if (left >= right)
        return; // Kết thúc đệ quy khi độ dài mảng con là 1
    // Giai đoạn chia để trị
    int mid = left + (right - left) / 2;    // Tính điểm giữa
    mergeSort(nums, left, mid);      // Xử lý đệ quy mảng con bên trái
    mergeSort(nums, mid + 1, right); // Xử lý đệ quy mảng con bên phải
    // Giai đoạn gộp
    merge(nums, left, mid, right);
}

/* Mã chạy chương trình */
int main() {
    /* Sắp xếp trộn */
    vector<int> nums = {7, 3, 2, 6, 0, 1, 5, 4};
    mergeSort(nums, 0, nums.size() - 1);
    cout << "After merge sort completes, nums = ";
    printVector(nums);

    return 0;
}
