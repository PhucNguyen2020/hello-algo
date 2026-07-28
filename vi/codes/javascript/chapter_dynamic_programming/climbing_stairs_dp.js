/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Leo cầu thang: Quy hoạch động */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    const dp = new Array(n + 1).fill(-1);
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = 1;
    dp[2] = 2;
    // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Leo cầu thang: Quy hoạch động tối ưu không gian */
function climbingStairsDPComp(n) {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver Code */
const n = 9;
let res = climbingStairsDP(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);
res = climbingStairsDPComp(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);
