/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/* Khởi tạo danh sách */
const nums: number[] = [1, 3, 2, 5, 4];
console.log(`List nums = ${nums}`);

/* Truy cập phần tử */
const num: number = nums[1];
console.log(`Access element at index 1, get num = ${num}`);

/* Cập nhật phần tử */
nums[1] = 0;
console.log(`Update element at index 1 to 0, get nums = ${nums}`);

/* Xóa toàn bộ danh sách */
nums.length = 0;
console.log(`After clearing list, nums = ${nums}`);

/* Thêm phần tử vào cuối */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`After adding elements, nums = ${nums}`);

/* Chèn phần tử vào giữa danh sách */
nums.splice(3, 0, 6);
console.log(`Insert number 6 at index 3, get nums = ${nums}`);

/* Xóa phần tử */
nums.splice(3, 1);
console.log(`Delete element at index 3, get nums = ${nums}`);

/* Duyệt danh sách theo chỉ số */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* Duyệt trực tiếp các phần tử của danh sách */
count = 0;
for (const x of nums) {
    count += x;
}

/* Nối hai danh sách */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`After concatenating list nums1 to nums, get nums = ${nums}`);

/* Sắp xếp danh sách */
nums.sort((a, b) => a - b);
console.log(`After sorting list, nums = ${nums}`);

export {};
