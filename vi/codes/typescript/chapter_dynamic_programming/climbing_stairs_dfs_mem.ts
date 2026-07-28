/**
 * File: climbing_stairs_dfs_mem.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Tìm kiếm ghi nhớ */
function dfs(i: number, mem: number[]): number {
    // Đã biết dp[1] và dp[2], trả về chúng
    if (i === 1 || i === 2) return i;
    // Nếu bản ghi dp[i] tồn tại, trả về nó ngay
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Ghi lại dp[i]
    mem[i] = count;
    return count;
}

/* Leo cầu thang: Tìm kiếm ghi nhớ */
function climbingStairsDFSMem(n: number): number {
    // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);

export {};
