/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Chương trình điều khiển (Driver Code) */
fun main() {
    /* Khởi tạo danh sách (list) */
    // Tập hợp có thể thay đổi (mutable collection)
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("List nums = $nums")

    /* Truy cập phần tử */
    val num = nums[1]
    println("Access element at index 1, get num = $num")

    /* Cập nhật phần tử */
    nums[1] = 0
    println("Update element at index 1 to 0, get nums = $nums")

    /* Xóa toàn bộ phần tử */
    nums.clear()
    println("After clearing list, nums = $nums")

    /* Thêm phần tử vào cuối danh sách */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("After adding elements, nums = $nums")

    /* Chèn phần tử vào giữa danh sách */
    nums.add(3, 6)
    println("Insert number 6 at index 3, get nums = $nums")

    /* Xóa phần tử */
    nums.removeAt(3)
    println("Delete element at index 3, get nums = $nums")

    /* Duyệt danh sách theo chỉ số */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Duyệt trực tiếp các phần tử của danh sách */
    for (j in nums) {
        count += j
    }

    /* Nối hai danh sách */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("After concatenating list nums1 to nums, get nums = $nums")

    /* Sắp xếp danh sách */
    nums.sort()
    println("After sorting list, nums = $nums")
}