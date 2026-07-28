/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Vòng lặp for */
func forLoop(n: Int) -> Int {
    var res = 0
    // Tính tổng 1, 2, ..., n-1, n
    for i in 1 ... n {
        res += i
    }
    return res
}

/* Vòng lặp while */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // Khởi tạo biến điều kiện
    // Tính tổng 1, 2, ..., n-1, n
    while i <= n {
        res += i
        i += 1 // Cập nhật biến điều kiện
    }
    return res
}

/* Vòng lặp while (hai lần cập nhật) */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // Khởi tạo biến điều kiện
    // Tính tổng 1, 4, 10, ...
    while i <= n {
        res += i
        // Cập nhật biến điều kiện
        i += 1
        i *= 2
    }
    return res
}

/* Vòng lặp for lồng nhau */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // Lặp i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // Lặp j = 1, 2, ..., n-1, n
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* Mã điều khiển */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nFor loop sum result res = \(res)")

        res = whileLoop(n: n)
        print("\nWhile loop sum result res = \(res)")

        res = whileLoopII(n: n)
        print("\nWhile loop (two updates) sum result res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\nNested for loop traversal result \(resStr)")
    }
}
