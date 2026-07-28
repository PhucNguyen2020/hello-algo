/**
 * File: preorder_traversal_i_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_i_compact {
    static List<TreeNode> res;

    /* Duyệt trước (tiền tự): Ví dụ 1 */
    static void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Ghi lại lời giải
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nKhởi tạo cây nhị phân");
        PrintUtil.printTree(root);

        // Duyệt trước
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\nXuất ra tất cả các nút có giá trị bằng 7");
        List<Integer> vals = new ArrayList<>();
        for (TreeNode node : res) {
            vals.add(node.val);
        }
        System.out.println(vals);
    }
}
