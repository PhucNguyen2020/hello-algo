/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* Dung tích lớn nhất: Giải thuật tham lam */
    int MaxCapacity(int[] ht) {
        // Khởi tạo i, j ở hai đầu mảng
        int i = 0, j = ht.Length - 1;
        // Dung tích lớn nhất ban đầu là 0
        int res = 0;
        // Lặp để lựa chọn tham lam cho đến khi hai tấm ván gặp nhau
        while (i < j) {
            // Cập nhật dung tích lớn nhất
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // Di chuyển tấm ván ngắn hơn vào trong
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // Giải thuật tham lam
        int res = MaxCapacity(ht);
        Console.WriteLine("Maximum capacity is " + res);
    }
}