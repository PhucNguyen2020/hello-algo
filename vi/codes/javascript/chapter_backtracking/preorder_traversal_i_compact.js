/**
 * File: preorder_traversal_i_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Duyệt trước: ví dụ 1 */
function preOrder(root, res) {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // Ghi lại lời giải
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// Mã điều khiển
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nKhởi tạo cây nhị phân');
printTree(root);

// Duyệt trước
const res = [];
preOrder(root, res);

console.log('\nXuất ra tất cả các nút có giá trị 7');
console.log(res.map((node) => node.val));
