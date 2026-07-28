/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    for (let i = 0; i < choices.length; i++) {
        // Cắt tỉa: nếu tổng của tập con vượt quá target, bỏ qua lựa chọn này
        if (total + choices[i] > target) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng total
        state.push(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.pop();
    }
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // Trạng thái (tập con)
    const total = 0; // Tổng của tập con
    const res = []; // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum equal to ${target} res = ${JSON.stringify(res)}`);
console.log('Please note that this method outputs results containing duplicate sets');

export {};
