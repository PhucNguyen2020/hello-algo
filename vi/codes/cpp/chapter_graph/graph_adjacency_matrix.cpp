/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Lớp đồ thị vô hướng dựa trên ma trận kề */
class GraphAdjMat {
    vector<int> vertices;       // Danh sách đỉnh, trong đó phần tử biểu diễn "giá trị đỉnh" và chỉ số biểu diễn "chỉ số đỉnh"
    vector<vector<int>> adjMat; // Ma trận kề, trong đó chỉ số hàng và cột tương ứng với "chỉ số đỉnh"

  public:
    /* Hàm khởi tạo */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Thêm đỉnh
        for (int val : vertices) {
            addVertex(val);
        }
        // Thêm cạnh
        // Lưu ý rằng các phần tử của edges biểu diễn chỉ số đỉnh, tức là tương ứng với chỉ số phần tử của vertices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Lấy số lượng đỉnh */
    int size() const {
        return vertices.size();
    }

    /* Thêm đỉnh */
    void addVertex(int val) {
        int n = size();
        // Thêm giá trị của đỉnh mới vào danh sách đỉnh
        vertices.push_back(val);
        // Thêm một hàng vào ma trận kề
        adjMat.emplace_back(vector<int>(n, 0));
        // Thêm một cột vào ma trận kề
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* Xóa đỉnh */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("Vertex does not exist");
        }
        // Xóa đỉnh tại chỉ số index khỏi danh sách đỉnh
        vertices.erase(vertices.begin() + index);
        // Xóa hàng tại chỉ số index khỏi ma trận kề
        adjMat.erase(adjMat.begin() + index);
        // Xóa cột tại chỉ số index khỏi ma trận kề
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Thêm cạnh */
    // Tham số i, j tương ứng với chỉ số phần tử của vertices
    void addEdge(int i, int j) {
        // Xử lý trường hợp chỉ số vượt phạm vi và bằng nhau
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        // Trong đồ thị vô hướng, ma trận kề đối xứng qua đường chéo chính, tức là (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Xóa cạnh */
    // Tham số i, j tương ứng với chỉ số phần tử của vertices
    void removeEdge(int i, int j) {
        // Xử lý trường hợp chỉ số vượt phạm vi và bằng nhau
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* In ma trận kề */
    void print() {
        cout << "Vertex list = ";
        printVector(vertices);
        cout << "Adjacency matrix =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* Thêm cạnh */
    // Lưu ý rằng các phần tử của edges biểu diễn chỉ số đỉnh, tức là tương ứng với chỉ số phần tử của vertices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nAfter initialization, graph is" << endl;
    graph.print();

    /* Thêm cạnh */
    // Thêm đỉnh
    graph.addEdge(0, 2);
    cout << "\nAfter adding edge 1-2, graph is" << endl;
    graph.print();

    /* Xóa cạnh */
    // Các đỉnh 1, 3 có chỉ số lần lượt là 0, 1
    graph.removeEdge(0, 1);
    cout << "\nAfter removing edge 1-3, graph is" << endl;
    graph.print();

    /* Thêm đỉnh */
    graph.addVertex(6);
    cout << "\nAfter adding vertex 6, graph is" << endl;
    graph.print();

    /* Xóa đỉnh */
    // Đỉnh 3 có chỉ số 1
    graph.removeVertex(1);
    cout << "\nAfter removing vertex 3, graph is" << endl;
    graph.print();

    return 0;
}
