/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Lớp cây nhị phân biểu diễn bằng mảng */
class ArrayBinaryTree {
  public:
    /* Hàm khởi tạo */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* Dung lượng danh sách */
    int size() {
        return tree.size();
    }

    /* Lấy giá trị của nút tại chỉ số i */
    int val(int i) {
        // Trả về INT_MAX nếu chỉ số vượt phạm vi, biểu diễn vị trí rỗng
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* Lấy chỉ số của nút con trái của nút tại chỉ số i */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Lấy chỉ số của nút con phải của nút tại chỉ số i */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Lấy chỉ số của nút cha của nút tại chỉ số i */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* Duyệt theo tầng */
    vector<int> levelOrder() {
        vector<int> res;
        // Duyệt trực tiếp mảng
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* Duyệt trước */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* Duyệt giữa */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* Duyệt sau */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* Duyệt theo chiều sâu */
    void dfs(int i, string order, vector<int> &res) {
        // Nếu là vị trí rỗng, trả về
        if (val(i) == INT_MAX)
            return;
        // Duyệt trước
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // Duyệt giữa
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // Duyệt sau
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver Code */
int main() {
    // Khởi tạo cây nhị phân
    // Dùng INT_MAX để biểu diễn vị trí rỗng nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\nInitialize binary tree\n";
    cout << "Array representation of binary tree:\n";
    printVector(arr);
    cout << "Linked list representation of binary tree:\n";
    printTree(root);

    // Lớp cây nhị phân biểu diễn bằng mảng
    ArrayBinaryTree abt(arr);

    // Truy cập nút
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\nCurrent node index is " << i << ", value is " << abt.val(i) << "\n";
    cout << "Its left child node index is " << l << ", value is " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "Its right child node index is " << r << ", value is " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "Its parent node index is " << p << ", value is " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // Duyệt cây
    vector<int> res = abt.levelOrder();
    cout << "\nLevel-order traversal: ";
    printVector(res);
    res = abt.preOrder();
    cout << "Pre-order traversal: ";
    printVector(res);
    res = abt.inOrder();
    cout << "In-order traversal: ";
    printVector(res);
    res = abt.postOrder();
    cout << "Post-order traversal: ";
    printVector(res);

    return 0;
}
