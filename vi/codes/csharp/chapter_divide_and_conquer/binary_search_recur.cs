/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* Tìm kiếm nhị phân: bài toán f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
        if (i > j) {
            return -1;
        }
        // Tính chỉ số điểm giữa m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Đệ quy bài toán con f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Đệ quy bài toán con f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
            return m;
        }
    }

    /* Tìm kiếm nhị phân */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Giải bài toán f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Tìm kiếm nhị phân (khoảng đóng cả hai đầu)
        int index = BinarySearch(nums, target);
        Console.WriteLine("Index of target element 6 = " + index);
    }
}
