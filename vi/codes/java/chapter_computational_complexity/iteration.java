/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* Vòng lặp for */
    static int forLoop(int n) {
        int res = 0;
        // Tính tổng 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Vòng lặp while */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // Khởi tạo biến điều kiện
        // Tính tổng 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Cập nhật biến điều kiện
        }
        return res;
    }

    /* Vòng lặp while (hai lần cập nhật) */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Khởi tạo biến điều kiện
        // Tính tổng 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Cập nhật biến điều kiện
            i++;
            i *= 2;
        }
        return res;
    }

    /* Vòng lặp for lồng nhau */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Vòng lặp i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Vòng lặp j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* Mã điều khiển */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nKết quả tổng của vòng lặp for res = " + res);

        res = whileLoop(n);
        System.out.println("\nKết quả tổng của vòng lặp while res = " + res);

        res = whileLoopII(n);
        System.out.println("\nKết quả tổng của vòng lặp while (hai lần cập nhật) res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\nKết quả duyệt vòng lặp for hai lớp " + resStr);
    }
}
