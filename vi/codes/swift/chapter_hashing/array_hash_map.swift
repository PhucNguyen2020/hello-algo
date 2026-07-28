/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Bảng băm dựa trên cài đặt mảng */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // Khởi tạo mảng gồm 100 bucket
        buckets = Array(repeating: nil, count: 100)
    }

    /* Hàm băm */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Thao tác truy vấn */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Thao tác thêm */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Thao tác xóa */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Đặt thành nil để xóa
        buckets[index] = nil
    }

    /* Lấy tất cả các cặp khóa-giá trị */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* Lấy tất cả các khóa */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* Lấy tất cả các giá trị */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* In bảng băm */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo bảng băm */
        let map = ArrayHashMap()

        /* Thao tác thêm */
        // Thêm cặp khóa-giá trị (key, value) vào bảng băm
        map.put(key: 12836, val: "Xiao Ha")
        map.put(key: 15937, val: "Xiao Luo")
        map.put(key: 16750, val: "Xiao Suan")
        map.put(key: 13276, val: "Xiao Fa")
        map.put(key: 10583, val: "Xiao Ya")
        print("\nAfter adding is complete, hash table is\nKey -> Value")
        map.print()

        /* Thao tác truy vấn */
        // Đưa khóa vào bảng băm để lấy giá trị
        let name = map.get(key: 15937)!
        print("\nInput student ID 15937, found name \(name)")

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.remove(key: 10583)
        print("\nAfter removing 10583, hash table is\nKey -> Value")
        map.print()

        /* Duyệt bảng băm */
        print("\nTraverse key-value pairs Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nTraverse keys only Key")
        for key in map.keySet() {
            print(key)
        }
        print("\nTraverse values only Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
