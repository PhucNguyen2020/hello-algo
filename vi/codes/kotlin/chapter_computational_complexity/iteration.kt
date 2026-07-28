/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* Vòng lặp for */
fun forLoop(n: Int): Int {
    var res = 0
    // Tính tổng 1, 2, ..., n-1, n
    for (i in 1..n) {
        res += i
    }
    return res
}

/* Vòng lặp while */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // Khởi tạo biến điều kiện
    // Tính tổng 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // Cập nhật biến điều kiện
    }
    return res
}

/* Vòng lặp while (hai lần cập nhật) */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // Khởi tạo biến điều kiện
    // Tính tổng 1, 4, 10, ...
    while (i <= n) {
        res += i
        // Cập nhật biến điều kiện
        i++
        i *= 2
    }
    return res
}

/* Vòng lặp for lồng nhau */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // Lặp i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // Lặp j = 1, 2, ..., n-1, n
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* Code chạy chính */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nFor loop sum result res = $res")

    res = whileLoop(n)
    println("\nWhile loop sum result res = $res")

    res = whileLoopII(n)
    println("\nWhile loop (two updates) sum result res = $res")

    val resStr = nestedForLoop(n)
    println("\nNested for loop traversal result $resStr")
}