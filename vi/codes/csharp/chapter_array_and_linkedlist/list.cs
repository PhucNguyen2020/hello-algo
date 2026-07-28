/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* Khởi tạo danh sách */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("List nums = " + string.Join(",", nums));

        /* Truy cập phần tử */
        int num = nums[1];
        Console.WriteLine("Access element at index 1, get num = " + num);

        /* Cập nhật phần tử */
        nums[1] = 0;
        Console.WriteLine("Update element at index 1 to 0, resulting in nums = " + string.Join(",", nums));

        /* Xóa toàn bộ phần tử */
        nums.Clear();
        Console.WriteLine("After clearing list, nums = " + string.Join(",", nums));

        /* Thêm phần tử vào cuối danh sách */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("After adding elements, nums = " + string.Join(",", nums));

        /* Chèn phần tử vào giữa danh sách */
        nums.Insert(3, 6);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + string.Join(",", nums));

        /* Xóa phần tử */
        nums.RemoveAt(3);
        Console.WriteLine("Remove element at index 3, resulting in nums = " + string.Join(",", nums));

        /* Duyệt danh sách theo chỉ số */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* Duyệt trực tiếp các phần tử của danh sách */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* Nối hai danh sách */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("Concatenate list nums1 to nums, resulting in nums = " + string.Join(",", nums));

        /* Sắp xếp danh sách */
        nums.Sort(); // Sau khi sắp xếp, các phần tử trong danh sách được xếp theo thứ tự tăng dần
        Console.WriteLine("After sorting list, nums = " + string.Join(",", nums));
    }
}
