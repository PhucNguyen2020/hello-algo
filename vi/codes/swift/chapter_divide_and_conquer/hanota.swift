/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Di chuyển một đĩa */
func move(src: inout [Int], tar: inout [Int]) {
    // Lấy một đĩa từ đỉnh của src
    let pan = src.popLast()!
    // Đặt đĩa lên đỉnh của tar
    tar.append(pan)
}

/* Giải bài toán Tháp Hà Nội f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó sang tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar làm trung gian
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
    move(src: &src, tar: &tar)
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src làm trung gian
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* Giải bài toán Tháp Hà Nội */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // Đuôi của danh sách là đỉnh của cột
    // Di chuyển n đĩa trên cùng từ src sang C, dùng B làm trung gian
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Mã điều khiển */
    static func main() {
        // Đuôi của danh sách là đỉnh của cột
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("In initial state:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("After disk movement is complete:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
