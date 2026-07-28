/**
 * File: unbounded_knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Bài toán cái túi không giới hạn: Quy hoạch động */
function unboundedKnapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Khởi tạo bảng dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // Chuyển trạng thái
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Nếu vượt quá dung lượng túi, không chọn món đồ i
                dp[i][c] = dp[i - 1][c];
            } else {
                // Giá trị lớn hơn giữa việc không chọn và chọn món đồ i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Bài toán cái túi không giới hạn: Quy hoạch động tối ưu không gian */
function unboundedKnapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Khởi tạo bảng dp
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // Chuyển trạng thái
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Nếu vượt quá dung lượng túi, không chọn món đồ i
                dp[c] = dp[c];
            } else {
                // Giá trị lớn hơn giữa việc không chọn và chọn món đồ i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// Quy hoạch động
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Quy hoạch động tối ưu không gian
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

export {};
