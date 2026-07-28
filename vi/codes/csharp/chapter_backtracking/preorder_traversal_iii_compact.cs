/**
 * File: preorder_traversal_iii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Duyệt trước: Ví dụ 3 */
    void PreOrder(TreeNode? root) {
        // Cắt tỉa
        if (root == null || root.val == 3) {
            return;
        }
        // Thử
        path.Add(root);
        if (root.val == 7) {
            // Ghi lại lời giải
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Quay lui
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree");
        PrintUtil.PrintTree(root);

        // Duyệt trước
        PreOrder(root);

        Console.WriteLine("\nOutput all paths from root node to node 7, paths do not include nodes with value 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
