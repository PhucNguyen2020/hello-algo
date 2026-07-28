/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Sinh một mảng gồm các phần tử { 1, 2, ..., n }, thứ tự đã được xáo trộn */
int *randomNumbers(int n) {
    // Cấp phát bộ nhớ heap (tạo mảng một chiều có độ dài biến đổi: n phần tử kiểu int)
    int *nums = (int *)malloc(n * sizeof(int));
    // Sinh mảng nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Xáo trộn ngẫu nhiên các phần tử của mảng
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* Tìm chỉ số của số 1 trong mảng nums */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // Khi phần tử 1 nằm ở đầu mảng, đạt độ phức tạp thời gian tốt nhất O(1)
        // Khi phần tử 1 nằm ở cuối mảng, đạt độ phức tạp thời gian xấu nhất O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Đoạn mã điều khiển chính */
int main(int argc, char *argv[]) {
    // Khởi tạo hạt giống ngẫu nhiên
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nArray [ 1, 2, ..., n ] after shuffling = ");
        printArray(nums, n);
        printf("Index of number 1 is %d\n", index);
        // Giải phóng bộ nhớ heap
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
