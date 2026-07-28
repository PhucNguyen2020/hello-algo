/**
 * File: preorder_traversal_ii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Duyệt trước: ví dụ 2 */
function preOrder(root, path, res) {
    if (root === null) {
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

// Mã điều khiển
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nKhởi tạo cây nhị phân');
printTree(root);

// Duyệt trước
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nXuất ra tất cả các đường đi từ nút gốc đến nút 7');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
