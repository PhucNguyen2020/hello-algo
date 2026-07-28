/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Driver Code */
int main() {
    /* Thêm cạnh */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, graph is" << endl;
    graph.print();

    /* Thêm cạnh */
    // Các đỉnh 1, 3 là v[0], v[1]
    graph.addEdge(v[0], v[2]);
    cout << "\nAfter adding edge 1-2, graph is" << endl;
    graph.print();

    /* Xóa cạnh */
    // Đỉnh 3 là v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\nAfter removing edge 1-3, graph is" << endl;
    graph.print();

    /* Thêm đỉnh */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\nAfter adding vertex 6, graph is" << endl;
    graph.print();

    /* Xóa đỉnh */
    // Đỉnh 3 là v[1]
    graph.removeVertex(v[1]);
    cout << "\nAfter removing vertex 3, graph is" << endl;
    graph.print();

    // Giải phóng bộ nhớ
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
