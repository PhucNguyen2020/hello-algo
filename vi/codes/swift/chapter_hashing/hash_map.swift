/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo bảng băm */
        var map: [Int: String] = [:]

        /* Thao tác thêm */
        // Thêm cặp khóa-giá trị (key, value) vào bảng băm
        map[12836] = "Xiao Ha"
        map[15937] = "Xiao Luo"
        map[16750] = "Xiao Suan"
        map[13276] = "Xiao Fa"
        map[10583] = "Xiao Ya"
        print("\nAfter adding is complete, hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Thao tác truy vấn */
        // Đưa khóa vào bảng băm để lấy giá trị
        let name = map[15937]!
        print("\nInput student ID 15937, found name \(name)")

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.removeValue(forKey: 10583)
        print("\nAfter removing 10583, hash table is\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Duyệt bảng băm */
        print("\nTraverse key-value pairs Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nTraverse keys only Key")
        for key in map.keys {
            print(key)
        }
        print("\nTraverse values only Value")
        for value in map.values {
            print(value)
        }
    }
}
