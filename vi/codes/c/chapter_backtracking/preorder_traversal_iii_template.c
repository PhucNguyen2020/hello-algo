/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Giả sử độ dài đường đi và kết quả không vượt quá 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải không */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* Ghi lại lời giải */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* Kiểm tra xem lựa chọn có hợp lệ trong trạng thái hiện tại không */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* Cập nhật trạng thái */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* Khôi phục trạng thái */
void undoChoice(void) {
    pathSize--;
}

/* Giải thuật quay lui: Ví dụ 3 */
void backtrack(TreeNode *choices[2]) {
    // Kiểm tra xem có phải là lời giải không
    if (isSolution()) {
        // Ghi lại lời giải
        recordSolution();
    }
    // Duyệt qua tất cả các lựa chọn
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ không
        if (isValid(choice)) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            makeChoice(choice);
            // Tiến hành vòng lựa chọn tiếp theo
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
            undoChoice();
        }
    }
}

/* Đoạn mã điều khiển chính */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nInitialize binary tree\n");
    printTree(root);

    // Giải thuật quay lui
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\nOutput all paths from root to node 7, excluding nodes with value 3\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Giải phóng bộ nhớ
    freeMemoryTree(root);
    return 0;
}
