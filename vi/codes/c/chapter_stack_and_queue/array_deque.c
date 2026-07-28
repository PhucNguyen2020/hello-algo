/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Hàng đợi hai đầu cài đặt dựa trên mảng vòng */
typedef struct {
    int *nums;       // Mảng lưu trữ các phần tử của hàng đợi
    int front;       // Con trỏ đầu, trỏ tới phần tử đầu hàng đợi
    int queSize;     // Con trỏ cuối, trỏ tới rear + 1
    int queCapacity; // Dung lượng hàng đợi
} ArrayDeque;

/* Hàm khởi tạo */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Khởi tạo mảng
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* Hàm hủy */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* Lấy dung lượng của hàng đợi hai đầu */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Lấy độ dài của hàng đợi hai đầu */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Kiểm tra hàng đợi hai đầu có rỗng không */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Tính chỉ số trong mảng vòng */
int dequeIndex(ArrayDeque *deque, int i) {
    // Dùng phép chia lấy dư để nối liền đầu và cuối mảng
    // Khi i vượt quá cuối mảng, quay vòng về đầu mảng
    // Khi i vượt quá đầu mảng, quay lại cuối mảng
    return ((i + capacity(deque)) % capacity(deque));
}

/* Vào hàng đợi ở đầu */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Dùng phép chia lấy dư để quay vòng front về cuối mảng sau khi vượt quá đầu mảng
    // Dùng phép chia lấy dư để quay front từ đầu mảng về cuối mảng
    deque->front = dequeIndex(deque, deque->front - 1);
    // Thêm num vào đầu hàng đợi
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Vào hàng đợi ở cuối */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Deque is full\r\n");
        return;
    }
    // Dùng phép chia lấy dư để quay vòng rear về đầu mảng sau khi vượt quá cuối mảng
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Con trỏ front dịch chuyển lùi lại một vị trí
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Truy cập phần tử đầu hàng đợi */
int peekFirst(ArrayDeque *deque) {
    // Lỗi truy cập: hàng đợi hai đầu đang rỗng
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Đoạn mã điều khiển chính */
int peekLast(ArrayDeque *deque) {
    // Lỗi truy cập: hàng đợi hai đầu đang rỗng
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Ra khỏi hàng đợi ở cuối */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Dịch con trỏ front tiến lên một vị trí
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Truy cập phần tử cuối hàng đợi */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Trả về mảng để in ra */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Truy cập phần tử đầu hàng đợi */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Double-ended queue deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Cập nhật phần tử */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Rear element peekLast = %d\r\n", peekLastNum);

    /* Các phần tử vào hàng đợi */
    pushLast(deque, 4);
    printf("After element 4 enqueues at rear, deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("After element 1 enqueues at front, deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Phần tử ra khỏi hàng đợi */
    int popLastNum = popLast(deque);
    printf("Dequeue from rear = %d, deque after rear dequeue = ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Dequeue from front = %d, deque after front dequeue = ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Lấy độ dài của hàng đợi */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty = empty(deque);
    printf("Is queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Giải phóng bộ nhớ
    delArrayDeque(deque);

    return 0;
}