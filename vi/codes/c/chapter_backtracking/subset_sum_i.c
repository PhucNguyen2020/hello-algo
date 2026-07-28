/**
 * File: subset_sum_i.c
 * Created Time: 2023-07-29
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
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Khi tổng tập con bằng target, ghi lại lời giải
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    for (int i = start; i < choicesSize; i++) {
        // Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay
        // Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if (target - choices[i] < 0) {
            break;
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state[stateSize] = choices[i];
        stateSize++;
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(target - choices[i], choices, choicesSize, i);
        // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
        stateSize--;
    }
}

/* Hàm so sánh */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Giải bài toán tổng tập con I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // Sắp xếp nums
    int start = 0;                           // Điểm bắt đầu duyệt
    backtrack(target, nums, numsSize, start);
}

/* Đoạn mã điều khiển chính */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("All subsets with sum equal to %d res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
