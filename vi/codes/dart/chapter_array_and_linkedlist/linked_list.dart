/**
 * File: linked_list.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';
import '../utils/print_util.dart';

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
void insert(ListNode n0, ListNode P) {
  ListNode? n1 = n0.next;
  P.next = n1;
  n0.next = P;
}

/* Xóa nút đứng ngay sau nút n0 trong danh sách liên kết */
void remove(ListNode n0) {
  if (n0.next == null) return;
  // n0 -> P -> n1
  ListNode P = n0.next!;
  ListNode? n1 = P.next;
  n0.next = n1;
}

/* Truy cập nút tại chỉ số index trong danh sách liên kết */
ListNode? access(ListNode? head, int index) {
  for (var i = 0; i < index; i++) {
    if (head == null) return null;
    head = head.next;
  }
  return head;
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
int find(ListNode? head, int target) {
  int index = 0;
  while (head != null) {
    if (head.val == target) {
      return index;
    }
    head = head.next;
    index++;
  }
  return -1;
}

/* Chương trình chính */
void main() {
  // Khởi tạo danh sách liên kết
  // Khởi tạo từng nút
  ListNode n0 = ListNode(1);
  ListNode n1 = ListNode(3);
  ListNode n2 = ListNode(2);
  ListNode n3 = ListNode(5);
  ListNode n4 = ListNode(4);
  // Xây dựng liên kết giữa các nút
  n0.next = n1;
  n1.next = n2;
  n2.next = n3;
  n3.next = n4;

  print('Initialized linked list is');
  printLinkedList(n0);

  /* Chèn nút */
  insert(n0, ListNode(0));
  print('Linked list after inserting node is');
  printLinkedList(n0);

  /* Xóa nút */
  remove(n0);
  print('Linked list after removing node is');
  printLinkedList(n0);

  /* Truy cập nút */
  ListNode? node = access(n0, 3);
  print('Value of node at index 3 in linked list = ${node!.val}');

  /* Tìm nút */
  int index = find(n0, 2);
  print('Index of node with value 2 in linked list = $index');
}
