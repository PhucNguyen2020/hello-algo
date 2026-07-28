/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Lớp đồ thị vô hướng dựa trên ma trận kề */
class GraphAdjMat {
    List<int> vertices;     // Danh sách đỉnh, trong đó phần tử biểu thị "giá trị đỉnh" và chỉ số biểu thị "chỉ số đỉnh"
    List<List<int>> adjMat; // Ma trận kề, trong đó chỉ số hàng và cột tương ứng với "chỉ số đỉnh"

    /* Hàm khởi tạo */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // Thêm đỉnh
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // Thêm cạnh
        // Lưu ý rằng các phần tử của edges biểu thị chỉ số đỉnh, tức tương ứng với chỉ số phần tử của vertices
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* Lấy số lượng đỉnh */
    int Size() {
        return vertices.Count;
    }

    /* Thêm đỉnh */
    public void AddVertex(int val) {
        int n = Size();
        // Thêm giá trị của đỉnh mới vào danh sách đỉnh
        vertices.Add(val);
        // Thêm một hàng vào ma trận kề
        List<int> newRow = new(n);
        for (int j = 0; j < n; j++) {
            newRow.Add(0);
        }
        adjMat.Add(newRow);
        // Thêm một cột vào ma trận kề
        foreach (List<int> row in adjMat) {
            row.Add(0);
        }
    }

    /* Xóa đỉnh */
    public void RemoveVertex(int index) {
        if (index >= Size())
            throw new IndexOutOfRangeException();
        // Xóa đỉnh tại index khỏi danh sách đỉnh
        vertices.RemoveAt(index);
        // Xóa hàng tại index khỏi ma trận kề
        adjMat.RemoveAt(index);
        // Xóa cột tại index khỏi ma trận kề
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* Thêm cạnh */
    // Các tham số i, j tương ứng với chỉ số phần tử của vertices
    public void AddEdge(int i, int j) {
        // Xử lý chỉ số vượt biên và trường hợp bằng nhau
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // Trong đồ thị vô hướng, ma trận kề đối xứng qua đường chéo chính, tức (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Xóa cạnh */
    // Các tham số i, j tương ứng với chỉ số phần tử của vertices
    public void RemoveEdge(int i, int j) {
        // Xử lý chỉ số vượt biên và trường hợp bằng nhau
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* In ma trận kề */
    public void Print() {
        Console.Write("Vertex list = ");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("Adjacency matrix =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* Thêm cạnh */
        // Lưu ý rằng các phần tử của edges biểu thị chỉ số đỉnh, tức tương ứng với chỉ số phần tử của vertices
        int[] vertices = [1, 3, 2, 5, 4];
        int[][] edges =
        [
            [0, 1],
            [0, 3],
            [1, 2],
            [2, 3],
            [2, 4],
            [3, 4]
        ];
        GraphAdjMat graph = new(vertices, edges);
        Console.WriteLine("\nAfter initialization, graph is");
        graph.Print();

        /* Thêm cạnh */
        // Thêm đỉnh
        graph.AddEdge(0, 2);
        Console.WriteLine("\nAfter adding edge 1-2, graph is");
        graph.Print();

        /* Xóa cạnh */
        // Các đỉnh 1, 3 có chỉ số lần lượt là 0, 1
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\nAfter removing edge 1-3, graph is");
        graph.Print();

        /* Thêm đỉnh */
        graph.AddVertex(6);
        Console.WriteLine("\nAfter adding vertex 6, graph is");
        graph.Print();

        /* Xóa đỉnh */
        // Đỉnh 3 có chỉ số 1
        graph.RemoveVertex(1);
        Console.WriteLine("\nAfter removing vertex 3, graph is");
        graph.Print();
    }
}
