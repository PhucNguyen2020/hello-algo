/**
 * File: permutations_ii.c
 * Created Time: 2023-10-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.h"

// Giả sử có tối đa 1000 hoán vị, giá trị phần tử tối đa là 1000
#define MAX_SIZE 1000

/* Giải thuật quay lui: Hoán vị II */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    bool duplicated[MAX_SIZE] = {false};
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử có giá trị bằng nhau
        if (!selected[i] && !duplicated[choice]) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated[choice] = true; // Ghi lại giá trị phần tử đã chọn
            selected[i] = true;
            state[stateSize] = choice;
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
            selected[i] = false;
        }
    }
}

/* Hoán vị II */
int **permutationsII(int *nums, int numsSize, int *returnSize) {
    int *state = (int *)malloc(numsSize * sizeof(int));
    bool *selected = (bool *)malloc(numsSize * sizeof(bool));
    for (int i = 0; i < numsSize; i++) {
        selected[i] = false;
    }
    int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
    *returnSize = 0;

    backtrack(state, 0, nums, numsSize, selected, res, returnSize);

    free(state);
    free(selected);

    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    int nums[] = {1, 1, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsII(nums, numsSize, &returnSize);

    printf("Input array nums = ");
    printArray(nums, numsSize);
    printf("\nAll permutations res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // Giải phóng bộ nhớ
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
