/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Quay lui */
function backtrack(choices, state, n, res) {
    // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
    if (state === n) res.set(0, res.get(0) + 1);
    // Duyệt qua tất cả các lựa chọn
    for (const choice of choices) {
        // Cắt tỉa: không được phép vượt quá bậc thang thứ n
        if (state + choice > n) continue;
        // Thử: đưa ra lựa chọn, cập nhật trạng thái
        backtrack(choices, state + choice, n, res);
        // Quay lui
    }
}

/* Leo cầu thang: Quay lui */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // Có thể chọn leo lên 1 hoặc 2 bậc
    const state = 0; // Bắt đầu leo từ bậc thang thứ 0
    const res = new Map();
    res.set(0, 0); // Dùng res[0] để lưu số lời giải
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver Code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);
