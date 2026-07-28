/**
 * File: permutations_ii.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Giải thuật quay lui: Hoán vị II */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // Khi độ dài state bằng số lượng phần tử, ghi lại lời giải
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử có giá trị bằng nhau
        if (!selected[i] && !duplicated.has(choice)) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated.add(choice); // Ghi lại giá trị phần tử đã chọn
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

/* Hoán vị II */
function permutationsII(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums: number[] = [1, 2, 2];
const res: number[][] = permutationsII(nums);

console.log(`Input array nums = ${JSON.stringify(nums)}`);
console.log(`All permutations res = ${JSON.stringify(res)}`);

export {};
