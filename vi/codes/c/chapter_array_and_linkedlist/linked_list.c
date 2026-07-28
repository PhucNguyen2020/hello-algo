/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* Xóa nút đầu tiên đứng sau nút n0 trong danh sách liên kết */
// Lưu ý: stdio.h đã chiếm từ khóa remove
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // Giải phóng bộ nhớ
    free(P);
}

/* Truy cập nút tại vị trí index trong danh sách liên kết */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
int find(ListNode *head, int target) {
    int index = 0;
    while (head) {
        if (head->val == target)
            return index;
        head = head->next;
        index++;
    }
    return -1;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Khởi tạo danh sách liên kết */
    // Khởi tạo từng nút
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // Xây dựng liên kết tham chiếu giữa các nút
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("Initialized linked list is\r\n");
    printLinkedList(n0);

    /* Chèn nút */
    insert(n0, newListNode(0));
    printf("Linked list after node insertion is\r\n");
    printLinkedList(n0);

    /* Xóa nút */
    removeItem(n0);
    printf("Linked list after node deletion is\r\n");
    printLinkedList(n0);

    /* Truy cập nút */
    ListNode *node = access(n0, 3);
    printf("Value of node at index 3 in linked list = %d\r\n", node->val);

    /* Tìm kiếm nút */
    int index = find(n0, 2);
    printf("Index of node with value 2 in linked list = %d\r\n", index);

    // Giải phóng bộ nhớ
    freeMemoryLinkedList(n0);
    return 0;
}
