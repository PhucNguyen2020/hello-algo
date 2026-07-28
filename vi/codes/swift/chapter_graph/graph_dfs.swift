/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Hàm trợ giúp duyệt theo chiều sâu */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // Ghi nhận đỉnh đã thăm
    visited.insert(vet) // Đánh dấu đỉnh này đã được thăm
    // Duyệt tất cả các đỉnh kề của đỉnh này
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // Bỏ qua các đỉnh đã được thăm
        }
        // Thăm đệ quy các đỉnh kề
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* Duyệt theo chiều sâu */
// Sử dụng danh sách kề để biểu diễn đồ thị, nhằm lấy được tất cả các đỉnh kề của một đỉnh chỉ định
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Chuỗi đỉnh theo thứ tự duyệt
    var res: [Vertex] = []
    // Tập hợp băm dùng để ghi nhận các đỉnh đã được thăm
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Mã điều khiển */
    static func main() {
        /* Thêm cạnh */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, graph is")
        graph.print()

        /* Duyệt theo chiều sâu */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\nDepth-first traversal (DFS) vertex sequence is")
        print(Vertex.vetsToVals(vets: res))
    }
}
