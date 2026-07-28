/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hàng đợi cài đặt dựa trên danh sách liên kết */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // Nút đầu front, nút cuối rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Duyệt danh sách liên kết để xóa nút và giải phóng bộ nhớ
        freeMemoryLinkedList(front);
    }

    /* Lấy độ dài của hàng đợi */
    int size() {
        return queSize;
    }

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Thêm vào hàng đợi */
    void push(int num) {
        // Thêm num sau nút cuối
        ListNode *node = new ListNode(num);
        // Nếu hàng đợi rỗng, cho cả front và rear trỏ đến node
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // Nếu hàng đợi không rỗng, thêm node sau nút cuối
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Xóa khỏi hàng đợi */
    int pop() {
        int num = peek();
        // Xóa nút đầu
        ListNode *tmp = front;
        front = front->next;
        // Giải phóng bộ nhớ
        delete tmp;
        queSize--;
        return num;
    }

    /* Truy cập phần tử ở đầu hàng đợi */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* Chuyển danh sách liên kết thành Vector và trả về */
    vector<int> toVector() {
        ListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo hàng đợi */
    LinkedListQueue *queue = new LinkedListQueue();

    /* Thêm phần tử vào hàng đợi */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Queue queue = ";
    printVector(queue->toVector());

    /* Truy cập phần tử ở đầu hàng đợi */
    int peek = queue->peek();
    cout << "Front element peek = " << peek << endl;

    /* Xóa phần tử khỏi hàng đợi */
    peek = queue->pop();
    cout << "Dequeue element pop = " << peek << ", after dequeue, queue = ";
    printVector(queue->toVector());

    /* Lấy độ dài của hàng đợi */
    int size = queue->size();
    cout << "Queue length size = " << size << endl;

    /* Kiểm tra hàng đợi có rỗng không */
    bool empty = queue->isEmpty();
    cout << "Queue is empty = " << empty << endl;

    // Giải phóng bộ nhớ
    delete queue;

    return 0;
}
