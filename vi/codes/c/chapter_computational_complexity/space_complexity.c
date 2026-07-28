/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Hàm */
int func() {
    // Thực hiện một số thao tác
    return 0;
}

/* Độ phức tạp bậc hằng số */
void constant(int n) {
    // Hằng số, biến, đối tượng chiếm không gian O(1)
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // Biến trong vòng lặp chiếm không gian O(1)
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Hàm trong vòng lặp chiếm không gian O(1)
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Bảng băm */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Cài đặt bằng uthash.h
} HashTable;

/* Độ phức tạp bậc tuyến tính */
void linear(int n) {
    // Mảng có độ dài n chiếm không gian O(n)
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // Danh sách có độ dài n chiếm không gian O(n)
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // Giải phóng bộ nhớ
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // Bảng băm có độ dài n chiếm không gian O(n)
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // Giải phóng bộ nhớ
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* Độ phức tạp bậc tuyến tính (cài đặt bằng đệ quy) */
void linearRecur(int n) {
    printf("Recursion n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Độ phức tạp bậc bình phương */
void quadratic(int n) {
    // Danh sách 2 chiều chiếm không gian O(n^2)
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // Giải phóng bộ nhớ
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* Độ phức tạp bậc bình phương (cài đặt bằng đệ quy) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("In recursion n = %d, nums length = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* Đoạn mã điều khiển chính */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Đoạn mã điều khiển chính */
int main() {
    int n = 5;
    // Độ phức tạp bậc hằng số
    constant(n);
    // Độ phức tạp bậc tuyến tính
    linear(n);
    linearRecur(n);
    // Độ phức tạp bậc bình phương
    quadratic(n);
    quadraticRecur(n);
    // Độ phức tạp bậc mũ
    TreeNode *root = buildTree(n);
    printTree(root);

    // Giải phóng bộ nhớ
    freeMemoryTree(root);

    return 0;
}
