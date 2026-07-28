/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Hàng đợi cài đặt dựa trên mảng vòng */
typedef struct {
    int *nums;       // Mảng lưu trữ các phần tử của hàng đợi
    int front;       // Con trỏ đầu, trỏ tới phần tử đầu hàng đợi
    int queSize;     // Số lượng phần tử hiện có trong hàng đợi
    int queCapacity; // Dung lượng hàng đợi
} ArrayQueue;

/* Hàm khởi tạo */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Khởi tạo mảng
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* Hàm hủy */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* Lấy dung lượng của hàng đợi */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Lấy độ dài của hàng đợi */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Kiểm tra hàng đợi có rỗng không */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Truy cập phần tử đầu hàng đợi */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Vào hàng đợi */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("Queue is full\r\n");
        return;
    }
    // Dùng phép chia lấy dư để quay vòng rear về đầu mảng sau khi vượt quá cuối mảng
    // Thêm num vào cuối hàng đợi
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Con trỏ front dịch chuyển lùi lại một vị trí
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Ra khỏi hàng đợi */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Dịch con trỏ front tiến lên một vị trí, nếu vượt quá cuối mảng thì quay lại đầu mảng
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Trả về mảng để in ra */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Truy cập phần tử đầu hàng đợi */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Các phần tử vào hàng đợi */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Queue queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Truy cập phần tử đầu hàng đợi */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Phần tử ra khỏi hàng đợi */
    peekNum = pop(queue);
    printf("Dequeue element pop = %d, queue after dequeue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Lấy độ dài của hàng đợi */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty = empty(queue);
    printf("Is queue empty = %s\r\n", isEmpty ? "true" : "false");

    /* Kiểm tra mảng vòng */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("After round %d enqueue + dequeue, queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Giải phóng bộ nhớ
    delArrayQueue(queue);

    return 0;
}
