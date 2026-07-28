/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Duyệt theo chiều rộng */
// Sử dụng danh sách kề để biểu diễn đồ thị, nhằm lấy được tất cả các đỉnh kề của một đỉnh chỉ định
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Chuỗi đỉnh theo thứ tự duyệt
    var res: [Vertex] = []
    // Tập hợp băm dùng để ghi nhận các đỉnh đã được thăm
    var visited: Set<Vertex> = [startVet]
    // Hàng đợi dùng để triển khai BFS
    var que: [Vertex] = [startVet]
    // Bắt đầu từ đỉnh vet, lặp cho đến khi tất cả các đỉnh đã được thăm
    while !que.isEmpty {
        let vet = que.removeFirst() // Đưa đỉnh ở đầu hàng đợi ra
        res.append(vet) // Ghi nhận đỉnh đã thăm
        // Duyệt tất cả các đỉnh kề của đỉnh này
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Bỏ qua các đỉnh đã được thăm
            }
            que.append(adjVet) // Chỉ thêm vào hàng đợi các đỉnh chưa được thăm
            visited.insert(adjVet) // Đánh dấu đỉnh này đã được thăm
        }
    }
    // Trả về chuỗi đỉnh theo thứ tự duyệt
    return res
}

@main
enum GraphBFS {
    /* Mã điều khiển */
    static func main() {
        /* Thêm cạnh */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, graph is")
        graph.print()

        /* Duyệt theo chiều rộng */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\nBreadth-first traversal (BFS) vertex sequence is")
        print(Vertex.vetsToVals(vets: res))
    }
}
