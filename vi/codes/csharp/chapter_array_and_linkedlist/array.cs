// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Truy cập ngẫu nhiên vào phần tử */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Chọn ngẫu nhiên một số trong khoảng [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Lấy và trả về phần tử ngẫu nhiên
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Mở rộng độ dài mảng */
    int[] Extend(int[] nums, int enlarge) {
        // Khởi tạo một mảng với độ dài đã được mở rộng
        int[] res = new int[nums.Length + enlarge];
        // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Trả về mảng mới đã mở rộng
        return res;
    }

    /* Chèn phần tử num vào vị trí index trong mảng */
    void Insert(int[] nums, int num, int index) {
        // Dịch chuyển tất cả phần tử từ vị trí index trở đi lùi lại một vị trí
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Gán num cho phần tử tại vị trí index
        nums[index] = num;
    }

    /* Xóa phần tử tại vị trí index */
    void Remove(int[] nums, int index) {
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Duyệt mảng */
    void Traverse(int[] nums) {
        int count = 0;
        // Duyệt mảng theo chỉ số
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Duyệt trực tiếp các phần tử của mảng
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Tìm phần tử chỉ định trong mảng */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Hàm hỗ trợ, chuyển mảng thành chuỗi */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Khởi tạo mảng
        int[] arr = new int[5];
        Console.WriteLine("Array arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("Array nums = " + ToString(nums));

        // Chèn phần tử
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Get random element in nums " + randomNum);

        // Duyệt mảng
        nums = Extend(nums, 3);
        Console.WriteLine("Extend array length to 8, resulting in nums = " + ToString(nums));

        // Chèn phần tử
        Insert(nums, 6, 3);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + ToString(nums));

        // Xóa phần tử
        Remove(nums, 2);
        Console.WriteLine("Remove element at index 2, resulting in nums = " + ToString(nums));

        // Duyệt mảng
        Traverse(nums);

        // Tìm phần tử
        int index = Find(nums, 3);
        Console.WriteLine("Find element 3 in nums, get index = " + index);
    }
}
