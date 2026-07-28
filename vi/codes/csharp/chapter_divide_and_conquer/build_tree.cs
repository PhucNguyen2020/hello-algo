/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* Xây dựng cây nhị phân: chia để trị */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Dừng khi khoảng của cây con rỗng
        if (r - l < 0)
            return null;
        // Khởi tạo nút gốc
        TreeNode root = new(preorder[i]);
        // Truy vấn m để chia cây con trái và phải
        int m = inorderMap[preorder[i]];
        // Bài toán con: xây dựng cây con trái
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Bài toán con: xây dựng cây con phải
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Trả về nút gốc
        return root;
    }

    /* Xây dựng cây nhị phân */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa đến chỉ số
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }

    [Test]
    public void Test() {
        int[] preorder = [3, 9, 2, 1, 7];
        int[] inorder = [9, 3, 1, 2, 7];
        Console.WriteLine("Preorder traversal = " + string.Join(", ", preorder));
        Console.WriteLine("Inorder traversal = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("The constructed binary tree is:");
        PrintUtil.PrintTree(root);
    }
}
