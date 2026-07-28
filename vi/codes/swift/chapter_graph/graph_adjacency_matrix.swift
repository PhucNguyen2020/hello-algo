/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Lớp đồ thị vô hướng dựa trên ma trận kề */
class GraphAdjMat {
    private var vertices: [Int] // Danh sách đỉnh, trong đó phần tử biểu diễn "giá trị đỉnh" và chỉ số biểu diễn "chỉ số đỉnh"
    private var adjMat: [[Int]] // Ma trận kề, trong đó chỉ số hàng và cột tương ứng với "chỉ số đỉnh"

    /* Hàm khởi tạo */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // Thêm đỉnh
        for val in vertices {
            addVertex(val: val)
        }
        // Thêm cạnh
        // Lưu ý các phần tử của edges biểu diễn chỉ số đỉnh, tức tương ứng với chỉ số các phần tử của vertices
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* Lấy số lượng đỉnh */
    func size() -> Int {
        vertices.count
    }

    /* Thêm đỉnh */
    func addVertex(val: Int) {
        let n = size()
        // Thêm giá trị của đỉnh mới vào danh sách đỉnh
        vertices.append(val)
        // Thêm một hàng vào ma trận kề
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // Thêm một cột vào ma trận kề
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* Xóa đỉnh */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("Out of bounds")
        }
        // Xóa đỉnh tại vị trí index khỏi danh sách đỉnh
        vertices.remove(at: index)
        // Xóa hàng tại vị trí index khỏi ma trận kề
        adjMat.remove(at: index)
        // Xóa cột tại vị trí index khỏi ma trận kề
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* Thêm cạnh */
    // Tham số i, j tương ứng với chỉ số các phần tử của vertices
    func addEdge(i: Int, j: Int) {
        // Xử lý trường hợp chỉ số vượt giới hạn và bằng nhau
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Out of bounds")
        }
        // Trong đồ thị vô hướng, ma trận kề đối xứng qua đường chéo chính, tức (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Xóa cạnh */
    // Tham số i, j tương ứng với chỉ số các phần tử của vertices
    func removeEdge(i: Int, j: Int) {
        // Xử lý trường hợp chỉ số vượt giới hạn và bằng nhau
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Out of bounds")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* In ma trận kề */
    func print() {
        Swift.print("Vertex list = ", terminator: "")
        Swift.print(vertices)
        Swift.print("Adjacency matrix =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Mã điều khiển */
    static func main() {
        /* Thêm cạnh */
        // Lưu ý các phần tử của edges biểu diễn chỉ số đỉnh, tức tương ứng với chỉ số các phần tử của vertices
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\nAfter initialization, graph is")
        graph.print()

        /* Thêm cạnh */
        // Thêm đỉnh
        graph.addEdge(i: 0, j: 2)
        print("\nAfter adding edge 1-2, graph is")
        graph.print()

        /* Xóa cạnh */
        // Đỉnh 1, 3 có chỉ số lần lượt là 0, 1
        graph.removeEdge(i: 0, j: 1)
        print("\nAfter removing edge 1-3, graph is")
        graph.print()

        /* Thêm đỉnh */
        graph.addVertex(val: 6)
        print("\nAfter adding vertex 6, graph is")
        graph.print()

        /* Xóa đỉnh */
        // Đỉnh 3 có chỉ số 1
        graph.removeVertex(index: 1)
        print("\nAfter removing vertex 3, graph is")
        graph.print()
    }
}
