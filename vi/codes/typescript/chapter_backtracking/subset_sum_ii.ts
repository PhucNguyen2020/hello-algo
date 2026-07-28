/**
 * File: subset_sum_ii.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con II */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    // Cắt tỉa 3: bắt đầu duyệt từ start để tránh chọn lại cùng một phần tử
    for (let i = start; i < choices.length; i++) {
        // Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay
        // Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if (target - choices[i] < 0) {
            break;
        }
        // Cắt tỉa 4: nếu phần tử này bằng phần tử bên trái, nghĩa là nhánh tìm kiếm này trùng lặp, bỏ qua ngay
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.push(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.pop();
    }
}

/* Giải bài toán tổng tập con II */
function subsetSumII(nums: number[], target: number): number[][] {
    const state = []; // Trạng thái (tập con)
    nums.sort((a, b) => a - b); // Sắp xếp nums
    const start = 0; // Điểm bắt đầu duyệt
    const res = []; // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`Input array nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`All subsets with sum equal to ${target} res = ${JSON.stringify(res)}`);

export {};
