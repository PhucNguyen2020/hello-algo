/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Vật phẩm */
class Item {
  public:
    int w; // Trọng lượng vật phẩm
    int v; // Giá trị vật phẩm

    Item(int w, int v) : w(w), v(v) {
    }
};

/* Bài toán cái túi phân số: Giải thuật tham lam */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // Tạo danh sách vật phẩm với hai thuộc tính: trọng lượng, giá trị
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // Sắp xếp theo giá trị đơn vị item.v / item.w từ cao đến thấp
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // Lặp để chọn theo tham lam
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // Nếu dung lượng còn lại đủ, bỏ toàn bộ vật phẩm hiện tại vào túi
            res += item.v;
            cap -= item.w;
        } else {
            // Nếu dung lượng còn lại không đủ, bỏ một phần vật phẩm hiện tại vào túi
            res += (double)item.v / item.w * cap;
            // Không còn dung lượng, nên thoát khỏi vòng lặp
            break;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // Giải thuật tham lam
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "Maximum item value not exceeding knapsack capacity is " << res << endl;

    return 0;
}
