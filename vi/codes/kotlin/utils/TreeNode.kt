/**
 * File: TreeNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* Lớp nút cây nhị phân */
/* Hàm khởi tạo */
class TreeNode(
    var _val: Int // Giá trị nút
) {
    var height: Int = 0 // Chiều cao nút
    var left: TreeNode? = null // Tham chiếu đến nút con trái
    var right: TreeNode? = null // Tham chiếu đến nút con phải

    // Về quy tắc mã hóa tuần tự hóa, vui lòng tham khảo:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Biểu diễn mảng của cây nhị phân:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // Biểu diễn danh sách liên kết của cây nhị phân:
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* Chuyển đổi một danh sách (list) thành cây nhị phân: đệ quy */
    companion object {
        private fun listToTreeDFS(arr: MutableList<Int?>, i: Int): TreeNode? {
            if (i < 0 || i >= arr.size || arr[i] == null) {
                return null
            }
            val root = TreeNode(arr[i]!!)
            root.left = listToTreeDFS(arr, 2 * i + 1)
            root.right = listToTreeDFS(arr, 2 * i + 2)
            return root
        }

        /* Chuyển đổi một danh sách (list) thành cây nhị phân */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* Chuyển đổi cây nhị phân thành danh sách (list): đệ quy */
        private fun treeToListDFS(root: TreeNode?, i: Int, res: MutableList<Int?>) {
            if (root == null) return
            while (i >= res.size) {
                res.add(null)
            }
            res[i] = root._val
            treeToListDFS(root.left, 2 * i + 1, res)
            treeToListDFS(root.right, 2 * i + 2, res)
        }

        /* Chuyển đổi cây nhị phân thành danh sách (list) */
        fun treeToList(root: TreeNode?): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            treeToListDFS(root, 0, res)
            return res
        }
    }
}