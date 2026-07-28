/**
 * File: edit_distance.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Khoảng cách chỉnh sửa: Tìm kiếm vét cạn */
function editDistanceDFS(s: string, t: string, i: number, j: number): number {
    // Nếu cả s và t đều rỗng, trả về 0
    if (i === 0 && j === 0) return 0;

    // Nếu s rỗng, trả về độ dài của t
    if (i === 0) return j;

    // Nếu t rỗng, trả về độ dài của s
    if (j === 0) return i;

    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // Số bước chỉnh sửa tối thiểu = số bước tối thiểu của chèn, xóa, thay thế + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Trả về số bước chỉnh sửa tối thiểu
    return Math.min(insert, del, replace) + 1;
}

/* Khoảng cách chỉnh sửa: Tìm kiếm ghi nhớ */
function editDistanceDFSMem(
    s: string,
    t: string,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Nếu cả s và t đều rỗng, trả về 0
    if (i === 0 && j === 0) return 0;

    // Nếu s rỗng, trả về độ dài của t
    if (i === 0) return j;

    // Nếu t rỗng, trả về độ dài của s
    if (j === 0) return i;

    // Nếu có bản ghi, trả về nó ngay
    if (mem[i][j] !== -1) return mem[i][j];

    // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // Số bước chỉnh sửa tối thiểu = số bước tối thiểu của chèn, xóa, thay thế + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Ghi lại và trả về số bước chỉnh sửa tối thiểu
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* Khoảng cách chỉnh sửa: Quy hoạch động */
function editDistanceDP(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: m + 1 }, () => 0)
    );
    // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // Chuyển trạng thái: các hàng và cột còn lại
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Số bước chỉnh sửa tối thiểu = số bước tối thiểu của chèn, xóa, thay thế + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Khoảng cách chỉnh sửa: Quy hoạch động tối ưu không gian */
function editDistanceDPComp(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // Chuyển trạng thái: hàng đầu tiên
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // Chuyển trạng thái: các hàng còn lại
    for (let i = 1; i <= n; i++) {
        // Chuyển trạng thái: cột đầu tiên
        let leftup = dp[0]; // Tạm thời lưu trữ dp[i-1, j-1]
        dp[0] = i;
        // Chuyển trạng thái: các cột còn lại
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
                dp[j] = leftup;
            } else {
                // Số bước chỉnh sửa tối thiểu = số bước tối thiểu của chèn, xóa, thay thế + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // Cập nhật cho dp[i-1, j-1] của vòng tiếp theo
        }
    }
    return dp[m];
}

/* Driver Code */
const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// Tìm kiếm vét cạn
let res = editDistanceDFS(s, t, n, m);
console.log(`Changing ${s} to ${t} requires minimum ${res} edits`);

// Tìm kiếm ghi nhớ
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: m + 1 }, () => -1)
);
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`Changing ${s} to ${t} requires minimum ${res} edits`);

// Quy hoạch động
res = editDistanceDP(s, t);
console.log(`Changing ${s} to ${t} requires minimum ${res} edits`);

// Quy hoạch động tối ưu không gian
res = editDistanceDPComp(s, t);
console.log(`Changing ${s} to ${t} requires minimum ${res} edits`);

export {};
