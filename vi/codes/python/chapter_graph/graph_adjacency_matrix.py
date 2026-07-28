"""
File: graph_adjacency_matrix.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, print_matrix


class GraphAdjMat:
    """Lớp đồ thị vô hướng dựa trên ma trận kề"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Hàm khởi tạo"""
        # Danh sách đỉnh, trong đó phần tử biểu diễn "giá trị đỉnh" còn chỉ số biểu diễn "chỉ số đỉnh"
        self.vertices: list[int] = []
        # Ma trận kề, trong đó chỉ số hàng và cột tương ứng với "chỉ số đỉnh"
        self.adj_mat: list[list[int]] = []
        # Thêm các đỉnh
        for val in vertices:
            self.add_vertex(val)
        # Thêm các cạnh
        # Lưu ý các phần tử của edges biểu diễn chỉ số đỉnh, tức tương ứng với chỉ số phần tử của vertices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Lấy số lượng đỉnh"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """Thêm đỉnh"""
        n = self.size()
        # Thêm giá trị của đỉnh mới vào danh sách đỉnh
        self.vertices.append(val)
        # Thêm một hàng vào ma trận kề
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # Thêm một cột vào ma trận kề
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """Xóa đỉnh"""
        if index >= self.size():
            raise IndexError()
        # Xóa đỉnh tại vị trí index khỏi danh sách đỉnh
        self.vertices.pop(index)
        # Xóa hàng tại vị trí index khỏi ma trận kề
        self.adj_mat.pop(index)
        # Xóa cột tại vị trí index khỏi ma trận kề
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Thêm cạnh"""
        # Các tham số i, j tương ứng với chỉ số phần tử của vertices
        # Xử lý trường hợp vượt chỉ số và trùng nhau
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # Trong đồ thị vô hướng, ma trận kề đối xứng qua đường chéo chính, tức (i, j) == (j, i)
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Xóa cạnh"""
        # Các tham số i, j tương ứng với chỉ số phần tử của vertices
        # Xử lý trường hợp vượt chỉ số và trùng nhau
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """In ma trận kề"""
        print("Vertex list =", self.vertices)
        print("Adjacency matrix =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # Khởi tạo đồ thị vô hướng
    # Lưu ý các phần tử của edges biểu diễn chỉ số đỉnh, tức tương ứng với chỉ số phần tử của vertices
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\nAfter initialization, the graph is")
    graph.print()

    # Thêm cạnh
    # Các đỉnh 1, 2 có chỉ số lần lượt là 0, 2
    graph.add_edge(0, 2)
    print("\nAfter adding edge 1-2, the graph is")
    graph.print()

    # Xóa cạnh
    # Các đỉnh 1, 3 có chỉ số lần lượt là 0, 1
    graph.remove_edge(0, 1)
    print("\nAfter removing edge 1-3, the graph is")
    graph.print()

    # Thêm đỉnh
    graph.add_vertex(6)
    print("\nAfter adding vertex 6, the graph is")
    graph.print()

    # Xóa đỉnh
    # Đỉnh 3 có chỉ số 1
    graph.remove_vertex(1)
    print("\nAfter removing vertex 3, the graph is")
    graph.print()
