/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Sinh một mảng gồm các phần tử { 1, 2, ..., n } với thứ tự đã bị xáo trộn */
function randomNumbers(n) {
    const nums = Array(n);
    // Sinh mảng nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Xáo trộn ngẫu nhiên các phần tử của mảng
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* Tìm chỉ số của số 1 trong mảng nums */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // Khi phần tử 1 nằm ở đầu mảng, đạt được độ phức tạp thời gian tốt nhất O(1)
        // Khi phần tử 1 nằm ở cuối mảng, đạt được độ phức tạp thời gian xấu nhất O(n)
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Đoạn mã chạy thử */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\nArray [ 1, 2, ..., n ] after shuffling = [' + nums.join(', ') + ']');
    console.log('Index of number 1 is ' + index);
}
