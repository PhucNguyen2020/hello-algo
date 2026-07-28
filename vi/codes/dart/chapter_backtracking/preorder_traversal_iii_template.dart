/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* Ghi lại lời giải */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* Cập nhật trạng thái */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* Khôi phục trạng thái */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* Giải thuật quay lui: Ví dụ 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // Kiểm tra xem đây có phải là lời giải hay không
  if (isSolution(state)) {
    // Ghi lại lời giải
    recordSolution(state, res);
  }
  // Duyệt qua tất cả các lựa chọn
  for (TreeNode? choice in choices) {
    // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
    if (isValid(state, choice)) {
      // Thử: thực hiện lựa chọn, cập nhật trạng thái
      makeChoice(state, choice);
      // Tiến hành vòng lựa chọn tiếp theo
      backtrack(state, [choice!.left, choice.right], res);
      // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
      undoChoice(state, choice);
    }
  }
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree");
  printTree(root);

  // Giải thuật quay lui
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
