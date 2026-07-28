/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* Vật phẩm */
class Item(int w, int v) {
    public int w = w; // Trọng lượng vật phẩm
    public int v = v; // Giá trị vật phẩm
}

public class fractional_knapsack {
    /* Bài toán cái túi phân số: Giải thuật tham lam */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Tạo danh sách vật phẩm với hai thuộc tính: trọng lượng, giá trị
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sắp xếp theo giá trị đơn vị item.v / item.w từ cao đến thấp
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // Lặp để lựa chọn tham lam
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // Nếu dung lượng còn lại đủ, cho toàn bộ vật phẩm hiện tại vào túi
                res += item.v;
                cap -= item.w;
            } else {
                // Nếu dung lượng còn lại không đủ, cho một phần vật phẩm hiện tại vào túi
                res += (double)item.v / item.w * cap;
                // Không còn dung lượng, nên thoát khỏi vòng lặp
                break;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] wgt = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;

        // Giải thuật tham lam
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("Maximum item value not exceeding knapsack capacity is " + res);
    }
}