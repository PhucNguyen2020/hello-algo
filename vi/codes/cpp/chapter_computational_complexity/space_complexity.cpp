/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hàm */
int func() {
    // Thực hiện một số thao tác
    return 0;
}

/* Độ phức tạp không gian hằng số */
void constant(int n) {
    // Hằng số, biến, đối tượng chiếm không gian O(1)
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Biến trong vòng lặp chiếm không gian O(1)
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Hàm trong vòng lặp chiếm không gian O(1)
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Độ phức tạp không gian tuyến tính */
void linear(int n) {
    // Mảng có độ dài n chiếm không gian O(n)
    vector<int> nums(n);
    // Danh sách có độ dài n chiếm không gian O(n)
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // Bảng băm có độ dài n chiếm không gian O(n)
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* Độ phức tạp không gian tuyến tính (cài đặt đệ quy) */
void linearRecur(int n) {
    cout << "Recursion n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Độ phức tạp không gian bậc hai */
void quadratic(int n) {
    // Danh sách 2 chiều chiếm không gian O(n^2)
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* Độ phức tạp không gian bậc hai (cài đặt đệ quy) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "In recursion n = " << n << ", nums length = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Driver Code */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Driver Code */
int main() {
    int n = 5;
    // Độ phức tạp không gian hằng số
    constant(n);
    // Độ phức tạp không gian tuyến tính
    linear(n);
    linearRecur(n);
    // Độ phức tạp không gian bậc hai
    quadratic(n);
    quadraticRecur(n);
    // Độ phức tạp không gian theo cấp số mũ
    TreeNode *root = buildTree(n);
    printTree(root);

    // Giải phóng bộ nhớ
    freeMemoryTree(root);

    return 0;
}
