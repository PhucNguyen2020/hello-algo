/**
 * File: climbing_stairs_constraint_dp.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Leo cầu thang có ràng buộc: Quy hoạch động */
function climbingStairsConstraintDP(n: number): number {
    if (n === 1 || n === 2) {
        return 1;
    }
    // Khởi tạo bảng dp, dùng để lưu trữ lời giải của các bài toán con
    const dp = Array.from({ length: n + 1 }, () => new Array(3));
    // Trạng thái khởi tạo: đặt trước lời giải của bài toán con nhỏ nhất
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (let i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Driver Code */
const n = 9;
const res = climbingStairsConstraintDP(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);

export {};
