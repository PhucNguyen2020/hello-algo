/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Xóa nút đứng ngay sau nút n0 trong danh sách liên kết */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Truy cập nút tại vị trí index trong danh sách liên kết */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
function find(head, target) {
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

/* Chương trình chính */
/* Khởi tạo danh sách liên kết */
// Khởi tạo từng nút
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Xây dựng liên kết giữa các nút
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
console.log('Value of node at index 3 in linked list = ' + node.val);

/* Tìm nút */
const index = find(n0, 2);
console.log('Index of node with value 2 in linked list = ' + index);
