/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Ngăn xếp cài đặt dựa trên mảng */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* Lấy độ dài của ngăn xếp */
    int size() {
        return stack.size();
    }

    /* Kiểm tra ngăn xếp có rỗng không */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* Đẩy vào ngăn xếp */
    void push(int num) {
        stack.push_back(num);
    }

    /* Lấy ra khỏi ngăn xếp */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* Truy cập phần tử ở đỉnh ngăn xếp */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stack.back();
    }

    /* Trả về Vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo ngăn xếp */
    ArrayStack *stack = new ArrayStack();

    /* Đẩy phần tử vào ngăn xếp */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Stack stack = ";
    printVector(stack->toVector());

    /* Truy cập phần tử ở đỉnh ngăn xếp */
    int top = stack->top();
    cout << "Stack top element top = " << top << endl;

    /* Lấy phần tử ra khỏi ngăn xếp */
    top = stack->pop();
    cout << "Pop element pop = " << top << ", after pop, stack = ";
    printVector(stack->toVector());

    /* Lấy độ dài của ngăn xếp */
    int size = stack->size();
    cout << "Stack length size = " << size << endl;

    /* Kiểm tra ngăn xếp có rỗng không */
    bool empty = stack->isEmpty();
    cout << "Stack is empty = " << empty << endl;

    // Giải phóng bộ nhớ
    delete stack;

    return 0;
}
