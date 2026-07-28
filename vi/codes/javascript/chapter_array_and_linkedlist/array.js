/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Truy cập ngẫu nhiên đến phần tử */
function randomAccess(nums) {
    // Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Lấy và trả về phần tử ngẫu nhiên
    const random_num = nums[random_index];
    return random_num;
}

/* Mở rộng độ dài mảng */
// Lưu ý: Array trong JavaScript là mảng động, có thể mở rộng trực tiếp
// Để phục vụ mục đích học tập, hàm này coi Array như một mảng có độ dài cố định
function extend(nums, enlarge) {
    // Khởi tạo một mảng với độ dài đã được mở rộng
    const res = new Array(nums.length + enlarge).fill(0);
    // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Trả về mảng mới đã được mở rộng
    return res;
}

/* Chèn phần tử num vào vị trí index trong mảng */
function insert(nums, num, index) {
    // Dịch chuyển tất cả phần tử từ vị trí index trở đi lùi lại một vị trí
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Gán num cho phần tử tại vị trí index
    nums[index] = num;
}

/* Xóa phần tử tại vị trí index */
function remove(nums, index) {
    // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Duyệt mảng */
function traverse(nums) {
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
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Chương trình chính */
/* Khởi tạo mảng */
const arr = new Array(5).fill(0);
console.log('Array arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('Array nums =', nums);

/* Truy cập ngẫu nhiên đến phần tử */
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
