/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm k phần tử lớn nhất trong mảng dựa trên heap */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Mô-đun heapq của Python mặc định triển khai min heap
    priority_queue<int, vector<int>, greater<int>> heap;
    // Đưa k phần tử đầu tiên của mảng vào heap
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // Bắt đầu từ phần tử thứ (k+1), duy trì độ dài heap là k
    for (int i = k; i < nums.size(); i++) {
        // Nếu phần tử hiện tại lớn hơn phần tử đỉnh, phần tử đỉnh ra khỏi heap, phần tử hiện tại vào heap
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// Mã chạy chương trình
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "The largest " << k << " elements are: ";
    printHeap(res);

    return 0;
}
