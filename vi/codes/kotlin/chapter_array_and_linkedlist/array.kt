/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Truy cập ngẫu nhiên một phần tử */
fun randomAccess(nums: IntArray): Int {
    // Chọn ngẫu nhiên một số trong khoảng [0, nums.size)
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // Lấy và trả về phần tử ngẫu nhiên
    val randomNum = nums[randomIndex]
    return randomNum
}

/* Mở rộng độ dài mảng */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // Khởi tạo một mảng với độ dài đã mở rộng
    val res = IntArray(nums.size + enlarge)
    // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // Trả về mảng mới đã được mở rộng
    return res
}

/* Chèn phần tử num vào vị trí index trong mảng */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Dịch chuyển tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // Gán num cho phần tử tại vị trí index
    nums[index] = num
}

/* Xóa phần tử tại vị trí index */
fun remove(nums: IntArray, index: Int) {
    // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* Duyệt mảng */
fun traverse(nums: IntArray) {
    var count = 0
    // Duyệt mảng theo chỉ số
    for (i in nums.indices) {
        count += nums[i]
    }
    // Duyệt trực tiếp các phần tử của mảng
    for (j in nums) {
        count += j
    }
}

/* Tìm phần tử được chỉ định trong mảng */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    /* Khởi tạo mảng */
    val arr = IntArray(5)
    println("Array arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("Array nums = ${nums.contentToString()}")

    /* Truy cập ngẫu nhiên một phần tử */
    val randomNum: Int = randomAccess(nums)
    println("Get random element $randomNum from nums")

    /* Mở rộng độ dài mảng */
    nums = extend(nums, 3)
    println("Extend array length to 8, get nums = ${nums.contentToString()}")

    /* Chèn phần tử */
    insert(nums, 6, 3)
    println("Insert number 6 at index 3, get nums = ${nums.contentToString()}")

    /* Xóa phần tử */
    remove(nums, 2)
    println("Delete element at index 2, get nums = ${nums.contentToString()}")

    /* Duyệt mảng */
    traverse(nums)

    /* Tìm phần tử */
    val index: Int = find(nums, 3)
    println("Find element 3 in nums, index = $index")
}