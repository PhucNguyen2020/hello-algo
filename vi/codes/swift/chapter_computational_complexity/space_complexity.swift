/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hàm */
@discardableResult
func function() -> Int {
    // Thực hiện một số thao tác
    return 0
}

/* Độ phức tạp không gian hằng số */
func constant(n: Int) {
    // Hằng số, biến, đối tượng chiếm không gian O(1)
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // Biến trong vòng lặp chiếm không gian O(1)
    for _ in 0 ..< n {
        let c = 0
    }
    // Hàm trong vòng lặp chiếm không gian O(1)
    for _ in 0 ..< n {
        function()
    }
}

/* Độ phức tạp không gian tuyến tính */
func linear(n: Int) {
    // Mảng có độ dài n chiếm không gian O(n)
    let nums = Array(repeating: 0, count: n)
    // Danh sách liên kết có độ dài n chiếm không gian O(n)
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // Bảng băm có độ dài n chiếm không gian O(n)
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* Độ phức tạp không gian tuyến tính (triển khai đệ quy) */
func linearRecur(n: Int) {
    print("Recursion n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* Độ phức tạp không gian theo cấp số nhân */
func quadratic(n: Int) {
    // Danh sách 2 chiều chiếm không gian O(n^2)
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* Độ phức tạp không gian bậc hai (triển khai đệ quy) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // Mảng nums có độ dài n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("In recursion n = \(n), nums length = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* Mã điều khiển */
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: 0)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}

@main
enum SpaceComplexity {
    /* Mã điều khiển */
    static func main() {
        let n = 5
        // Độ phức tạp không gian hằng số
        constant(n: n)
        // Độ phức tạp không gian tuyến tính
        linear(n: n)
        linearRecur(n: n)
        // Độ phức tạp không gian theo cấp số nhân
        quadratic(n: n)
        quadraticRecur(n: n)
        // Độ phức tạp không gian theo cấp số nhân
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
