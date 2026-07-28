/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* Ghi lại lời giải */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* Cập nhật trạng thái */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* Khôi phục trạng thái */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* Giải thuật quay lui: Ví dụ 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // Kiểm tra xem có phải là lời giải hay không
    if (isSolution(state)) {
        // Ghi lại lời giải
        recordSolution(state, res)
    }
    // Duyệt qua tất cả các lựa chọn
    for (choice in choices) {
        // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
        if (isValid(state, choice)) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            makeChoice(state, choice)
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
            undoChoice(state, choice)
        }
    }
}

/* Đoạn mã điều khiển */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nInitialize binary tree")
    printTree(root)

    // Giải thuật quay lui
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3")
    for (path in res) {
        val vals = mutableListOf<Int>()
        for (node in path!!) {
            if (node != null) {
                vals.add(node._val)
            }
        }
        println(vals)
    }
}