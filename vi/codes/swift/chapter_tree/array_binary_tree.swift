/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Lớp cây nhị phân biểu diễn bằng mảng */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* Hàm khởi tạo */
    init(arr: [Int?]) {
        tree = arr
    }

    /* Dung lượng danh sách */
    func size() -> Int {
        tree.count
    }

    /* Lấy giá trị của nút tại chỉ số i */
    func val(i: Int) -> Int? {
        // Nếu chỉ số nằm ngoài phạm vi, trả về null để biểu diễn vị trí trống
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* Lấy chỉ số của nút con trái của nút tại chỉ số i */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Lấy chỉ số của nút con phải của nút tại chỉ số i */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Lấy chỉ số của nút cha của nút tại chỉ số i */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* Duyệt theo tầng */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // Duyệt trực tiếp trên mảng
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* Duyệt theo chiều sâu */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // Nếu là vị trí trống, quay về
        guard let val = val(i: i) else {
            return
        }
        // Duyệt trước
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // Duyệt giữa
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // Duyệt sau
        if order == "post" {
            res.append(val)
        }
    }

    /* Duyệt trước */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* Duyệt giữa */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* Duyệt sau */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* Mã điều khiển */
    static func main() {
        // Khởi tạo cây nhị phân
        // Ở đây ta dùng một hàm để sinh cây nhị phân trực tiếp từ một mảng
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\nInitialize binary tree\n")
        print("Array representation of binary tree:")
        print(arr)
        print("Linked list representation of binary tree:")
        PrintUtil.printTree(root: root)

        // Lớp cây nhị phân biểu diễn bằng mảng
        let abt = ArrayBinaryTree(arr: arr)

        // Truy cập nút
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\nCurrent node index is \(i), value is \(abt.val(i: i) as Any)")
        print("Its left child index is \(l), value is \(abt.val(i: l) as Any)")
        print("Its right child index is \(r), value is \(abt.val(i: r) as Any)")
        print("Its parent node index is \(p), value is \(abt.val(i: p) as Any)")

        // Duyệt cây
        var res = abt.levelOrder()
        print("\nLevel-order traversal is: \(res)")
        res = abt.preOrder()
        print("Pre-order traversal is: \(res)")
        res = abt.inOrder()
        print("In-order traversal is: \(res)")
        res = abt.postOrder()
        print("Post-order traversal is: \(res)")
    }
}
