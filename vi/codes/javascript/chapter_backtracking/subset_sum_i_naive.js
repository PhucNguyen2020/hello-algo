/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Giải thuật quay lui: tổng tập con I */
function backtrack(state, target, total, choices, res) {
    // Khi tổng tập con bằng target, ghi lại lời giải
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    for (let i = 0; i < choices.length; i++) {
        // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
        if (total + choices[i] > target) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
        state.push(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.pop();
    }
}

/* Giải bài toán tổng tập con I (bao gồm cả các tập con trùng lặp) */
function subsetSumINaive(nums, target) {
    const state = []; // Trạng thái (tập con)
    const total = 0; // Tổng tập con
    const res = []; // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Mã điều khiển */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum equal to ${target} res = ${JSON.stringify(res)}`);
console.log('Lưu ý rằng phương pháp này xuất ra kết quả chứa các tập hợp trùng lặp');
