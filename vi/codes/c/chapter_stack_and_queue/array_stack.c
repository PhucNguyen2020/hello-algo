/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Ngăn xếp cài đặt dựa trên mảng */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* Hàm khởi tạo */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // Khởi tạo với dung lượng lớn để tránh phải mở rộng
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* Hàm hủy */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* Lấy độ dài của ngăn xếp */
int size(ArrayStack *stack) {
    return stack->size;
}

/* Kiểm tra ngăn xếp có rỗng không */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* Đẩy vào ngăn xếp */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("Stack is full\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* Truy cập phần tử đỉnh ngăn xếp */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* Lấy ra khỏi ngăn xếp */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Khởi tạo ngăn xếp */
    ArrayStack *stack = newArrayStack();

    /* Đẩy phần tử vào ngăn xếp */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("Stack stack = ");
    printArray(stack->data, stack->size);

    /* Truy cập phần tử đỉnh ngăn xếp */
    int val = peek(stack);
    printf("Top element top = %d\n", val);

    /* Lấy phần tử ra khỏi ngăn xếp */
    val = pop(stack);
    printf("Pop element pop = %d, stack after pop = ", val);
    printArray(stack->data, stack->size);

    /* Lấy độ dài của ngăn xếp */
    int size = stack->size;
    printf("Stack size = %d\n", size);

    /* Kiểm tra có rỗng không */
    bool empty = isEmpty(stack);
    printf("Is stack empty = %s\n", empty ? "true" : "false");

    // Giải phóng bộ nhớ
    delArrayStack(stack);

    return 0;
}
