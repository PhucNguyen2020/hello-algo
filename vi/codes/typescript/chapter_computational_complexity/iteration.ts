/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Vòng lặp for */
function forLoop(n: number): number {
    let res = 0;
    // Tính tổng 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Vòng lặp while */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Cập nhật biến điều kiện
    }
    return res;
}

/* Vòng lặp while (hai lần cập nhật) */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Cập nhật biến điều kiện
        i++;
        i *= 2;
    }
    return res;
}

/* Vòng lặp for lồng nhau */
function nestedForLoop(n: number): string {
    let res = '';
    // Lặp i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Lặp j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver Code */
const n = 5;
let res: number;

res = forLoop(n);
console.log(`For loop sum result res = ${res}`);

res = whileLoop(n);
console.log(`While loop sum result res = ${res}`);

res = whileLoopII(n);
console.log(`While loop (two updates) sum result res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Nested for loop traversal result ${resStr}`);

export {};
