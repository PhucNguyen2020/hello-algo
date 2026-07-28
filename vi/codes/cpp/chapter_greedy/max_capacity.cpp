/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Dung tích lớn nhất: Giải thuật tham lam */
int maxCapacity(vector<int> &ht) {
    // Khởi tạo i, j nằm ở hai đầu của mảng
    int i = 0, j = ht.size() - 1;
    // Dung tích lớn nhất ban đầu là 0
    int res = 0;
    // Lặp để chọn theo tham lam cho đến khi hai tấm ván gặp nhau
    while (i < j) {
        // Cập nhật dung tích lớn nhất
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // Di chuyển tấm ván ngắn hơn vào trong
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // Giải thuật tham lam
    int res = maxCapacity(ht);
    cout << "Maximum capacity is " << res << endl;

    return 0;
}
