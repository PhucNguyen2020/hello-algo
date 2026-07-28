/**
 * File: max_capacity.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Dung tích lớn nhất: Giải thuật tham lam */
func maxCapacity(ht: [Int]) -> Int {
    // Khởi tạo i, j nằm ở hai đầu của mảng
    var i = ht.startIndex, j = ht.endIndex - 1
    // Dung tích lớn nhất ban đầu là 0
    var res = 0
    // Lặp để lựa chọn tham lam cho đến khi hai tấm ván gặp nhau
    while i < j {
        // Cập nhật dung tích lớn nhất
        let cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Di chuyển tấm ván ngắn hơn vào trong
        if ht[i] < ht[j] {
            i += 1
        } else {
            j -= 1
        }
    }
    return res
}

@main
enum MaxCapacity {
    /* Mã điều khiển */
    static func main() {
        let ht = [3, 8, 5, 2, 7, 7, 3, 4]

        // Giải thuật tham lam
        let res = maxCapacity(ht: ht)
        print("Maximum capacity is \(res)")
    }
}
