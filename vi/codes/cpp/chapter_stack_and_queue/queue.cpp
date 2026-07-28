/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Khởi tạo hàng đợi */
    queue<int> queue;

    /* Thêm phần tử vào hàng đợi */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Queue queue = ";
    printQueue(queue);

    /* Truy cập phần tử ở đầu hàng đợi */
    int front = queue.front();
    cout << "Front element front = " << front << endl;

    /* Xóa phần tử khỏi hàng đợi */
    queue.pop();
    cout << "Dequeue element front = " << front << ", after dequeue, queue = ";
    printQueue(queue);

    /* Lấy độ dài của hàng đợi */
    int size = queue.size();
    cout << "Queue length size = " << size << endl;

    /* Kiểm tra hàng đợi có rỗng không */
    bool empty = queue.empty();
    cout << "Queue is empty = " << empty << endl;

    return 0;
}
