/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Lớp đồ thị vô hướng dựa trên danh sách kề */
class GraphAdjList {
  public:
    // Danh sách kề, key: đỉnh, value: tất cả các đỉnh kề của đỉnh đó
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* Xóa nút chỉ định khỏi vector */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* Hàm khởi tạo */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // Thêm tất cả các đỉnh và cạnh
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* Lấy số lượng đỉnh */
    int size() {
        return adjList.size();
    }

    /* Thêm cạnh */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // Thêm cạnh vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* Xóa cạnh */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // Xóa cạnh vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* Thêm đỉnh */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // Thêm một danh sách liên kết mới vào danh sách kề
        adjList[vet] = vector<Vertex *>();
    }

    /* Xóa đỉnh */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("Vertex does not exist");
        // Xóa danh sách liên kết tương ứng với đỉnh vet trong danh sách kề
        adjList.erase(vet);
        // Duyệt danh sách liên kết của các đỉnh khác và xóa tất cả các cạnh chứa vet
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* In danh sách kề */
    void print() {
        cout << "Adjacency list =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// Xem graph_adjacency_list_test.cpp để biết các trường hợp kiểm thử
