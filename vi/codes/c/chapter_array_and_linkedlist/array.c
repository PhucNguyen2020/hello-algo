/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Truy cập ngẫu nhiên vào một phần tử */
int randomAccess(int *nums, int size) {
    // Chọn ngẫu nhiên một số trong khoảng [0, size)
    int randomIndex = rand() % size;
    // Lấy và trả về phần tử ngẫu nhiên đó
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Mở rộng độ dài mảng */
int *extend(int *nums, int size, int enlarge) {
    // Khởi tạo một mảng có độ dài đã mở rộng
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Sao chép toàn bộ phần tử từ mảng gốc sang mảng mới
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Khởi tạo phần không gian mở rộng
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // Trả về mảng mới đã được mở rộng
    return res;
}

/* Chèn phần tử num vào vị trí có chỉ số index trong mảng */
void insert(int *nums, int size, int num, int index) {
    // Dịch tất cả các phần tử từ vị trí index trở về sau lùi lại một vị trí
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Gán num cho phần tử tại vị trí index
    nums[index] = num;
}

/* Xóa phần tử tại vị trí index */
// Lưu ý: stdio.h đã chiếm từ khóa remove
void removeItem(int *nums, int size, int index) {
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

/* Đoạn mã điều khiển chính */
int main() {
    /* Khởi tạo mảng */
    int size = 5;
    int arr[5];
    printf("Array arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Array nums = ");
    printArray(nums, size);

    /* Chèn phần tử */
    int randomNum = randomAccess(nums, size);
    printf("Get random element %d from nums", randomNum);

    /* Duyệt mảng */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("Extend array length to 8, resulting in nums = ");
    printArray(res, size);

    /* Chèn phần tử */
    insert(res, size, 6, 3);
    printf("Insert number 6 at index 3, resulting in nums = ");
    printArray(res, size);

    /* Xóa phần tử */
    removeItem(res, size, 2);
    printf("Remove element at index 2, resulting in nums = ");
    printArray(res, size);

    /* Duyệt mảng */
    traverse(res, size);

    /* Tìm phần tử */
    int index = find(res, size, 3);
    printf("Find element 3 in res, index = %d\n", index);

    /* Giải phóng bộ nhớ */
    free(res);
    return 0;
}
