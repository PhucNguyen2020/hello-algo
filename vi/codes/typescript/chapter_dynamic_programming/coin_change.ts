/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Đổi tiền xu: Quy hoạch động */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Khởi tạo bảng dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Đổi tiền xu: Quy hoạch động tối ưu không gian */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Khởi tạo bảng dp
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // Chuyển trạng thái
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
                dp[a] = dp[a];
            } else {
                // Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 4;

// Quy hoạch động
let res = coinChangeDP(coins, amt);
console.log(`Minimum coins needed to make target amount is ${res}`);

// Quy hoạch động tối ưu không gian
res = coinChangeDPComp(coins, amt);
console.log(`Minimum coins needed to make target amount is ${res}`);

export {};
