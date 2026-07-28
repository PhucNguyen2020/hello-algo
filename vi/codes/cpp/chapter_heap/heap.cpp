/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Phần tử vào heap
    cout << "\nAfter element " << val << " pushes to heap" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nAfter heap top element " << val << " pops from heap" << endl;
    printHeap(heap);
}

/* Mã chạy chương trình */
int main() {
    /* Khởi tạo heap */
    // Mô-đun heapq của Python mặc định triển khai min heap
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Có thể lấy giá trị đối của các phần tử trước khi đưa vào heap, nhờ đó đảo ngược quan hệ lớn nhỏ, từ đó triển khai max heap
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nThe following test cases are for max heap" << endl;

    /* Phần tử vào heap */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Lấy phần tử đỉnh heap */
    int peek = maxHeap.top();
    cout << "\nHeap top element is " << peek << endl;

    /* Độ phức tạp thời gian là O(n), không phải O(nlogn) */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Lấy kích thước heap */
    int size = maxHeap.size();
    cout << "\nHeap size is " << size << endl;

    /* Kiểm tra heap có rỗng hay không */
    bool isEmpty = maxHeap.empty();
    cout << "\nIs heap empty " << isEmpty << endl;

    /* Nhập danh sách và xây dựng heap */
    // Độ phức tạp thời gian là O(n), không phải O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "After input list and building min heap" << endl;
    printHeap(minHeap);

    return 0;
}
