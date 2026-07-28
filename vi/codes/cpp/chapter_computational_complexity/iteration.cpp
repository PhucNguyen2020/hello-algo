/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Vòng lặp for */
int forLoop(int n) {
    int res = 0;
    // Tính tổng 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* Vòng lặp while */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Cập nhật biến điều kiện
    }
    return res;
}

/* Vòng lặp while (hai lần cập nhật) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Khởi tạo biến điều kiện
    // Tính tổng 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Cập nhật biến điều kiện
        i++;
        i *= 2;
    }
    return res;
}

/* Vòng lặp for lồng nhau */
string nestedForLoop(int n) {
    ostringstream res;
    // Vòng lặp i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // Vòng lặp j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nfor loop sum result res = " << res << endl;

    res = whileLoop(n);
    cout << "\nwhile loop sum result res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nwhile loop (two updates) sum result res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\nDouble for loop traversal result " << resStr << endl;

    return 0;
}
