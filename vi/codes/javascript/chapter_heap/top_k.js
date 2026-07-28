/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* Phần tử vào đống */
function pushMinHeap(maxHeap, val) {
    // Phủ định phần tử
    maxHeap.push(-val);
}

/* Phần tử ra khỏi đống */
function popMinHeap(maxHeap) {
    // Phủ định phần tử
    return -maxHeap.pop();
}

/* Truy cập phần tử đỉnh đống */
function peekMinHeap(maxHeap) {
    // Phủ định phần tử
    return -maxHeap.peek();
}

/* Trích xuất các phần tử từ đống */
function getMinHeap(maxHeap) {
    // Phủ định phần tử
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* Tìm k phần tử lớn nhất trong mảng dựa trên đống */
function topKHeap(nums, k) {
    // Mô-đun heapq của Python cài đặt đống nhỏ nhất theo mặc định
    // Lưu ý: Chúng ta phủ định tất cả phần tử của đống để mô phỏng đống nhỏ nhất bằng đống lớn nhất
    const maxHeap = new MaxHeap([]);
    // Đưa k phần tử đầu tiên của mảng vào đống
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Bắt đầu từ phần tử thứ (k+1), duy trì độ dài đống là k
    for (let i = k; i < nums.length; i++) {
        // Nếu phần tử hiện tại lớn hơn phần tử đỉnh đống, phần tử đỉnh đống ra khỏi đống, phần tử hiện tại vào đống
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Trả về các phần tử trong đống
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`The largest ${k} elements are`, res);
