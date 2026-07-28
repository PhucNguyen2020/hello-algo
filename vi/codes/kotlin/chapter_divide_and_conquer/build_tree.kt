/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* Xây dựng cây nhị phân: chia để trị */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // Kết thúc khi khoảng của cây con rỗng
    if (r - l < 0) return null
    // Khởi tạo nút gốc
    val root = TreeNode(preorder[i])
    // Truy vấn m để phân chia cây con trái và phải
    val m = inorderMap[preorder[i]]!!
    // Bài toán con: xây dựng cây con trái
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // Bài toán con: xây dựng cây con phải
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // Trả về nút gốc
    return root
}

/* Xây dựng cây nhị phân */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa sang chỉ số
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("Pre-order traversal = ${preorder.contentToString()}")
    println("In-order traversal = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("The constructed binary tree is:")
    printTree(root)
}