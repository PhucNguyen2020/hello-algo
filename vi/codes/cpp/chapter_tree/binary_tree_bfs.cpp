/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Duyệt theo tầng */
vector<int> levelOrder(TreeNode *root) {
    // Khởi tạo hàng đợi, thêm nút gốc
    queue<TreeNode *> queue;
    queue.push(root);
    // Khởi tạo một danh sách để lưu chuỗi duyệt
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Xóa khỏi hàng đợi
        vec.push_back(node->val); // Lưu giá trị nút
        if (node->left != nullptr)
            queue.push(node->left); // Nút con trái vào hàng đợi
        if (node->right != nullptr)
            queue.push(node->right); // Nút con phải vào hàng đợi
    }
    return vec;
}

/* Driver Code */
int main() {
    /* Khởi tạo cây nhị phân */
    // Ở đây ta dùng một hàm để sinh trực tiếp cây nhị phân từ mảng
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Duyệt theo tầng */
    vector<int> vec = levelOrder(root);
    cout << endl << "Level-order traversal node print sequence = ";
    printVector(vec);

    return 0;
}
