/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Tạo một mảng gồm các phần tử { 1, 2, ..., n } với thứ tự được xáo trộn */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Tạo mảng nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Xáo trộn ngẫu nhiên các phần tử của mảng
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Tìm chỉ số của số 1 trong mảng nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // Khi phần tử 1 nằm ở đầu mảng, đạt được độ phức tạp thời gian tốt nhất O(1)
            // Khi phần tử 1 nằm ở cuối mảng, đạt được độ phức tạp thời gian xấu nhất O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Chương trình chính */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\nArray [ 1, 2, ..., n ] after shuffling = " + string.Join(",", nums));
            Console.WriteLine("Index of number 1 is " + index);
        }
    }
}
