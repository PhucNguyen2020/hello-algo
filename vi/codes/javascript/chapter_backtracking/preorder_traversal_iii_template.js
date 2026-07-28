/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Ghi lại lời giải */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* Cập nhật trạng thái */
function makeChoice(state, choice) {
    state.push(choice);
}

/* Khôi phục trạng thái */
function undoChoice(state) {
    state.pop();
}

/* Giải thuật quay lui: ví dụ 3 */
function backtrack(state, choices, res) {
    // Kiểm tra xem có phải là lời giải hay không
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

// Mã điều khiển
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nKhởi tạo cây nhị phân');
printTree(root);

// Giải thuật quay lui
const res = [];
backtrack([], [root], res);

console.log('\nXuất ra tất cả các đường đi từ nút gốc đến nút 7, yêu cầu các đường đi không chứa nút có giá trị 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
