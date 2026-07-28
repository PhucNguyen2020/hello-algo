/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Cây AVL */
class AVLTree {
  private:
    /* Cập nhật chiều cao nút */
    void updateHeight(TreeNode *node) {
        // Chiều cao nút bằng chiều cao của cây con cao nhất + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* Thao tác xoay phải */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Lấy child làm trục, xoay node sang phải
        child->right = node;
        node->left = grandChild;
        // Cập nhật chiều cao nút
        updateHeight(node);
        updateHeight(child);
        // Trả về nút gốc của cây con sau khi xoay
        return child;
    }

    /* Thao tác xoay trái */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Lấy child làm trục, xoay node sang trái
        child->left = node;
        node->right = grandChild;
        // Cập nhật chiều cao nút
        updateHeight(node);
        updateHeight(child);
        // Trả về nút gốc của cây con sau khi xoay
        return child;
    }

    /* Thực hiện thao tác xoay để khôi phục cân bằng cho cây con này */
    TreeNode *rotate(TreeNode *node) {
        // Lấy hệ số cân bằng của node
        int _balanceFactor = balanceFactor(node);
        // Cây nghiêng trái
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Xoay phải
                return rightRotate(node);
            } else {
                // Xoay trái trước rồi xoay phải sau
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Cây nghiêng phải
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Xoay trái
                return leftRotate(node);
            } else {
                // Xoay phải trước rồi xoay trái sau
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Cây cân bằng, không cần xoay, trả về trực tiếp
        return node;
    }

    /* Đệ quy chèn nút (hàm phụ trợ) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Tìm vị trí chèn và chèn nút */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Nút trùng lặp không được chèn, trả về trực tiếp
        updateHeight(node); // Cập nhật chiều cao nút
        /* 2. Thực hiện thao tác xoay để khôi phục cân bằng cho cây con này */
        node = rotate(node);
        // Trả về nút gốc của cây con
        return node;
    }

    /* Đệ quy xóa nút (hàm phụ trợ) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Tìm nút và xóa */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Số lượng nút con = 0, xóa nút trực tiếp và trả về
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Số lượng nút con = 1, xóa nút trực tiếp
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Số lượng nút con = 2, xóa nút kế tiếp trong duyệt giữa và thay thế nút hiện tại bằng nó
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Cập nhật chiều cao nút
        /* 2. Thực hiện thao tác xoay để khôi phục cân bằng cho cây con này */
        node = rotate(node);
        // Trả về nút gốc của cây con
        return node;
    }

  public:
    TreeNode *root; // Nút gốc

    /* Lấy chiều cao nút */
    int height(TreeNode *node) {
        // Chiều cao nút rỗng là -1, chiều cao nút lá là 0
        return node == nullptr ? -1 : node->height;
    }

    /* Lấy hệ số cân bằng */
    int balanceFactor(TreeNode *node) {
        // Hệ số cân bằng của nút rỗng là 0
        if (node == nullptr)
            return 0;
        // Hệ số cân bằng của nút = chiều cao cây con trái - chiều cao cây con phải
        return height(node->left) - height(node->right);
    }

    /* Chèn nút */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Xóa nút */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Tìm kiếm nút */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // Lặp tìm kiếm, thoát sau khi vượt qua nút lá
        while (cur != nullptr) {
            // Nút mục tiêu nằm trong cây con phải của cur
            if (cur->val < val)
                cur = cur->right;
            // Nút mục tiêu nằm trong cây con trái của cur
            else if (cur->val > val)
                cur = cur->left;
            // Tìm thấy nút mục tiêu, thoát vòng lặp
            else
                break;
        }
        // Trả về nút mục tiêu
        return cur;
    }

    /*Hàm khởi tạo*/
    AVLTree() : root(nullptr) {
    }

    /*Hàm hủy*/
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree &tree, int val) {
    tree.insert(val);
    cout << "\nAfter inserting node " << val << ", AVL tree is" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nAfter removing node " << val << ", AVL tree is" << endl;
    printTree(tree.root);
}

/* Driver Code */
int main() {
    /* Hãy chú ý cách cây AVL duy trì cân bằng sau khi chèn nút */
    AVLTree avlTree;

    /* Chèn nút */
    // Chèn các nút
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* Hãy chú ý cách cây AVL duy trì cân bằng sau khi xóa nút */
    testInsert(avlTree, 7);

    /* Xóa nút */
    // Xóa nút có bậc 1
    testRemove(avlTree, 8); // Xóa nút có bậc 2
    testRemove(avlTree, 5); // Xóa nút có bậc 1
    testRemove(avlTree, 4); // Xóa nút có bậc 2

    /* Tìm kiếm nút */
    TreeNode *node = avlTree.search(7);
    cout << "\nFound node object is " << node << ", node value = " << node->val << endl;
}
