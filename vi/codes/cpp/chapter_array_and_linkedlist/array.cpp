/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Truy cập ngẫu nhiên vào một phần tử */
int randomAccess(int *nums, int size) {
    // Chọn ngẫu nhiên một số trong khoảng [0, size)
    int randomIndex = rand() % size;
    // Lấy và trả về phần tử ngẫu nhiên
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Mở rộng độ dài mảng */
int *extend(int *nums, int size, int enlarge) {
    // Khởi tạo một mảng có độ dài đã được mở rộng
    int *res = new int[size + enlarge];
    // Sao chép tất cả các phần tử từ mảng gốc sang mảng mới
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Giải phóng bộ nhớ
    delete[] nums;
    // Trả về mảng mới đã được mở rộng
    return res;
}

/* Chèn phần tử num vào vị trí index trong mảng */
void insert(int *nums, int size, int num, int index) {
    // Dịch tất cả các phần tử từ vị trí index trở về sau lùi lại một vị trí
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Gán num cho phần tử tại vị trí index
    nums[index] = num;
}

/* Xóa phần tử tại vị trí index */
void remove(int *nums, int size, int index) {
    // Dịch tất cả các phần tử sau vị trí index tiến lên một vị trí
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Duyệt mảng */
void traverse(int *nums, int size) {
    int count = 0;
    // Duyệt mảng theo chỉ số
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* Tìm phần tử được chỉ định trong mảng */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Mã chạy chính (Driver Code) */
int main() {
    /* Khởi tạo mảng */
    int size = 5;
    int *arr = new int[size];
    cout << "Array arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Array nums = ";
    printArray(nums, size);

    /* Truy cập ngẫu nhiên */
    int randomNum = randomAccess(nums, size);
    cout << "Get random element in nums " << randomNum << endl;

    /* Mở rộng độ dài mảng */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "Extend array length to 8, resulting in nums = ";
    printArray(nums, size);

    /* Chèn phần tử */
    insert(nums, size, 6, 3);
    cout << "Insert number 6 at index 3, resulting in nums = ";
    printArray(nums, size);

    /* Xóa phần tử */
    remove(nums, size, 2);
    cout << "Remove element at index 2, resulting in nums = ";
    printArray(nums, size);

    /* Duyệt mảng */
    traverse(nums, size);

    /* Tìm phần tử */
    int index = find(nums, size, 3);
    cout << "Find element 3 in nums, get index = " << index << endl;

    // Giải phóng bộ nhớ
    delete[] arr;
    delete[] nums;

    return 0;
}
