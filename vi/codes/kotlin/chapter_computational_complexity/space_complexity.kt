/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* Hàm */
fun function(): Int {
    // Thực hiện một số thao tác
    return 0
}

/* Độ phức tạp hằng số */
fun constant(n: Int) {
    // Hằng số, biến, đối tượng chiếm không gian O(1)
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // Biến trong vòng lặp chiếm không gian O(1)
    for (i in 0..<n) {
        val c = 0
    }
    // Hàm trong vòng lặp chiếm không gian O(1)
    for (i in 0..<n) {
        function()
    }
}

/* Độ phức tạp tuyến tính */
fun linear(n: Int) {
    // Mảng có độ dài n dùng không gian O(n)
    val nums = Array(n) { 0 }
    // Danh sách có độ dài n chiếm không gian O(n)
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // Bảng băm có độ dài n chiếm không gian O(n)
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* Độ phức tạp tuyến tính (cài đặt đệ quy) */
fun linearRecur(n: Int) {
    println("Recursion n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* Độ phức tạp bình phương */
fun quadratic(n: Int) {
    // Ma trận dùng không gian O(n^2)
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // Danh sách 2 chiều dùng không gian O(n^2)
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* Độ phức tạp bình phương (cài đặt đệ quy) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // Mảng nums có độ dài n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("In recursion n = $n, nums length = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* Code chạy chính */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* Code chạy chính */
fun main() {
    val n = 5
    // Độ phức tạp hằng số
    constant(n)
    // Độ phức tạp tuyến tính
    linear(n)
    linearRecur(n)
    // Độ phức tạp bình phương
    quadratic(n)
    quadraticRecur(n)
    // Độ phức tạp bình phương
    val root = buildTree(n)
    printTree(root)
}