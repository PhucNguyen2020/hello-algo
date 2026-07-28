/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Xây dựng cây nhị phân: chia để trị */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // Dừng lại khi khoảng của cây con rỗng
  if (r - l < 0) {
    return null;
  }
  // Khởi tạo nút gốc
  TreeNode? root = TreeNode(preorder[i]);
  // Truy vấn m để phân chia cây con trái và phải
  int m = inorderMap[preorder[i]]!;
  // Bài toán con: xây dựng cây con trái
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // Bài toán con: xây dựng cây con phải
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // Trả về nút gốc
  return root;
}

/* Xây dựng cây nhị phân */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa đến chỉ số
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Driver Code */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("Pre-order traversal = $preorder");
  print("In-order traversal = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("The constructed binary tree is:");
  printTree(root!);
}
