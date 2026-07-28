/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Di chuyển một đĩa */
void move(vector<int> &src, vector<int> &tar) {
    // Lấy một đĩa từ đỉnh của src
    int pan = src.back();
    src.pop_back();
    // Đặt đĩa lên đỉnh của tar
    tar.push_back(pan);
}

/* Giải bài toán Tháp Hà Nội f(i) */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // Nếu chỉ còn một đĩa trong src, di chuyển trực tiếp nó sang tar
    if (i == 1) {
        move(src, tar);
        return;
    }
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar hỗ trợ
    dfs(i - 1, src, tar, buf);
    // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
    move(src, tar);
    // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src hỗ trợ
    dfs(i - 1, buf, src, tar);
}

/* Giải bài toán Tháp Hà Nội */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // Di chuyển n đĩa trên cùng từ A sang C, dùng B hỗ trợ
    dfs(n, A, B, C);
}

/* Driver Code */
int main() {
    // Phần tử cuối của danh sách là đỉnh của cột
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "Initial state:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "After disk movement:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
