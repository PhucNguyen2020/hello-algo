/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* Di chuyển một đĩa */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // Lấy một đĩa từ đỉnh của src
    val pan = src.removeAt(src.size - 1)
    // Đặt đĩa lên đỉnh của tar
    tar.add(pan)
}

/* Giải bài toán Tháp Hà Nội f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó đến tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src đến buf, dùng tar làm trung gian
    dfs(i - 1, src, tar, buf)
    // Bài toán con f(1): di chuyển đĩa còn lại từ src đến tar
    move(src, tar)
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf đến tar, dùng src làm trung gian
    dfs(i - 1, buf, src, tar)
}

/* Giải bài toán Tháp Hà Nội */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // Di chuyển n đĩa trên cùng từ A đến C, dùng B làm trung gian
    dfs(n, A, B, C)
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    // Phần tử cuối của danh sách là đỉnh của cọc
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("In initial state:")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("After disk movement is complete:")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}