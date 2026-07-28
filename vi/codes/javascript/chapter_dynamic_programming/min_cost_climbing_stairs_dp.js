/**
 * File: min_cost_climbing_stairs_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Chi phí tối thiểu leo cầu thang: Quy hoạch động */
function minCostClimbingStairsDP(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
    const dp = new Array(n + 1);
    // Trạng thái khởi tạo: đặt trước lời giải cho bài toán con nhỏ nhất
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Chuyển trạng thái: giải dần các bài toán con lớn hơn từ các bài toán con nhỏ hơn
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Chi phí tối thiểu leo cầu thang: Quy hoạch động tối ưu không gian */
function minCostClimbingStairsDPComp(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    let a = cost[1],
        b = cost[2];
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = Math.min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
const cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
console.log('Input stair cost list is:', cost);

let res = minCostClimbingStairsDP(cost);
console.log(`Minimum cost to climb stairs is: ${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`Minimum cost to climb stairs is: ${res}`);
