/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Nút của danh sách liên kết đôi */
typedef struct DoublyListNode {
    int val;                     // Giá trị của nút
    struct DoublyListNode *next; // Nút kế tiếp
    struct DoublyListNode *prev; // Nút liền trước
} DoublyListNode;

/* Hàm khởi tạo */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* Hàm hủy */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* Hàng đợi hai đầu cài đặt dựa trên danh sách liên kết đôi */
typedef struct {
    DoublyListNode *front, *rear; // Nút đầu front, nút cuối rear
    int queSize;                  // Độ dài của hàng đợi hai đầu
} LinkedListDeque;

/* Hàm khởi tạo */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* Hàm hủy */
void delLinkedListdeque(LinkedListDeque *deque) {
    // Giải phóng tất cả các nút
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Giải phóng cấu trúc hàng đợi hai đầu
    free(deque);
}

/* Lấy độ dài của hàng đợi */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Kiểm tra hàng đợi có rỗng không */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Vào hàng đợi */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // Nếu danh sách rỗng, cho cả front và rear cùng trỏ tới node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Thao tác vào hàng đợi ở đầu
    else if (isFront) {
        // Thêm node vào đầu danh sách liên kết
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Cập nhật nút đầu
    }
    // Thao tác vào hàng đợi ở cuối
    else {
        // Thêm node vào cuối danh sách liên kết
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Cập nhật độ dài hàng đợi
}

/* Vào hàng đợi ở đầu */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Vào hàng đợi ở cuối */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Truy cập phần tử đầu hàng đợi */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Đoạn mã điều khiển chính */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Ra khỏi hàng đợi */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // Lưu tạm giá trị của nút đầu
    if (isFront) {
        val = peekFirst(deque); // Xóa nút đầu
        DoublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
        }
        delDoublyListNode(deque->front);
        deque->front = fNext; // Cập nhật nút đầu
    }
    // Lưu tạm giá trị của nút cuối
    else {
        val = peekLast(deque); // Xóa nút cuối
        DoublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
        }
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Cập nhật nút cuối
    }
    deque->queSize--; // Cập nhật độ dài hàng đợi
    return val;
}

/* Ra khỏi hàng đợi ở đầu */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Truy cập phần tử cuối hàng đợi */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* In hàng đợi */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Sao chép dữ liệu từ danh sách sang mảng
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Lấy độ dài của hàng đợi hai đầu */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Double-ended queue deque = ");
    printLinkedListDeque(deque);

    /* Cập nhật phần tử */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Front element peekLast = %d\r\n", peekLastNum);

    /* Các phần tử vào hàng đợi */
    pushLast(deque, 4);
    printf("After element 4 enqueues at back, deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("After element 1 enqueues at front, deque =");
    printLinkedListDeque(deque);

    /* Phần tử ra khỏi hàng đợi */
    int popLastNum = popLast(deque);
    printf("Dequeue from rear popLast = %d, deque after rear dequeue = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Dequeue from front popFirst = %d, deque after front dequeue = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Lấy độ dài của hàng đợi */
    int dequeSize = size(deque);
    printf("Deque size = %d\r\n", dequeSize);

    /* Kiểm tra hàng đợi có rỗng không */
    bool isEmpty = empty(deque);
    printf("Is deque empty = %s\r\n", isEmpty ? "true" : "false");

    // Giải phóng bộ nhớ
    delLinkedListdeque(deque);

    return 0;
}
