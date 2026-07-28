/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Độ phức tạp thời gian hằng số */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Độ phức tạp thời gian tuyến tính */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Độ phức tạp thời gian tuyến tính (duyệt mảng) */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // Số lần lặp tỉ lệ thuận với độ dài mảng
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian bậc hai */
function quadratic(n: number): number {
    let count = 0;
    // Số lần lặp liên quan đến kích thước dữ liệu n theo quan hệ bậc hai
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Độ phức tạp thời gian bậc hai (sắp xếp nổi bọt) */
function bubbleSort(nums: number[]): number {
    let count = 0; // Bộ đếm
    // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối bên phải của phạm vi đó
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Hoán đổi nums[j] và nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Hoán đổi phần tử bao gồm 3 thao tác đơn vị
            }
        }
    }
    return count;
}

/* Độ phức tạp thời gian theo cấp số nhân (triển khai bằng vòng lặp) */
function exponential(n: number): number {
    let count = 0,
        base = 1;
    // Mỗi vòng các ô nhân đôi, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Độ phức tạp thời gian theo cấp số nhân (triển khai đệ quy) */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Độ phức tạp thời gian logarit (triển khai bằng vòng lặp) */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian logarit (triển khai đệ quy) */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Độ phức tạp thời gian tuyến tính-logarit */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian giai thừa (triển khai đệ quy) */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // Chia từ 1 thành n
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
const n = 8;
console.log('Input data size n = ' + n);

let count = constant(n);
console.log('Constant order operation count = ' + count);

count = linear(n);
console.log('Linear order operation count = ' + count);
count = arrayTraversal(new Array(n));
console.log('Linear order (array traversal) operation count = ' + count);

count = quadratic(n);
console.log('Quadratic order operation count = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Quadratic order (bubble sort) operation count = ' + count);

count = exponential(n);
console.log('Exponential order (loop implementation) operation count = ' + count);
count = expRecur(n);
console.log('Exponential order (recursive implementation) operation count = ' + count);

count = logarithmic(n);
console.log('Logarithmic order (loop implementation) operation count = ' + count);
count = logRecur(n);
console.log('Logarithmic order (recursive implementation) operation count = ' + count);

count = linearLogRecur(n);
console.log('Linearithmic order (recursive implementation) operation count = ' + count);

count = factorialRecur(n);
console.log('Factorial order (recursive implementation) operation count = ' + count);

export {};
