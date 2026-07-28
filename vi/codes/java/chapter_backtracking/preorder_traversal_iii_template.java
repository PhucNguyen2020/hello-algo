/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Ghi lại lời giải */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Cập nhật trạng thái */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Khôi phục trạng thái */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Giải thuật quay lui: Ví dụ 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Kiểm tra xem đây có phải là lời giải hay không
        if (isSolution(state)) {
            // Ghi lại lời giải
            recordSolution(state, res);
        }
        // Duyệt qua tất cả các lựa chọn
        for (TreeNode choice : choices) {
            // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
            if (isValid(state, choice)) {
                // Thử: thực hiện lựa chọn, cập nhật trạng thái
                makeChoice(state, choice);
                // Tiến hành vòng lựa chọn tiếp theo
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nKhởi tạo cây nhị phân");
        PrintUtil.printTree(root);

        // Giải thuật quay lui
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nXuất ra tất cả các đường đi từ nút gốc đến nút có giá trị 7, yêu cầu đường đi không bao gồm các nút có giá trị 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
