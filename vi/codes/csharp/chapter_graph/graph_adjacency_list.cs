/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Lớp đồ thị vô hướng dựa trên danh sách kề */
public class GraphAdjList {
    // Danh sách kề, khóa: đỉnh, giá trị: tất cả các đỉnh kề của đỉnh đó
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* Hàm khởi tạo */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // Thêm tất cả các đỉnh và cạnh
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* Lấy số lượng đỉnh */
    int Size() {
        return adjList.Count;
    }

    /* Thêm cạnh */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Thêm cạnh vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* Xóa cạnh */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Xóa cạnh vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* Thêm đỉnh */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // Thêm một danh sách liên kết mới vào danh sách kề
        adjList.Add(vet, []);
    }

    /* Xóa đỉnh */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // Xóa danh sách liên kết tương ứng với đỉnh vet trong danh sách kề
        adjList.Remove(vet);
        // Duyệt qua danh sách liên kết của các đỉnh khác và xóa tất cả các cạnh chứa vet
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* In danh sách kề */
    public void Print() {
        Console.WriteLine("Adjacency list =");
        foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
            List<int> tmp = [];
            foreach (Vertex vertex in pair.Value)
                tmp.Add(vertex.val);
            Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
        }
    }
}

public class graph_adjacency_list {
    [Test]
    public void Test() {
        /* Thêm cạnh */
        Vertex[] v = Vertex.ValsToVets([1, 3, 2, 5, 4]);
        Vertex[][] edges =
        [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[3]],
            [v[2], v[4]],
            [v[3], v[4]]
        ];
        GraphAdjList graph = new(edges);
        Console.WriteLine("\nAfter initialization, graph is");
        graph.Print();

        /* Thêm cạnh */
        // Các đỉnh 1, 3 là v[0], v[1]
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\nAfter adding edge 1-2, graph is");
        graph.Print();

        /* Xóa cạnh */
        // Đỉnh 3 là v[1]
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\nAfter removing edge 1-3, graph is");
        graph.Print();

        /* Thêm đỉnh */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\nAfter adding vertex 6, graph is");
        graph.Print();

        /* Xóa đỉnh */
        // Đỉnh 3 là v[1]
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\nAfter removing vertex 3, graph is");
        graph.Print();
    }
}
