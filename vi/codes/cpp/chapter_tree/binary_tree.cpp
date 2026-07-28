/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Khởi tạo cây nhị phân */
    // Khởi tạo các nút
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // Xây dựng tham chiếu (con trỏ) giữa các nút
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(n1);

    /* Chèn nút P giữa n1 -> n2 */
    TreeNode *P = new TreeNode(0);
    // Chèn nút
    n1->left = P;
    P->left = n2;
    cout << endl << "After inserting node P\n" << endl;
    printTree(n1);
    // Xóa nút P
    n1->left = n2;
    delete P; // Giải phóng bộ nhớ
    cout << endl << "After removing node P\n" << endl;
    printTree(n1);

    // Giải phóng bộ nhớ
    freeMemoryTree(n1);

    return 0;
}
