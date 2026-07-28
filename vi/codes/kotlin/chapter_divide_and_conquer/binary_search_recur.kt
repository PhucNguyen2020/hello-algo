/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* Tìm kiếm nhị phân: bài toán con f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
    if (i > j) {
        return -1
    }
    // Tính chỉ số điểm giữa m
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // Đệ quy bài toán con f(m+1, j)
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // Đệ quy bài toán con f(i, m-1)
        dfs(nums, target, i, m - 1)
    } else {
        // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
        m
    }
}

/* Tìm kiếm nhị phân */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // Giải bài toán f(0, n-1)
    return dfs(nums, target, 0, n - 1)
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // Tìm kiếm nhị phân (khoảng đóng ở cả hai đầu)
    val index = binarySearch(nums, target)
    println("Index of target element 6 = $index")
}