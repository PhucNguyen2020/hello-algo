/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Khởi tạo ngăn xếp */
    stack<int> stack;

    /* Đẩy phần tử vào ngăn xếp */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Stack stack = ";
    printStack(stack);

    /* Truy cập phần tử ở đỉnh ngăn xếp */
    int top = stack.top();
    cout << "Stack top element top = " << top << endl;

    /* Lấy phần tử ra khỏi ngăn xếp */
    stack.pop(); // Không có giá trị trả về
    cout << "Pop element pop = " << top << ", after pop, stack = ";
    printStack(stack);

    /* Lấy độ dài của ngăn xếp */
    int size = stack.size();
    cout << "Stack length size = " << size << endl;

    /* Kiểm tra ngăn xếp có rỗng không */
    bool empty = stack.empty();
    cout << "Stack is empty = " << empty << endl;

    return 0;
}
