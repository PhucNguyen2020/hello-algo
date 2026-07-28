/**
 * File: space_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class space_complexity {
    /* Hàm */
    int Function() {
        // Thực hiện một số thao tác
        return 0;
    }

    /* Độ phức tạp không gian hằng số */
    void Constant(int n) {
        // Hằng số, biến, đối tượng chiếm không gian O(1)
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Biến trong vòng lặp chiếm không gian O(1)
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Hàm trong vòng lặp chiếm không gian O(1)
        for (int i = 0; i < n; i++) {
            Function();
        }
    }

    /* Độ phức tạp không gian tuyến tính */
    void Linear(int n) {
        // Mảng có độ dài n sử dụng không gian O(n)
        int[] nums = new int[n];
        // Danh sách có độ dài n chiếm không gian O(n)
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // Bảng băm có độ dài n chiếm không gian O(n)
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }

    /* Độ phức tạp không gian tuyến tính (triển khai đệ quy) */
    void LinearRecur(int n) {
        Console.WriteLine("Recursion n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }

    /* Độ phức tạp không gian bậc hai */
    void Quadratic(int n) {
        // Ma trận sử dụng không gian O(n^2)
        int[,] numMatrix = new int[n, n];
        // Danh sách 2 chiều sử dụng không gian O(n^2)
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }

    /* Độ phức tạp không gian bậc hai (triển khai đệ quy) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("Recursion n = " + n + ", nums length = " + nums.Length);
        return QuadraticRecur(n - 1);
    }

    /* Chương trình chính */
    TreeNode? BuildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new(0) {
            left = BuildTree(n - 1),
            right = BuildTree(n - 1)
        };
        return root;
    }

    [Test]
    public void Test() {
        int n = 5;
        // Độ phức tạp không gian hằng số
        Constant(n);
        // Độ phức tạp không gian tuyến tính
        Linear(n);
        LinearRecur(n);
        // Độ phức tạp không gian bậc hai
        Quadratic(n);
        QuadraticRecur(n);
        // Độ phức tạp không gian theo cấp số mũ
        TreeNode? root = BuildTree(n);
        PrintUtil.PrintTree(root);
    }
}
