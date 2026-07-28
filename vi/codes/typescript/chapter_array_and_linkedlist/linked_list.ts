/**
 * File: linked_list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { printLinkedList } from '../modules/PrintUtil';

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
function insert(n0: ListNode, P: ListNode): void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Xóa nút đầu tiên sau nút n0 trong danh sách liên kết */
function remove(n0: ListNode): void {
    if (!n0.next) {
        return;
    }
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Truy cập nút ở vị trí index trong danh sách liên kết */
function access(head: ListNode | null, index: number): ListNode | null {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
function find(head: ListNode | null, target: number): number {
    let index = 0;
    while (head !== null) {
        if (head.val === target) {
            return index;
        }
        head = head.next;
        index += 1;
    }
    return -1;
}

/* Driver Code */
/* Khởi tạo danh sách liên kết */
// Khởi tạo từng nút
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Xây dựng tham chiếu giữa các nút
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('Initialized linked list is');
printLinkedList(n0);

/* Chèn nút */
insert(n0, new ListNode(0));
console.log('Linked list after inserting node is');
printLinkedList(n0);

/* Xóa nút */
remove(n0);
console.log('Linked list after removing node is');
printLinkedList(n0);

/* Truy cập nút */
const node = access(n0, 3);
console.log(`Value of node at index 3 in linked list = ${node?.val}`);

/* Tìm nút */
const index = find(n0, 2);
console.log(`Index of node with value 2 in linked list = ${index}`);

export {};
