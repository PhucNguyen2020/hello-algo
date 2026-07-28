/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* Hàm hỗ trợ duyệt theo chiều sâu */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Ghi lại đỉnh đã thăm
        visited.Add(vet); // Đánh dấu đỉnh này đã được thăm
        // Duyệt qua tất cả các đỉnh kề của đỉnh này
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Bỏ qua các đỉnh đã được thăm
            }
            // Thăm đệ quy các đỉnh kề
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Duyệt theo chiều sâu */
    // Sử dụng danh sách kề để biểu diễn đồ thị, nhằm lấy tất cả các đỉnh kề của một đỉnh chỉ định
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Chuỗi duyệt đỉnh
        List<Vertex> res = [];
        // Tập băm dùng để ghi lại các đỉnh đã được thăm
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* Thêm cạnh */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nAfter initialization, graph is");
        graph.Print();

        /* Duyệt theo chiều sâu */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\nDepth-first traversal (DFS) vertex sequence is");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
