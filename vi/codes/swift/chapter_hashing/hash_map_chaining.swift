/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Bảng băm dùng phương pháp nối chuỗi tách biệt (separate chaining) */
class HashMapChaining {
    var size: Int // Số lượng cặp khóa-giá trị
    var capacity: Int // Dung lượng bảng băm
    var loadThres: Double // Ngưỡng hệ số tải để kích hoạt mở rộng
    var extendRatio: Int // Hệ số mở rộng
    var buckets: [[Pair]] // Mảng bucket

    /* Hàm khởi tạo */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* Hàm băm */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Hệ số tải */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Thao tác truy vấn */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Duyệt bucket, nếu tìm thấy key thì trả về val tương ứng
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Nếu không tìm thấy key thì trả về nil
        return nil
    }

    /* Thao tác thêm */
    func put(key: Int, val: String) {
        // Khi hệ số tải vượt ngưỡng, tiến hành mở rộng
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Duyệt bucket, nếu gặp khóa chỉ định thì cập nhật val tương ứng rồi trả về
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // Nếu khóa không tồn tại thì thêm cặp khóa-giá trị vào cuối
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Thao tác xóa */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Duyệt bucket và xóa cặp khóa-giá trị khỏi đó
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Mở rộng bảng băm */
    func extend() {
        // Lưu tạm bảng băm gốc
        let bucketsTmp = buckets
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* In bảng băm */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo bảng băm */
        let map = HashMapChaining()

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
        let name = map.get(key: 13276)
        print("\nInput student ID 13276, found name \(name!)")

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.remove(key: 12836)
        print("\nAfter removing 12836, hash table is\nKey -> Value")
        map.print()
    }
}
