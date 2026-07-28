/**
 * File: binary_search_recur.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

public class binary_search_recur {
    /* Tìm kiếm nhị phân: bài toán con f(i, j) */
    static int dfs(int[] nums, int target, int i, int j) {
        // Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
        if (i > j) {
            return -1;
        }
        // Tính chỉ số điểm giữa m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Đệ quy bài toán con f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Đệ quy bài toán con f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
            return m;
        }
    }

    /* Tìm kiếm nhị phân */
    static int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Giải bài toán f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        // Tìm kiếm nhị phân (khoảng đóng cả hai đầu)
        int index = binarySearch(nums, target);
        System.out.println("Chỉ số của phần tử mục tiêu 6 = " + index);
    }
}
