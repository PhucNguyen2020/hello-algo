/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sắp xếp nổi bọt */
void bubbleSort(vector<int> &nums) {
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // Vòng lặp trong: đưa phần tử lớn nhất trong khoảng chưa sắp xếp [0, i] về cuối bên phải của khoảng đó
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Hoán đổi nums[j] và nums[j + 1]
                // Sử dụng hàm std::swap() ở đây
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* Sắp xếp nổi bọt (tối ưu bằng cờ hiệu)*/
void bubbleSortWithFlag(vector<int> &nums) {
    // Vòng lặp ngoài: khoảng chưa sắp xếp là [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // Khởi tạo cờ hiệu
        // Vòng lặp trong: đưa phần tử lớn nhất trong khoảng chưa sắp xếp [0, i] về cuối bên phải của khoảng đó
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Hoán đổi nums[j] và nums[j + 1]
                // Sử dụng hàm std::swap() ở đây
                swap(nums[j], nums[j + 1]);
                flag = true; // Ghi nhận đã có hoán đổi phần tử
            }
        }
        if (!flag)
            break; // Vòng "nổi bọt" này không có phần tử nào được hoán đổi, thoát trực tiếp
    }
}

/* Mã chạy chương trình */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "After bubble sort completes, nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "After bubble sort completes, nums1 = ";
    printVector(nums1);

    return 0;
}
