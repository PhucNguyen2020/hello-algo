/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* Truy cập ngẫu nhiên đến phần tử */
    static int randomAccess(int[] nums) {
        // Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Lấy và trả về phần tử ngẫu nhiên
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Mở rộng độ dài mảng */
    static int[] extend(int[] nums, int enlarge) {
        // Khởi tạo một mảng với độ dài đã được mở rộng
        int[] res = new int[nums.length + enlarge];
        // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Trả về mảng mới đã được mở rộng
        return res;
    }

    /* Chèn phần tử num vào vị trí index trong mảng */
    static void insert(int[] nums, int num, int index) {
        // Dịch chuyển tất cả phần tử từ vị trí index trở đi lùi lại một vị trí
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Gán num cho phần tử tại vị trí index
        nums[index] = num;
    }

    /* Xóa phần tử tại vị trí index */
    static void remove(int[] nums, int index) {
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Duyệt mảng */
    static void traverse(int[] nums) {
        int count = 0;
        // Duyệt mảng theo chỉ số
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Duyệt trực tiếp các phần tử của mảng
        for (int num : nums) {
            count += num;
        }
    }

    /* Tìm phần tử được chỉ định trong mảng */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Chương trình chính */
    public static void main(String[] args) {
        /* Khởi tạo mảng */
        int[] arr = new int[5];
        System.out.println("Array arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Array nums = " + Arrays.toString(nums));

        /* Truy cập ngẫu nhiên đến phần tử */
        int randomNum = randomAccess(nums);
        System.out.println("Get random element in nums " + randomNum);

        /* Mở rộng độ dài mảng */
        nums = extend(nums, 3);
        System.out.println("Extend array length to 8, resulting in nums = " + Arrays.toString(nums));

        /* Chèn phần tử */
        insert(nums, 6, 3);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + Arrays.toString(nums));

        /* Xóa phần tử */
        remove(nums, 2);
        System.out.println("Remove element at index 2, resulting in nums = " + Arrays.toString(nums));

        /* Duyệt mảng */
        traverse(nums);

        /* Tìm phần tử */
        int index = find(nums, 3);
        System.out.println("Find element 3 in nums, get index = " + index);
    }
}
