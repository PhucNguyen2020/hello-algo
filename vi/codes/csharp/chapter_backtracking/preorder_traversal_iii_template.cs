/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* Kiểm tra xem trạng thái hiện tại có phải là lời giải hay không */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Ghi lại lời giải */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Kiểm tra xem lựa chọn có hợp lệ trong trạng thái hiện tại hay không */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Cập nhật trạng thái */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Khôi phục trạng thái */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Giải thuật quay lui: Ví dụ 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Kiểm tra xem đây có phải là lời giải hay không
        if (IsSolution(state)) {
            // Ghi lại lời giải
            RecordSolution(state, res);
        }
        // Duyệt qua tất cả các lựa chọn
        foreach (TreeNode choice in choices) {
            // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
            if (IsValid(state, choice)) {
                // Thử: thực hiện lựa chọn, cập nhật trạng thái
                MakeChoice(state, choice);
                // Tiến hành vòng lựa chọn tiếp theo
                Backtrack(state, [choice.left!, choice.right!], res);
                // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree");
        PrintUtil.PrintTree(root);

        // Giải thuật quay lui
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
