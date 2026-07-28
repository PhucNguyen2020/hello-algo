/**
 * File: hanota.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Di chuyển một đĩa */
function move(src, tar) {
    // Lấy một đĩa từ đỉnh của src
    const pan = src.pop();
    // Đặt đĩa lên đỉnh của tar
    tar.push(pan);
}

/* Giải bài toán Tháp Hà Nội f(i) */
function dfs(i, src, buf, tar) {
    // Nếu chỉ còn một đĩa trong src, di chuyển trực tiếp nó sang tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar làm trung gian
    dfs(i - 1, src, tar, buf);
    // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
    move(src, tar);
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src làm trung gian
    dfs(i - 1, buf, src, tar);
}

/* Giải bài toán Tháp Hà Nội */
function solveHanota(A, B, C) {
    const n = A.length;
    // Di chuyển n đĩa trên cùng từ A sang C, dùng B làm trung gian
    dfs(n, A, B, C);
}

/* Đoạn mã chạy thử */
// Cuối danh sách là đỉnh của cột
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('In initial state:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('After disk movement is complete:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
