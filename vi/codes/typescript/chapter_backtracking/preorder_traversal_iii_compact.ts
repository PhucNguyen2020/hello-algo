/**
 * File: preorder_traversal_iii_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Duyệt trước (preorder): Ví dụ 3 */
function preOrder(
    root: TreeNode | null,
    path: TreeNode[],
    res: TreeNode[][]
): void {
    // Cắt tỉa
    if (root === null || root.val === 3) {
        return;
    }
    // Thử
    path.push(root);
    if (root.val === 7) {
        // Ghi lại lời giải
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Quay lui
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree');
printTree(root);

// Duyệt trước (preorder)
const path: TreeNode[] = [];
const res: TreeNode[][] = [];
preOrder(root, path, res);

console.log('\nOutput all paths from root node to node 7, paths do not include nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
