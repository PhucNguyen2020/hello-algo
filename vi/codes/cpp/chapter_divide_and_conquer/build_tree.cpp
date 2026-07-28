/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Xây dựng cây nhị phân: chia để trị */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // Dừng khi khoảng của cây con rỗng
    if (r - l < 0)
        return NULL;
    // Khởi tạo nút gốc
    TreeNode *root = new TreeNode(preorder[i]);
    // Truy vấn m để phân chia cây con trái và phải
    int m = inorderMap[preorder[i]];
    // Bài toán con: xây dựng cây con trái
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Bài toán con: xây dựng cây con phải
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Trả về nút gốc
    return root;
}

/* Xây dựng cây nhị phân */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa đến chỉ số
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver Code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "Preorder traversal = ";
    printVector(preorder);
    cout << "Inorder traversal = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "The constructed binary tree is:\n";
    printTree(root);

    return 0;
}
