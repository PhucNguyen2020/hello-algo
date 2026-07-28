/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Lớp đống lớn nhất (max heap) */
class MaxHeap {
    #maxHeap;

    /* Hàm khởi tạo, xây dựng đống rỗng hoặc xây dựng đống từ danh sách đầu vào */
    constructor(nums) {
        // Thêm các phần tử của danh sách vào đống nguyên trạng
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Vun đống (heapify) tất cả nút trừ các nút lá
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* Lấy chỉ số của nút con trái */
    #left(i) {
        return 2 * i + 1;
    }

    /* Lấy chỉ số của nút con phải */
    #right(i) {
        return 2 * i + 2;
    }

    /* Lấy chỉ số của nút cha */
    #parent(i) {
        return Math.floor((i - 1) / 2); // Phép chia lấy phần nguyên
    }

    /* Hoán đổi phần tử */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* Lấy kích thước đống */
    size() {
        return this.#maxHeap.length;
    }

    /* Kiểm tra đống có rỗng không */
    isEmpty() {
        return this.size() === 0;
    }

    /* Truy cập phần tử đỉnh đống */
    peek() {
        return this.#maxHeap[0];
    }

    /* Phần tử vào đống */
    push(val) {
        // Thêm nút
        this.#maxHeap.push(val);
        // Vun đống từ dưới lên trên
        this.#siftUp(this.size() - 1);
    }

    /* Bắt đầu từ nút i, vun đống từ dưới lên trên */
    #siftUp(i) {
        while (true) {
            // Lấy nút cha của nút i
            const p = this.#parent(i);
            // Khi "vượt qua nút gốc" hoặc "nút không cần sửa chữa", kết thúc vun đống
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Hoán đổi hai nút
            this.#swap(i, p);
            // Lặp vun đống lên trên
            i = p;
        }
    }

    /* Phần tử ra khỏi đống */
    pop() {
        // Xử lý trường hợp đống rỗng
        if (this.isEmpty()) throw new Error('Heap is empty');
        // Hoán đổi nút gốc với nút cuối cùng
        this.#swap(0, this.size() - 1);
        // Xóa nút
        const val = this.#maxHeap.pop();
        // Vun đống từ trên xuống dưới
        this.#siftDown(0);
        // Trả về phần tử đỉnh đống
        return val;
    }

    /* Bắt đầu từ nút i, vun đống từ trên xuống dưới */
    #siftDown(i) {
        while (true) {
            // Nếu nút i là lớn nhất hoặc chỉ số l, r vượt biên, không cần tiếp tục vun đống, dừng lại
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // Nếu không cần hoán đổi thì dừng vòng lặp
            if (ma === i) break;
            // Hoán đổi hai nút
            this.#swap(i, ma);
            // Lặp vun đống xuống dưới
            i = ma;
        }
    }

    /* Driver Code */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Trích xuất các phần tử từ đống */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver Code */
if (require.main === module) {
    /* Có thể phủ định các phần tử trước khi đưa vào đống để đảo ngược quan hệ lớn nhỏ, từ đó cài đặt được đống nhỏ nhất */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nAfter inputting list and building heap');
    maxHeap.print();

    /* Kiểm tra đống có rỗng không */
    let peek = maxHeap.peek();
    console.log(`\nHeap top element is ${peek}`);

    /* Phần tử vào đống */
    let val = 7;
    maxHeap.push(val);
    console.log(`\nAfter element ${val} pushes to heap`);
    maxHeap.print();

    /* Độ phức tạp thời gian là O(n), không phải O(nlogn) */
    peek = maxHeap.pop();
    console.log(`\nAfter heap top element ${peek} pops from heap`);
    maxHeap.print();

    /* Lấy kích thước đống */
    let size = maxHeap.size();
    console.log(`\nHeap size is ${size}`);

    /* Kiểm tra đống có rỗng không */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nIs heap empty ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
