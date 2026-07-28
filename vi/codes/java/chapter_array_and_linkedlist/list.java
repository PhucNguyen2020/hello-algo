/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* Khởi tạo danh sách (list) */
        // Lưu ý rằng kiểu phần tử của mảng là Integer[], lớp bao (wrapper class) của int[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("List nums = " + nums);

        /* Truy cập phần tử */
        int num = nums.get(1);
        System.out.println("Access element at index 1, get num = " + num);

        /* Cập nhật phần tử */
        nums.set(1, 0);
        System.out.println("Update element at index 1 to 0, resulting in nums = " + nums);

        /* Xóa toàn bộ phần tử */
        nums.clear();
        System.out.println("After clearing list, nums = " + nums);

        /* Thêm phần tử vào cuối danh sách */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("After adding elements, nums = " + nums);

        /* Chèn phần tử vào giữa danh sách */
        nums.add(3, 6);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + nums);

        /* Xóa phần tử */
        nums.remove(3);
        System.out.println("Remove element at index 3, resulting in nums = " + nums);

        /* Duyệt danh sách theo chỉ số */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Duyệt trực tiếp các phần tử của danh sách */
        for (int x : nums) {
            count += x;
        }

        /* Nối hai danh sách */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("Concatenate list nums1 to nums, resulting in nums = " + nums);

        /* Sắp xếp danh sách */
        Collections.sort(nums);
        System.out.println("After sorting list, nums = " + nums);
    }
}
