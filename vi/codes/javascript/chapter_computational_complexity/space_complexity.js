/**
 * File: space_complexity.js
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

const { ListNode } = require('../modules/ListNode');
const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Hàm */
function constFunc() {
    // Thực hiện một số thao tác
    return 0;
}

/* Độ phức tạp không gian hằng số */
function constant(n) {
    // Hằng số, biến, đối tượng chiếm không gian O(1)
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // Biến trong vòng lặp chiếm không gian O(1)
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // Hàm trong vòng lặp chiếm không gian O(1)
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* Độ phức tạp không gian tuyến tính */
function linear(n) {
    // Mảng có độ dài n chiếm không gian O(n)
    const nums = new Array(n);
    // Danh sách có độ dài n chiếm không gian O(n)
    const nodes = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // Bảng băm có độ dài n chiếm không gian O(n)
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* Độ phức tạp không gian tuyến tính (triển khai đệ quy) */
function linearRecur(n) {
    console.log(`Đệ quy n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* Độ phức tạp không gian bậc hai */
function quadratic(n) {
    // Ma trận chiếm không gian O(n^2)
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // Danh sách 2 chiều chiếm không gian O(n^2)
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* Độ phức tạp không gian bậc hai (triển khai đệ quy) */
function quadraticRecur(n) {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`In recursion n = ${n}, nums length = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* Đoạn mã chạy thử */
function buildTree(n) {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Đoạn mã chạy thử */
const n = 5;
// Độ phức tạp không gian hằng số
constant(n);
// Độ phức tạp không gian tuyến tính
linear(n);
linearRecur(n);
// Độ phức tạp không gian bậc hai
quadratic(n);
quadraticRecur(n);
// Độ phức tạp không gian dạng cây (đệ quy)
const root = buildTree(n);
printTree(root);
