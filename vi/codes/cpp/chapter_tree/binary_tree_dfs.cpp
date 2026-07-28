/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Khởi tạo danh sách để lưu chuỗi duyệt
vector<int> vec;

/* Duyệt trước */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Thứ tự thăm: nút gốc -> cây con trái -> cây con phải
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Duyệt giữa */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Thứ tự thăm: cây con trái -> nút gốc -> cây con phải
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Duyệt sau */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Thứ tự thăm: cây con trái -> cây con phải -> nút gốc
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* Khởi tạo cây nhị phân */
    // Ở đây ta dùng một hàm để sinh trực tiếp cây nhị phân từ mảng
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Duyệt trước */
    vec.clear();
    preOrder(root);
    cout << endl << "Pre-order traversal node print sequence = ";
    printVector(vec);

    /* Duyệt giữa */
    vec.clear();
    inOrder(root);
    cout << endl << "In-order traversal node print sequence = ";
    printVector(vec);

    /* Duyệt sau */
    vec.clear();
    postOrder(root);
    cout << endl << "Post-order traversal node print sequence = ";
    printVector(vec);

    return 0;
}
