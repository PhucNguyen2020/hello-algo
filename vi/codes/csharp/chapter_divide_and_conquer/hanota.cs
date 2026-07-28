/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* Di chuyển một đĩa */
    void Move(List<int> src, List<int> tar) {
        // Lấy một đĩa từ đỉnh của src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Đặt đĩa lên đỉnh của tar
        tar.Add(pan);
    }

    /* Giải bài toán Tháp Hà Nội f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó đến tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Bài toán con f(i-1): di chuyển i-1 đĩa trên đỉnh từ src sang buf, dùng tar làm trung gian
        DFS(i - 1, src, tar, buf);
        // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
        Move(src, tar);
        // Bài toán con f(i-1): di chuyển i-1 đĩa trên đỉnh từ buf sang tar, dùng src làm trung gian
        DFS(i - 1, buf, src, tar);
    }

    /* Giải bài toán Tháp Hà Nội */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Di chuyển n đĩa trên đỉnh từ A sang C, dùng B làm trung gian
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // Đuôi của danh sách là đỉnh của cột
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("In initial state:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("After disk movement is complete:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
