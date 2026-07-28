/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Truy cập ngẫu nhiên một phần tử */
function randomAccess(nums: number[]): number {
    // Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Lấy và trả về phần tử ngẫu nhiên
    const random_num = nums[random_index];
    return random_num;
}

/* Mở rộng độ dài mảng */
// Lưu ý: Array của TypeScript là mảng động, có thể mở rộng trực tiếp
// Vì mục đích học tập, hàm này coi Array như mảng có độ dài cố định
function extend(nums: number[], enlarge: number): number[] {
    // Khởi tạo một mảng có độ dài đã mở rộng
    const res = new Array(nums.length + enlarge).fill(0);
    // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Trả về mảng mới đã mở rộng
    return res;
}

/* Chèn phần tử num vào vị trí index trong mảng */
function insert(nums: number[], num: number, index: number): void {
    // Dịch chuyển tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Gán num cho phần tử ở vị trí index
    nums[index] = num;
}

/* Xóa phần tử ở vị trí index */
function remove(nums: number[], index: number): void {
    // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Duyệt mảng */
function traverse(nums: number[]): void {
    let count = 0;
    // Duyệt mảng theo chỉ số
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // Duyệt trực tiếp các phần tử của mảng
    for (const num of nums) {
        count += num;
    }
}

/* Tìm phần tử được chỉ định trong mảng */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
/* Khởi tạo mảng */
const arr: number[] = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Truy cập ngẫu nhiên */
let random_num = randomAccess(nums);
console.log('Get random element in nums', random_num);

/* Mở rộng độ dài mảng */
nums = extend(nums, 3);
console.log('Extend array length to 8, get nums =', nums);

/* Chèn phần tử */
insert(nums, 6, 3);
console.log('Insert number 6 at index 3, get nums =', nums);

/* Xóa phần tử */
remove(nums, 2);
console.log('Remove element at index 2, get nums =', nums);

/* Duyệt mảng */
traverse(nums);

/* Tìm phần tử */
let index = find(nums, 3);
console.log('Find element 3 in nums, get index =', index);

export {};
