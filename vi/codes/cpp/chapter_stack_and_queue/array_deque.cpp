/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hàng đợi hai đầu cài đặt dựa trên mảng vòng */
class ArrayDeque {
  private:
    vector<int> nums; // Mảng dùng để lưu các phần tử của hàng đợi hai đầu
    int front;        // Con trỏ đầu, trỏ đến phần tử ở đầu hàng đợi
    int queSize;      // Độ dài hàng đợi hai đầu

  public:
    /* Hàm khởi tạo */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* Lấy dung lượng của hàng đợi hai đầu */
    int capacity() {
        return nums.size();
    }

    /* Lấy độ dài của hàng đợi hai đầu */
    int size() {
        return queSize;
    }

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Tính chỉ số mảng vòng */
    int index(int i) {
        // Dùng phép chia lấy dư để nối đầu và cuối mảng lại với nhau
        // Khi i vượt qua cuối mảng, quay về đầu
        // Khi i vượt qua đầu mảng, quay về cuối
        return (i + capacity()) % capacity();
    }

    /* Thêm phần tử vào đầu hàng đợi */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Dùng phép chia lấy dư để đưa front vòng về cuối mảng sau khi vượt qua đầu mảng
        // Thêm num vào đầu hàng đợi
        front = index(front - 1);
        // Thêm num vào đầu hàng đợi
        nums[front] = num;
        queSize++;
    }

    /* Thêm phần tử vào cuối hàng đợi */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Dùng phép chia lấy dư để đưa rear vòng về đầu mảng sau khi vượt qua cuối mảng
        int rear = index(front + queSize);
        // Con trỏ đầu dịch chuyển về sau một vị trí
        nums[rear] = num;
        queSize++;
    }

    /* Xóa phần tử ở đầu hàng đợi */
    int popFirst() {
        int num = peekFirst();
        // Dịch chuyển con trỏ đầu về sau một vị trí
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Xóa phần tử ở cuối hàng đợi */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Truy cập phần tử ở đầu hàng đợi */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return nums[front];
    }

    /* Truy cập phần tử ở cuối hàng đợi */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        // Tính chỉ số của phần tử cuối
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Trả về mảng để in ra */
    vector<int> toVector() {
        // Chỉ chuyển đổi các phần tử hợp lệ
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo hàng đợi hai đầu */
    ArrayDeque *deque = new ArrayDeque(10);
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
    cout << "After element 4 enqueues at rear, deque = ";
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
    return 0;
}
