"""
File: graph_adjacency_list.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vals_to_vets


class GraphAdjList:
    """Lớp đồ thị vô hướng dựa trên danh sách kề"""

    def __init__(self, edges: list[list[Vertex]]):
        """Hàm khởi tạo"""
        # Danh sách kề, khóa: đỉnh, giá trị: tất cả các đỉnh kề của đỉnh đó
        self.adj_list = dict[Vertex, list[Vertex]]()
        # Thêm tất cả các đỉnh và cạnh
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """Lấy số lượng đỉnh"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """Thêm cạnh"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Thêm cạnh vet1 - vet2
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """Xóa cạnh"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Xóa cạnh vet1 - vet2
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """Thêm đỉnh"""
        if vet in self.adj_list:
            return
        # Thêm một danh sách liên kết mới vào danh sách kề
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """Xóa đỉnh"""
        if vet not in self.adj_list:
            raise ValueError()
        # Xóa danh sách liên kết tương ứng với đỉnh vet trong danh sách kề
        self.adj_list.pop(vet)
        # Duyệt danh sách liên kết của các đỉnh khác và xóa tất cả các cạnh chứa vet
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """In danh sách kề"""
        print("Adjacency list =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""Driver Code"""
if __name__ == "__main__":
    # Khởi tạo đồ thị vô hướng
    v = vals_to_vets([1, 3, 2, 5, 4])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ]
    graph = GraphAdjList(edges)
    print("\nAfter initialization, the graph is")
    graph.print()

    # Thêm cạnh
    # Các đỉnh 1, 2 là v[0], v[2]
    graph.add_edge(v[0], v[2])
    print("\nAfter adding edge 1-2, the graph is")
    graph.print()

    # Xóa cạnh
    # Các đỉnh 1, 3 là v[0], v[1]
    graph.remove_edge(v[0], v[1])
    print("\nAfter removing edge 1-3, the graph is")
    graph.print()

    # Thêm đỉnh
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\nAfter adding vertex 6, the graph is")
    graph.print()

    # Xóa đỉnh
    # Đỉnh 3 là v[1]
    graph.remove_vertex(v[1])
    print("\nAfter removing vertex 3, the graph is")
    graph.print()
