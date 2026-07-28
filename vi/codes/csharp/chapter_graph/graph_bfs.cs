/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* Duyệt theo chiều rộng */
    // Sử dụng danh sách kề để biểu diễn đồ thị, nhằm lấy tất cả các đỉnh kề của một đỉnh chỉ định
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Chuỗi duyệt đỉnh
        List<Vertex> res = [];
        // Tập băm dùng để ghi lại các đỉnh đã được thăm
        HashSet<Vertex> visited = [startVet];
        // Hàng đợi dùng để triển khai BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Bắt đầu từ đỉnh vet, lặp cho đến khi tất cả các đỉnh được thăm
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Lấy đỉnh ở đầu hàng đợi ra
            res.Add(vet);               // Ghi lại đỉnh đã thăm
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Bỏ qua các đỉnh đã được thăm
                }
                que.Enqueue(adjVet);   // Chỉ đưa vào hàng đợi các đỉnh chưa được thăm
                visited.Add(adjVet);   // Đánh dấu đỉnh này đã được thăm
            }
        }

        // Trả về chuỗi duyệt đỉnh
        return res;
    }

    [Test]
    public void Test() {
        /* Thêm cạnh */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nAfter initialization, graph is");
        graph.Print();

        /* Duyệt theo chiều rộng */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\nBreadth-first traversal (BFS) vertex sequence is");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
