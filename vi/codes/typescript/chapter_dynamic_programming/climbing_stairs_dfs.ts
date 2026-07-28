/**
 * File: climbing_stairs_dfs.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Tìm kiếm */
function dfs(i: number): number {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Leo cầu thang: Tìm kiếm */
function climbingStairsDFS(n: number): number {
    return dfs(n);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);

export {};
