/**
 * File: space_complexity.ts
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Hàm */
function constFunc(): number {
    // Thực hiện một số thao tác
    return 0;
}

/* Độ phức tạp không gian hằng số */
function constant(n: number): void {
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
function linear(n: number): void {
    // Mảng có độ dài n sử dụng không gian O(n)
    const nums = new Array(n);
    // Danh sách có độ dài n chiếm không gian O(n)
    const nodes: ListNode[] = [];
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
function linearRecur(n: number): void {
    console.log(`Recursion n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* Độ phức tạp không gian bậc hai */
function quadratic(n: number): void {
    // Ma trận sử dụng không gian O(n^2)
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // Danh sách hai chiều sử dụng không gian O(n^2)
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
function quadraticRecur(n: number): number {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`In recursion n = ${n}, nums length = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* Driver Code */
function buildTree(n: number): TreeNode | null {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Driver Code */
const n = 5;
// Độ phức tạp không gian hằng số
constant(n);
// Độ phức tạp không gian tuyến tính
linear(n);
linearRecur(n);
// Độ phức tạp không gian bậc hai
quadratic(n);
quadraticRecur(n);
// Độ phức tạp không gian theo cấp số nhân
const root = buildTree(n);
printTree(root);
