/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hàng đợi cài đặt dựa trên mảng vòng */
class ArrayQueue {
  private:
    int *nums;       // Mảng dùng để lưu các phần tử của hàng đợi
    int front;       // Con trỏ đầu, trỏ đến phần tử ở đầu hàng đợi
    int queSize;     // Độ dài hàng đợi
    int queCapacity; // Dung lượng hàng đợi

  public:
    ArrayQueue(int capacity) {
        // Khởi tạo mảng
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* Lấy dung lượng của hàng đợi */
    int capacity() {
        return queCapacity;
    }

    /* Lấy độ dài của hàng đợi */
    int size() {
        return queSize;
    }

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty() {
        return size() == 0;
    }

    /* Thêm vào hàng đợi */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // Dùng phép chia lấy dư để đưa rear vòng về đầu mảng sau khi vượt qua cuối mảng
        // Thêm num vào cuối hàng đợi
        int rear = (front + queSize) % queCapacity;
        // Con trỏ đầu dịch chuyển về sau một vị trí
        nums[rear] = num;
        queSize++;
    }

    /* Xóa khỏi hàng đợi */
    int pop() {
        int num = peek();
        // Dịch chuyển con trỏ đầu về sau một vị trí, nếu vượt qua cuối thì quay về đầu mảng
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Truy cập phần tử ở đầu hàng đợi */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* Chuyển mảng thành Vector và trả về */
    vector<int> toVector() {
        // Chỉ chuyển đổi các phần tử hợp lệ
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo hàng đợi */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

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

    /* Kiểm tra mảng vòng */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "After round " << i << " enqueue + dequeue, queue = ";
        printVector(queue->toVector());
    }

    // Giải phóng bộ nhớ
    delete queue;

    return 0;
}
