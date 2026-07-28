/**
 * File: preorder_traversal_iii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* Duyệt trước (tiền tự): Ví dụ 3 */
    static void preOrder(TreeNode root) {
        // Cắt tỉa
        if (root == null || root.val == 3) {
            return;
        }
        // Thử
        path.add(root);
        if (root.val == 7) {
            // Ghi lại lời giải
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Quay lui
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nKhởi tạo cây nhị phân");
        PrintUtil.printTree(root);

        // Duyệt trước
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\nXuất ra tất cả các đường đi từ nút gốc đến nút có giá trị 7, đường đi không bao gồm các nút có giá trị 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
