/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Ngăn xếp cài đặt dựa trên danh sách liên kết */
class LinkedListStack {
  private:
    ListNode *stackTop; // Dùng nút đầu làm đỉnh ngăn xếp
    int stkSize;        // Độ dài ngăn xếp

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Duyệt danh sách liên kết để xóa nút và giải phóng bộ nhớ
        freeMemoryLinkedList(stackTop);
    }

    /* Lấy độ dài của ngăn xếp */
    int size() {
        return stkSize;
    }

    /* Kiểm tra ngăn xếp có rỗng không */
    bool isEmpty() {
        return size() == 0;
    }

    /* Đẩy vào ngăn xếp */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* Lấy ra khỏi ngăn xếp */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // Giải phóng bộ nhớ
        delete tmp;
        stkSize--;
        return num;
    }

    /* Truy cập phần tử ở đỉnh ngăn xếp */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* Chuyển danh sách liên kết thành mảng và trả về */
    vector<int> toVector() {
        ListNode *node = stackTop;
        vector<int> res(size());
        for (int i = res.size() - 1; i >= 0; i--) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo ngăn xếp */
    LinkedListStack *stack = new LinkedListStack();

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
