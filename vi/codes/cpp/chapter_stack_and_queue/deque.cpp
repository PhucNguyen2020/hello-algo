/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Khởi tạo hàng đợi hai đầu */
    deque<int> deque;

    /* Thêm phần tử vào hàng đợi */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Double-ended queue deque = ";
    printDeque(deque);

    /* Truy cập phần tử */
    int front = deque.front();
    cout << "Front element front = " << front << endl;
    int back = deque.back();
    cout << "Back element back = " << back << endl;

    /* Xóa phần tử khỏi hàng đợi */
    deque.pop_front();
    cout << "Front dequeue element popFront = " << front << ", after front dequeue, deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Rear dequeue element popLast = " << back << ", after rear dequeue, deque = ";
    printDeque(deque);

    /* Lấy độ dài của hàng đợi hai đầu */
    int size = deque.size();
    cout << "Double-ended queue length size = " << size << endl;

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    bool empty = deque.empty();
    cout << "Double-ended queue is empty = " << empty << endl;

    return 0;
}
