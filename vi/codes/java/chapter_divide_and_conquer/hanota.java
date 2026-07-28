/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* Di chuyển một đĩa */
    static void move(List<Integer> src, List<Integer> tar) {
        // Lấy một đĩa từ đỉnh của src
        Integer pan = src.remove(src.size() - 1);
        // Đặt đĩa lên đỉnh của tar
        tar.add(pan);
    }

    /* Giải bài toán Tháp Hà Nội f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó sang tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar làm trung gian
        dfs(i - 1, src, tar, buf);
        // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
        move(src, tar);
        // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src làm trung gian
        dfs(i - 1, buf, src, tar);
    }

    /* Giải bài toán Tháp Hà Nội */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Di chuyển n đĩa trên cùng từ A sang C, dùng B làm trung gian
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // Cuối danh sách là đỉnh của cột
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("Trạng thái ban đầu:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("Sau khi di chuyển đĩa hoàn tất:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
