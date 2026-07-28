/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Hàm phụ trợ duyệt theo chiều sâu */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // Ghi lại đỉnh đã thăm
    visited.emplace(vet); // Đánh dấu đỉnh này đã được thăm
    // Duyệt tất cả các đỉnh kề của đỉnh này
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // Bỏ qua các đỉnh đã được thăm
        // Thăm đệ quy các đỉnh kề
        dfs(graph, visited, res, adjVet);
    }
}

/* Duyệt theo chiều sâu */
// Dùng danh sách kề để biểu diễn đồ thị, nhằm lấy được tất cả các đỉnh kề của một đỉnh chỉ định
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // Chuỗi duyệt đỉnh
    vector<Vertex *> res;
    // Tập hợp băm dùng để ghi lại các đỉnh đã được thăm
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
int main() {
    /* Thêm cạnh */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, graph is" << endl;
    graph.print();

    /* Duyệt theo chiều sâu */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\nDepth-first traversal (DFS) vertex sequence is" << endl;
    printVector(vetsToVals(res));

    // Giải phóng bộ nhớ
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
