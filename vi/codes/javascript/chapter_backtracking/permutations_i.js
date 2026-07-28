/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Giải thuật quay lui: hoán vị I */
function backtrack(state, choices, selected, res) {
    // Khi độ dài state bằng số lượng phần tử, ghi lại lời giải
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    choices.forEach((choice, i) => {
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
        if (!selected[i]) {
            // Thử: thực hiện lựa chọn, cập nhật state
            selected[i] = true;
            state.push(choice);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, choices, selected, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            selected[i] = false;
            state.pop();
        }
    });
}

/* Hoán vị I */
function permutationsI(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Mã điều khiển
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`Input array nums = ${JSON.stringify(nums)}`);
console.log(`All permutations res = ${JSON.stringify(res)}`);
