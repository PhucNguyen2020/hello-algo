/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* Xây dựng cây nhị phân: chia để trị */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // Kết thúc khi khoảng của cây con rỗng
    if (r - l < 0) return null;
    // Khởi tạo nút gốc
    const root: TreeNode = new TreeNode(preorder[i]);
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
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // Khởi tạo bảng băm, lưu trữ ánh xạ từ phần tử duyệt giữa (inorder) đến chỉ số
    let inorderMap = new Map<number, number>();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Driver Code */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('Preorder traversal = ' + JSON.stringify(preorder));
console.log('Inorder traversal = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('The constructed binary tree is:');
printTree(root);
