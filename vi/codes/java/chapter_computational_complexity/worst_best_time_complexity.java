/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* Sinh một mảng có các phần tử { 1, 2, ..., n }, thứ tự đã bị xáo trộn */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Sinh mảng nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Xáo trộn ngẫu nhiên các phần tử của mảng
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Tìm chỉ số của số 1 trong mảng nums */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // Khi phần tử 1 nằm ở đầu mảng, đạt được độ phức tạp thời gian tốt nhất O(1)
            // Khi phần tử 1 nằm ở cuối mảng, đạt được độ phức tạp thời gian xấu nhất O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* Mã điều khiển */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\nMảng [ 1, 2, ..., n ] sau khi xáo trộn = " + Arrays.toString(nums));
            System.out.println("Chỉ số của số 1 là " + index);
        }
    }
}
