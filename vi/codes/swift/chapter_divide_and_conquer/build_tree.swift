/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Xây dựng cây nhị phân: chia để trị */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // Dừng khi khoảng của cây con rỗng
    if r - l < 0 {
        return nil
    }
    // Khởi tạo nút gốc
    let root = TreeNode(x: preorder[i])
    // Tra cứu m để chia cây con trái và phải
    let m = inorderMap[preorder[i]]!
    // Bài toán con: xây dựng cây con trái
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // Bài toán con: xây dựng cây con phải
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // Trả về nút gốc
    return root
}

/* Xây dựng cây nhị phân */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // Khởi tạo bảng băm, lưu ánh xạ từ phần tử của duyệt giữa sang chỉ số
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Mã điều khiển */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("Pre-order traversal = \(preorder)")
        print("In-order traversal = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("The constructed binary tree is:")
        PrintUtil.printTree(root: root)
    }
}
