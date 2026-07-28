/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* Ghi lại lời giải */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* Cập nhật trạng thái */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* Khôi phục trạng thái */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* Giải thuật quay lui: Ví dụ 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
    // Kiểm tra xem đây có phải là lời giải hay không
    if (isSolution(state)) {
        // Ghi lại lời giải
        recordSolution(state, res);
    }
    // Duyệt qua tất cả các lựa chọn
    for (const choice of choices) {
        // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
        if (isValid(state, choice)) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            makeChoice(state, choice);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, [choice.left, choice.right], res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            undoChoice(state);
        }
    }
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree');
printTree(root);

// Giải thuật quay lui
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
