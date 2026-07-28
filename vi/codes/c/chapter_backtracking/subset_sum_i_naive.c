/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// Trạng thái (tập con)
int state[MAX_SIZE];
int stateSize = 0;

// Danh sách kết quả (danh sách các tập con)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* Giải thuật quay lui: Tổng tập con I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // Khi tổng tập con bằng target, ghi lại lời giải
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    for (int i = 0; i < choicesSize; i++) {
        // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
        if (total + choices[i] > target) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng các phần tử total
        state[stateSize++] = choices[i];
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(target, total + choices[i], choices, choicesSize);
        // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
        stateSize--;
    }
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // Khởi tạo số lượng lời giải bằng 0
    backtrack(target, 0, nums, numsSize);
}

/* Đoạn mã điều khiển chính */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets with sum equal to %d res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
