/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Mã chạy chính (Driver Code) */
int main() {
    /* Khởi tạo danh sách (list) */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "List nums = ";
    printVector(nums);

    /* Truy cập phần tử */
    int num = nums[1];
    cout << "Access element at index 1, get num = " << num << endl;

    /* Cập nhật phần tử */
    nums[1] = 0;
    cout << "Update element at index 1 to 0, resulting in nums = ";
    printVector(nums);

    /* Xóa toàn bộ phần tử */
    nums.clear();
    cout << "After clearing list, nums = ";
    printVector(nums);

    /* Thêm phần tử vào cuối danh sách */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "After adding elements, nums = ";
    printVector(nums);

    /* Chèn phần tử vào giữa danh sách */
    nums.insert(nums.begin() + 3, 6);
    cout << "Insert number 6 at index 3, resulting in nums = ";
    printVector(nums);

    /* Xóa phần tử */
    nums.erase(nums.begin() + 3);
    cout << "Remove element at index 3, resulting in nums = ";
    printVector(nums);

    /* Duyệt danh sách theo chỉ số */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* Duyệt trực tiếp các phần tử của danh sách */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* Nối hai danh sách */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "Concatenate list nums1 to nums, resulting in nums = ";
    printVector(nums);

    /* Sắp xếp danh sách */
    sort(nums.begin(), nums.end());
    cout << "After sorting list, nums = ";
    printVector(nums);

    return 0;
}
