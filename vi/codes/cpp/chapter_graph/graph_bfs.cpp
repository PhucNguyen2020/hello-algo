/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Duyệt theo chiều rộng */
// Dùng danh sách kề để biểu diễn đồ thị, nhằm lấy được tất cả các đỉnh kề của một đỉnh chỉ định
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Chuỗi duyệt đỉnh
    vector<Vertex *> res;
    // Tập hợp băm dùng để ghi lại các đỉnh đã được thăm
    unordered_set<Vertex *> visited = {startVet};
    // Hàng đợi dùng để cài đặt BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Bắt đầu từ đỉnh vet, lặp cho đến khi tất cả các đỉnh được thăm
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Đưa đỉnh ở đầu hàng đợi ra
        res.push_back(vet); // Ghi lại đỉnh đã thăm
        // Duyệt tất cả các đỉnh kề của đỉnh này
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Bỏ qua các đỉnh đã được thăm
            que.push(adjVet);        // Chỉ đưa vào hàng đợi các đỉnh chưa được thăm
            visited.emplace(adjVet); // Đánh dấu đỉnh này đã được thăm
        }
    }
    // Trả về chuỗi duyệt đỉnh
    return res;
}

/* Driver Code */
int main() {
    /* Thêm cạnh */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, graph is\\n";
    graph.print();

    /* Duyệt theo chiều rộng */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nBreadth-first traversal (BFS) vertex sequence is" << endl;
    printVector(vetsToVals(res));

    // Giải phóng bộ nhớ
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
