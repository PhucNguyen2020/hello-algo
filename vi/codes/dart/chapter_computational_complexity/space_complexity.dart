/**
 * File: space_complexity.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:collection';
import '../utils/list_node.dart';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Hàm */
int function() {
  // Thực hiện một số phép toán
  return 0;
}

/* Độ phức tạp hằng số */
void constant(int n) {
  // Hằng số, biến, đối tượng chiếm không gian O(1)
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // Biến trong vòng lặp chiếm không gian O(1)
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // Hàm trong vòng lặp chiếm không gian O(1)
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* Độ phức tạp tuyến tính */
void linear(int n) {
  // Mảng có độ dài n sử dụng không gian O(n)
  List<int> nums = List.filled(n, 0);
  // Danh sách có độ dài n chiếm không gian O(n)
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // Bảng băm có độ dài n chiếm không gian O(n)
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* Độ phức tạp tuyến tính (triển khai đệ quy) */
void linearRecur(int n) {
  print('Recursion n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* Độ phức tạp bình phương */
void quadratic(int n) {
  // Ma trận sử dụng không gian O(n^2)
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // Danh sách 2 chiều sử dụng không gian O(n^2)
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* Độ phức tạp bình phương (triển khai đệ quy) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('In recursion n = $n, nums length = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* Driver Code */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* Driver Code */
void main() {
  int n = 5;
  // Độ phức tạp hằng số
  constant(n);
  // Độ phức tạp tuyến tính
  linear(n);
  linearRecur(n);
  // Độ phức tạp bình phương
  quadratic(n);
  quadraticRecur(n);
  // Độ phức tạp hàm mũ
  TreeNode? root = buildTree(n);
  printTree(root);
}
