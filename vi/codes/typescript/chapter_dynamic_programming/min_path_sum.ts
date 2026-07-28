/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Tổng đường đi nhỏ nhất: Tìm kiếm vét cạn */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // Nếu chỉ số hàng hoặc cột ngoài phạm vi, trả về chi phí +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Tính chi phí đường đi nhỏ nhất từ ô trên cùng bên trái đến (i-1, j) và (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Trả về chi phí đường đi nhỏ nhất từ ô trên cùng bên trái đến (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Tổng đường đi nhỏ nhất: Tìm kiếm ghi nhớ */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // Nếu chỉ số hàng hoặc cột ngoài phạm vi, trả về chi phí +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Nếu có bản ghi, trả về nó ngay
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Chi phí đường đi nhỏ nhất của ô bên trái và ô phía trên
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Ghi lại và trả về chi phí đường đi nhỏ nhất từ ô trên cùng bên trái đến (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Tổng đường đi nhỏ nhất: Quy hoạch động */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Khởi tạo bảng dp
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // Chuyển trạng thái: hàng đầu tiên
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Chuyển trạng thái: cột đầu tiên
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Tổng đường đi nhỏ nhất: Quy hoạch động tối ưu không gian */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Khởi tạo bảng dp
    const dp = new Array(m);
    // Chuyển trạng thái: hàng đầu tiên
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Chuyển trạng thái: các hàng còn lại
    for (let i = 1; i < n; i++) {
        // Chuyển trạng thái: cột đầu tiên
        dp[0] = dp[0] + grid[i][0];
        // Chuyển trạng thái: các cột còn lại
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
const grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
];
const n = grid.length,
    m = grid[0].length;
// Tìm kiếm vét cạn
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Tìm kiếm ghi nhớ
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Quy hoạch động
res = minPathSumDP(grid);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Quy hoạch động tối ưu không gian
res = minPathSumDPComp(grid);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

export {};
