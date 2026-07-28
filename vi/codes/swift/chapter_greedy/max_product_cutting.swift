/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* Cắt tích lớn nhất: Giải thuật tham lam */
func maxProductCutting(n: Int) -> Int {
    // Khi n <= 3, bắt buộc phải cắt ra một đoạn 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // Tham lam cắt ra các đoạn 3, a là số lượng đoạn 3, b là phần dư
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // Khi phần dư là 1, chuyển một cặp 1 * 3 thành 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // Khi phần dư là 2, không cần xử lý gì thêm
        return pow(3, a) * 2
    }
    // Khi phần dư là 0, không cần xử lý gì thêm
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // Giải thuật tham lam
        let res = maxProductCutting(n: n)
        print("Maximum cutting product is \(res)")
    }
}
