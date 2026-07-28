/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Hàng đợi cài đặt dựa trên danh sách liên kết */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* Hàm khởi tạo */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* Hàm hủy */
void delLinkedListQueue(LinkedListQueue *queue) {
    // Giải phóng tất cả các nút
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // Giải phóng cấu trúc hàng đợi
    free(queue);
}

/* Lấy độ dài của hàng đợi */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* Kiểm tra hàng đợi có rỗng không */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* Vào hàng đợi */
void push(LinkedListQueue *queue, int num) {
    // Thêm nút vào cuối
    ListNode *node = newListNode(num);
    // Nếu hàng đợi rỗng, cho cả front và rear cùng trỏ tới nút này
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // Nếu hàng đợi không rỗng, thêm nút vào sau nút cuối
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* Truy cập phần tử đầu hàng đợi */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* Ra khỏi hàng đợi */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* In hàng đợi */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // Sao chép dữ liệu từ danh sách sang mảng
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Truy cập phần tử đầu hàng đợi */
    LinkedListQueue *queue = newLinkedListQueue();

    /* Các phần tử vào hàng đợi */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Queue queue = ");
    printLinkedListQueue(queue);

    /* Truy cập phần tử đầu hàng đợi */
    int peekNum = peek(queue);
    printf("Front element peek = %d\r\n", peekNum);

    /* Phần tử ra khỏi hàng đợi */
    peekNum = pop(queue);
    printf("Dequeue element pop = %d, queue after dequeue = ", peekNum);
    printLinkedListQueue(queue);

    /* Lấy độ dài của hàng đợi */
    int queueSize = size(queue);
    printf("Queue size = %d\r\n", queueSize);

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty = empty(queue);
    printf("Is queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Giải phóng bộ nhớ
    delLinkedListQueue(queue);

    return 0;
}
