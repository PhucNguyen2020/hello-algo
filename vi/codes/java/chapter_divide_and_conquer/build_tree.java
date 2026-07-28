/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* Xây dựng cây nhị phân: chia để trị */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Kết thúc khi khoảng của cây con là rỗng
        if (r - l < 0)
            return null;
        // Khởi tạo nút gốc
        TreeNode root = new TreeNode(preorder[i]);
        // Truy vấn m để chia cây con trái và phải
        int m = inorderMap.get(preorder[i]);
        // Bài toán con: xây dựng cây con trái
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Bài toán con: xây dựng cây con phải
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Trả về nút gốc
        return root;
    }

    /* Xây dựng cây nhị phân */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // Khởi tạo bảng băm, lưu trữ ánh xạ từ phần tử duyệt giữa sang chỉ số
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }

    public static void main(String[] args) {
        int[] preorder = { 3, 9, 2, 1, 7 };
        int[] inorder = { 9, 3, 1, 2, 7 };
        System.out.println("Duyệt trước = " + Arrays.toString(preorder));
        System.out.println("Duyệt giữa = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("Cây nhị phân được xây dựng là:");
        PrintUtil.printTree(root);
    }
}
