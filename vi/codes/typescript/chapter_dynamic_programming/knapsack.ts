/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Bài toán cái túi 0-1: Tìm kiếm vét cạn */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // Nếu đã chọn hết các món đồ hoặc túi không còn dung lượng, trả về giá trị 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Nếu vượt quá dung lượng túi, chỉ có thể chọn không bỏ vào
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Tính giá trị lớn nhất giữa việc không bỏ vào và bỏ vào món đồ i
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Trả về giá trị lớn hơn trong hai phương án
    return Math.max(no, yes);
}

/* Bài toán cái túi 0-1: Tìm kiếm ghi nhớ */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // Nếu đã chọn hết các món đồ hoặc túi không còn dung lượng, trả về giá trị 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Nếu có bản ghi, trả về nó ngay
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // Nếu vượt quá dung lượng túi, chỉ có thể chọn không bỏ vào
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Tính giá trị lớn nhất giữa việc không bỏ vào và bỏ vào món đồ i
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Ghi lại và trả về giá trị lớn hơn trong hai phương án
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* Bài toán cái túi 0-1: Quy hoạch động */
function knapsackDP(
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
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Bài toán cái túi 0-1: Quy hoạch động tối ưu không gian */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Khởi tạo bảng dp
    const dp = Array(cap + 1).fill(0);
    // Chuyển trạng thái
    for (let i = 1; i <= n; i++) {
        // Duyệt theo thứ tự ngược lại
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Giá trị lớn hơn giữa việc không chọn và chọn món đồ i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Tìm kiếm vét cạn
let res = knapsackDFS(wgt, val, n, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Tìm kiếm ghi nhớ
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Quy hoạch động
res = knapsackDP(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Quy hoạch động tối ưu không gian
res = knapsackDPComp(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

export {};
