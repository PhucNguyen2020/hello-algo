/**
 * File: tree_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <limits.h>
#include <vector>

using namespace std;

/* Cấu trúc nút của cây nhị phân */
struct TreeNode {
    int val{};
    int height = 0;
    TreeNode *parent{};
    TreeNode *left{};
    TreeNode *right{};
    TreeNode() = default;
    explicit TreeNode(int x, TreeNode *parent = nullptr) : val(x), parent(parent) {
    }
};

// Về quy tắc mã hóa tuần tự hóa, vui lòng tham khảo:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// Biểu diễn cây nhị phân dưới dạng mảng:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// Biểu diễn cây nhị phân dưới dạng danh sách liên kết:
//             /——— 15
//         /——— 7
//     /——— 3
//    |    \——— 6
//    |        \——— 12
// ——— 1
//     \——— 2
//        |    /——— 9
//         \——— 4
//             \——— 8

/* Giải mã một danh sách thành cây nhị phân: đệ quy */
TreeNode *vectorToTreeDFS(vector<int> &arr, int i) {
    if (i < 0 || i >= arr.size() || arr[i] == INT_MAX) {
        return nullptr;
    }
    TreeNode *root = new TreeNode(arr[i]);
    root->left = vectorToTreeDFS(arr, 2 * i + 1);
    root->right = vectorToTreeDFS(arr, 2 * i + 2);
    return root;
}

/* Giải mã một danh sách thành cây nhị phân */
TreeNode *vectorToTree(vector<int> arr) {
    return vectorToTreeDFS(arr, 0);
}

/* Mã hóa cây nhị phân thành một danh sách: đệ quy */
void treeToVecorDFS(TreeNode *root, int i, vector<int> &res) {
    if (root == nullptr)
        return;
    while (i >= res.size()) {
        res.push_back(INT_MAX);
    }
    res[i] = root->val;
    treeToVecorDFS(root->left, 2 * i + 1, res);
    treeToVecorDFS(root->right, 2 * i + 2, res);
}

/* Mã hóa cây nhị phân thành một danh sách */
vector<int> treeToVecor(TreeNode *root) {
    vector<int> res;
    treeToVecorDFS(root, 0, res);
    return res;
}

/* Giải phóng bộ nhớ của cây nhị phân */
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    delete root;
}
