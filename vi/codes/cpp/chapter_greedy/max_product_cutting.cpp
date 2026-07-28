/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Cắt tích lớn nhất: Giải thuật tham lam */
int maxProductCutting(int n) {
    // Khi n <= 3, bắt buộc phải cắt ra một đoạn 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Tham lam cắt ra các đoạn 3, a là số đoạn 3, b là phần dư
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // Khi phần dư là 1, chuyển một cặp 1 * 3 thành 2 * 2
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // Khi phần dư là 2, không làm gì cả
        return (int)pow(3, a) * 2;
    }
    // Khi phần dư là 0, không làm gì cả
    return (int)pow(3, a);
}

/* Driver Code */
int main() {
    int n = 58;

    // Giải thuật tham lam
    int res = maxProductCutting(n);
    cout << "Maximum cutting product is" << res << endl;

    return 0;
}
