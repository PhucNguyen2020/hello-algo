/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Nút danh sách liên kết đôi */
struct DoublyListNode {
    int val;              // Giá trị nút
    DoublyListNode *next; // Con trỏ nút kế tiếp
    DoublyListNode *prev; // Con trỏ nút trước đó
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Hàng đợi hai đầu cài đặt dựa trên danh sách liên kết đôi */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // Nút đầu front, nút cuối rear
    int queSize = 0;              // Độ dài hàng đợi hai đầu

  public:
    /* Hàm khởi tạo */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Hàm hủy */
    ~LinkedListDeque() {
        // Duyệt danh sách liên kết để xóa nút và giải phóng bộ nhớ
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Lấy độ dài của hàng đợi hai đầu */
    int size() {
        return queSize;
    }

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    bool isEmpty() {
        return size() == 0;
    }

    /* Thao tác thêm vào hàng đợi */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // Nếu danh sách liên kết rỗng, cho cả front và rear trỏ đến node
        if (isEmpty())
            front = rear = node;
        // Thao tác thêm vào đầu hàng đợi
        else if (isFront) {
            // Thêm node vào đầu danh sách liên kết
            front->prev = node;
            node->next = front;
            front = node; // Cập nhật nút đầu
        // Thao tác thêm vào cuối hàng đợi
        } else {
            // Thêm node vào cuối danh sách liên kết
            rear->next = node;
            node->prev = rear;
            rear = node; // Cập nhật nút cuối
        }
        queSize++; // Cập nhật độ dài hàng đợi
    }

    /* Thêm phần tử vào đầu hàng đợi */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Thêm phần tử vào cuối hàng đợi */
    void pushLast(int num) {
        push(num, false);
    }

    /* Thao tác xóa khỏi hàng đợi */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        int val;
        // Lưu tạm giá trị nút đầu
        if (isFront) {
            val = front->val; // Xóa nút đầu
            // Xóa nút đầu
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // Cập nhật nút đầu
        // Lưu tạm giá trị nút cuối
        } else {
            val = rear->val; // Xóa nút cuối
            // Cập nhật nút cuối
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // Cập nhật nút cuối
        }
        queSize--; // Cập nhật độ dài hàng đợi
        return val;
    }

    /* Xóa phần tử ở đầu hàng đợi */
    int popFirst() {
        return pop(true);
    }

    /* Xóa phần tử ở cuối hàng đợi */
    int popLast() {
        return pop(false);
    }

    /* Truy cập phần tử ở đầu hàng đợi */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return front->val;
    }

    /* Truy cập phần tử ở cuối hàng đợi */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return rear->val;
    }

    /* Trả về mảng để in ra */
    vector<int> toVector() {
        DoublyListNode *node = front;
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
    /* Khởi tạo hàng đợi hai đầu */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* Truy cập phần tử */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element peekLast = " << peekLast << endl;

    /* Thêm phần tử vào hàng đợi */
    deque->pushLast(4);
    cout << "After element 4 enqueues at back, deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After element 1 enqueues at front, deque = ";
    printVector(deque->toVector());

    /* Xóa phần tử khỏi hàng đợi */
    int popLast = deque->popLast();
    cout << "Rear dequeue element = " << popLast << ", after rear dequeue, deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Front dequeue element = " << popFirst << ", after front dequeue, deque = ";
    printVector(deque->toVector());

    /* Lấy độ dài của hàng đợi hai đầu */
    int size = deque->size();
    cout << "Double-ended queue length size = " << size << endl;

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    bool isEmpty = deque->isEmpty();
    cout << "Double-ended queue is empty = " << boolalpha << isEmpty << endl;

    // Giải phóng bộ nhớ
    delete deque;

    return 0;
}
