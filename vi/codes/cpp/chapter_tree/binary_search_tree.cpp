/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Cây tìm kiếm nhị phân */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* Hàm khởi tạo */
    BinarySearchTree() {
        // Khởi tạo cây rỗng
        root = nullptr;
    }

    /* Hàm hủy */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* Lấy nút gốc của cây nhị phân */
    TreeNode *getRoot() {
        return root;
    }

    /* Tìm kiếm nút */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Lặp tìm kiếm, thoát sau khi vượt qua nút lá
        while (cur != nullptr) {
            // Nút mục tiêu nằm trong cây con phải của cur
            if (cur->val < num)
                cur = cur->right;
            // Nút mục tiêu nằm trong cây con trái của cur
            else if (cur->val > num)
                cur = cur->left;
            // Tìm thấy nút mục tiêu, thoát vòng lặp
            else
                break;
        }
        // Trả về nút mục tiêu
        return cur;
    }

    /* Chèn nút */
    void insert(int num) {
        // Nếu cây rỗng, khởi tạo nút gốc
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Lặp tìm kiếm, thoát sau khi vượt qua nút lá
        while (cur != nullptr) {
            // Tìm thấy nút trùng lặp, trả về trực tiếp
            if (cur->val == num)
                return;
            pre = cur;
            // Vị trí chèn nằm trong cây con phải của cur
            if (cur->val < num)
                cur = cur->right;
            // Vị trí chèn nằm trong cây con trái của cur
            else
                cur = cur->left;
        }
        // Chèn nút
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* Xóa nút */
    void remove(int num) {
        // Nếu cây rỗng, trả về trực tiếp
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Lặp tìm kiếm, thoát sau khi vượt qua nút lá
        while (cur != nullptr) {
            // Tìm thấy nút cần xóa, thoát vòng lặp
            if (cur->val == num)
                break;
            pre = cur;
            // Nút cần xóa nằm trong cây con phải của cur
            if (cur->val < num)
                cur = cur->right;
            // Nút cần xóa nằm trong cây con trái của cur
            else
                cur = cur->left;
        }
        // Nếu không có nút cần xóa, trả về trực tiếp
        if (cur == nullptr)
            return;
        // Số lượng nút con = 0 hoặc 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // Khi số lượng nút con = 0 / 1, child = nullptr / nút con đó
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Xóa nút cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // Nếu nút bị xóa là nút gốc, gán lại nút gốc
                root = child;
            }
            // Giải phóng bộ nhớ
            delete cur;
        }
        // Số lượng nút con = 2
        else {
            // Lấy nút kế tiếp của cur trong duyệt giữa
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Đệ quy xóa nút tmp
            remove(tmp->val);
            // Thay thế cur bằng tmp
            cur->val = tmpVal;
        }
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo cây tìm kiếm nhị phân */
    BinarySearchTree *bst = new BinarySearchTree();
    // Xin lưu ý, các thứ tự chèn khác nhau sẽ sinh ra các cây nhị phân khác nhau, chuỗi này có thể sinh ra một cây nhị phân hoàn hảo
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "Initialized binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Tìm kiếm nút */
    TreeNode *node = bst->search(7);
    cout << endl << "Found node object is " << node << ", node value = " << node->val << endl;

    /* Chèn nút */
    bst->insert(16);
    cout << endl << "After inserting node 16, binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Xóa nút */
    bst->remove(1);
    cout << endl << "After removing node 1, binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "After removing node 2, binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "After removing node 4, binary tree is\n" << endl;
    printTree(bst->getRoot());

    // Free memory
    delete bst;

    return 0;
}
