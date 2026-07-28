/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* Ghi lại lời giải */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* Kiểm tra xem lựa chọn có hợp lệ dưới trạng thái hiện tại hay không */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* Cập nhật trạng thái */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* Khôi phục trạng thái */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* Giải thuật quay lui: Ví dụ 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // Kiểm tra xem có phải là lời giải không
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // Duyệt tất cả các lựa chọn
    for choice in choices {
        // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ không
        if isValid(state: state, choice: choice) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            makeChoice(state: &state, choice: choice)
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Mã điều khiển */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nInitialize binary tree")
        PrintUtil.printTree(root: root)

        // Giải thuật quay lui
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\nOutput all paths from root node to node 7, paths do not include nodes with value 3")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
