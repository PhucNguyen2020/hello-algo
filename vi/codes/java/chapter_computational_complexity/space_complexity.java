/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* Hàm */
    static int function() {
        // Thực hiện một số thao tác
        return 0;
    }

    /* Độ phức tạp không gian hằng số */
    static void constant(int n) {
        // Hằng số, biến, đối tượng chiếm không gian O(1)
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // Biến trong vòng lặp chiếm không gian O(1)
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Hàm trong vòng lặp chiếm không gian O(1)
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* Độ phức tạp không gian tuyến tính */
    static void linear(int n) {
        // Mảng có độ dài n sử dụng không gian O(n)
        int[] nums = new int[n];
        // Danh sách có độ dài n chiếm không gian O(n)
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // Bảng băm có độ dài n chiếm không gian O(n)
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* Độ phức tạp không gian tuyến tính (triển khai đệ quy) */
    static void linearRecur(int n) {
        System.out.println("Đệ quy n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* Độ phức tạp không gian bậc hai */
    static void quadratic(int n) {
        // Ma trận sử dụng không gian O(n^2)
        int[][] numMatrix = new int[n][n];
        // Danh sách 2 chiều sử dụng không gian O(n^2)
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* Độ phức tạp không gian bậc hai (triển khai đệ quy) */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // Mảng nums có độ dài n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("Trong đệ quy n = " + n + ", độ dài nums = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* Mã điều khiển */
    static TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    /* Mã điều khiển */
    public static void main(String[] args) {
        int n = 5;
        // Độ phức tạp không gian hằng số
        constant(n);
        // Độ phức tạp không gian tuyến tính
        linear(n);
        linearRecur(n);
        // Độ phức tạp không gian bậc hai
        quadratic(n);
        quadraticRecur(n);
        // Độ phức tạp không gian theo cấp số mũ
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
