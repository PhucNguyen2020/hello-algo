/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Vật phẩm */
class Item {
    var w: Int // Trọng lượng vật phẩm
    var v: Int // Giá trị vật phẩm

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* Bài toán cái túi phân số: Giải thuật tham lam */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // Tạo danh sách vật phẩm với hai thuộc tính: trọng lượng, giá trị
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // Sắp xếp theo giá trị đơn vị item.v / item.w giảm dần
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // Lặp để lựa chọn tham lam
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // Nếu dung lượng còn lại đủ chứa, cho toàn bộ vật phẩm hiện tại vào túi
            res += Double(item.v)
            cap -= item.w
        } else {
            // Nếu dung lượng còn lại không đủ, cho một phần vật phẩm hiện tại vào túi
            res += Double(item.v) / Double(item.w) * Double(cap)
            // Không còn dung lượng nào nữa, thoát khỏi vòng lặp
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Mã điều khiển */
    static func main() {
        // Trọng lượng vật phẩm
        let wgt = [10, 20, 30, 40, 50]
        // Giá trị vật phẩm
        let val = [50, 120, 150, 210, 240]
        // Dung lượng túi
        let cap = 50

        // Giải thuật tham lam
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("Maximum item value not exceeding knapsack capacity is \(res)")
    }
}
