/**
 * File: build_tree.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { printTree } = require('../modules/PrintUtil');
const { TreeNode } = require('../modules/TreeNode');

/* Xây dựng cây nhị phân: chia để trị */
function dfs(preorder, inorderMap, i, l, r) {
    // Kết thúc khi khoảng của cây con rỗng
    if (r - l < 0) return null;
    // Khởi tạo nút gốc
    const root = new TreeNode(preorder[i]);
    // Truy vấn m để phân chia cây con trái và phải
    const m = inorderMap.get(preorder[i]);
    // Bài toán con: xây dựng cây con trái
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Bài toán con: xây dựng cây con phải
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Trả về nút gốc
    return root;
}

/* Xây dựng cây nhị phân */
function buildTree(preorder, inorder) {
    // Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa sang chỉ số
    let inorderMap = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Đoạn mã chạy thử */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('Preorder traversal = ' + JSON.stringify(preorder));
console.log('Inorder traversal = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('The constructed binary tree is:');
printTree(root);
