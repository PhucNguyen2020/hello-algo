/**
 * File: binary_search_recur.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Tìm kiếm nhị phân: bài toán con f(i, j) */
function dfs(nums, target, i, j) {
    // Nếu khoảng rỗng, tức là không có phần tử mục tiêu, trả về -1
    if (i > j) {
        return -1;
    }
    // Tính chỉ số điểm giữa m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // Đệ quy bài toán con f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Đệ quy bài toán con f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
        return m;
    }
}

/* Tìm kiếm nhị phân */
function binarySearch(nums, target) {
    const n = nums.length;
    // Giải bài toán f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Đoạn mã chạy thử */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu)
const index = binarySearch(nums, target);
console.log(`Index of target element 6 is ${index}`);
