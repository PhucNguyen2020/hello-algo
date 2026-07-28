/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Lớp đồ thị vô hướng dựa trên danh sách kề */
public class GraphAdjList {
    // Danh sách kề, khóa: đỉnh, giá trị: tất cả các đỉnh kề với đỉnh đó
    public private(set) var adjList: [Vertex: [Vertex]]

    /* Hàm khởi tạo */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // Thêm tất cả các đỉnh và cạnh
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* Lấy số lượng đỉnh */
    public func size() -> Int {
        adjList.count
    }

    /* Thêm cạnh */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Invalid parameter")
        }
        // Thêm cạnh vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Xóa cạnh */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Invalid parameter")
        }
        // Xóa cạnh vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* Thêm đỉnh */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // Thêm một danh sách liên kết mới vào danh sách kề
        adjList[vet] = []
    }

    /* Xóa đỉnh */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("Invalid parameter")
        }
        // Xóa danh sách liên kết tương ứng với đỉnh vet trong danh sách kề
        adjList.removeValue(forKey: vet)
        // Duyệt qua danh sách liên kết của các đỉnh khác và xóa tất cả các cạnh chứa vet
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* In danh sách kề */
    public func print() {
        Swift.print("Adjacency list =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* Mã điều khiển */
    static func main() {
        /* Thêm cạnh */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, graph is")
        graph.print()

        /* Thêm cạnh */
        // Đỉnh 1, 3 là v[0], v[1]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nAfter adding edge 1-2, graph is")
        graph.print()

        /* Xóa cạnh */
        // Đỉnh 3 là v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nAfter removing edge 1-3, graph is")
        graph.print()

        /* Thêm đỉnh */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nAfter adding vertex 6, graph is")
        graph.print()

        /* Xóa đỉnh */
        // Đỉnh 3 là v[1]
        graph.removeVertex(vet: v[1])
        print("\nAfter removing vertex 3, graph is")
        graph.print()
    }
}

#endif
