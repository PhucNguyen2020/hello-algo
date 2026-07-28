/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Ngăn xếp cài đặt dựa trên danh sách liên kết */
typedef struct {
    ListNode *top; // Dùng nút đầu làm đỉnh ngăn xếp
    int size;      // Độ dài ngăn xếp
} LinkedListStack;

/* Hàm khởi tạo */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* Hàm hủy */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* Lấy độ dài của ngăn xếp */
int size(LinkedListStack *s) {
    return s->size;
}

/* Kiểm tra ngăn xếp có rỗng không */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Đẩy vào ngăn xếp */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Cập nhật trường con trỏ của nút mới
    node->val = num;     // Cập nhật trường dữ liệu của nút mới
    s->top = node;       // Cập nhật đỉnh ngăn xếp
    s->size++;           // Cập nhật kích thước ngăn xếp
}

/* Truy cập phần tử đỉnh ngăn xếp */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Lấy ra khỏi ngăn xếp */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Giải phóng bộ nhớ
    free(tmp);
    s->size--;
    return val;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Khởi tạo ngăn xếp */
    LinkedListStack *stack = newLinkedListStack();

    /* Đẩy phần tử vào ngăn xếp */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Stack stack = ");
    printLinkedList(stack->top);

    /* Truy cập phần tử đỉnh ngăn xếp */
    int val = peek(stack);
    printf("Top element top = %d\r\n", val);

    /* Lấy phần tử ra khỏi ngăn xếp */
    val = pop(stack);
    printf("Pop element pop = %d, stack after pop = ", val);
    printLinkedList(stack->top);

    /* Lấy độ dài của ngăn xếp */
    printf("Stack size = %d\n", size(stack));

    /* Kiểm tra có rỗng không */
    bool empty = isEmpty(stack);
    printf("Is stack empty = %s\n", empty ? "true" : "false");

    // Giải phóng bộ nhớ
    delLinkedListStack(stack);

    return 0;
}
