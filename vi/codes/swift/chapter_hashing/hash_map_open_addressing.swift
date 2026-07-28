/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Bảng băm dùng phương pháp địa chỉ mở (open addressing) */
class HashMapOpenAddressing {
    var size: Int // Số lượng cặp khóa-giá trị
    var capacity: Int // Dung lượng bảng băm
    var loadThres: Double // Ngưỡng hệ số tải để kích hoạt mở rộng
    var extendRatio: Int // Hệ số mở rộng
    var buckets: [Pair?] // Mảng bucket
    var TOMBSTONE: Pair // Dấu hiệu đã xóa (bia mộ)

    /* Hàm khởi tạo */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* Hàm băm */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Hệ số tải */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Tìm chỉ số bucket tương ứng với khóa */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // Dò tuyến tính, dừng lại khi gặp bucket trống
        while buckets[index] != nil {
            // Nếu gặp khóa, trả về chỉ số bucket tương ứng
            if buckets[index]!.key == key {
                // Nếu trước đó đã gặp dấu hiệu đã xóa, di chuyển cặp khóa-giá trị đến vị trí đó
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Trả về chỉ số bucket sau khi di chuyển
                }
                return index // Trả về chỉ số bucket
            }
            // Ghi nhận dấu hiệu đã xóa đầu tiên gặp phải
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // Tính chỉ số bucket tiếp theo, quay về đầu nếu vượt quá cuối
            index = (index + 1) % capacity
        }
        // Nếu khóa không tồn tại, trả về chỉ số để chèn
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* Thao tác truy vấn */
    func get(key: Int) -> String? {
        // Tìm chỉ số bucket tương ứng với khóa
        let index = findBucket(key: key)
        // Nếu tìm thấy cặp khóa-giá trị, trả về val tương ứng
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // Nếu cặp khóa-giá trị không tồn tại, trả về null
        return nil
    }

    /* Thao tác thêm */
    func put(key: Int, val: String) {
        // Khi hệ số tải vượt ngưỡng, tiến hành mở rộng
        if loadFactor() > loadThres {
            extend()
        }
        // Tìm chỉ số bucket tương ứng với khóa
        let index = findBucket(key: key)
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè val rồi trả về
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // Nếu cặp khóa-giá trị không tồn tại, thêm cặp khóa-giá trị mới
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* Thao tác xóa */
    func remove(key: Int) {
        // Tìm chỉ số bucket tương ứng với khóa
        let index = findBucket(key: key)
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè bằng dấu hiệu đã xóa
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* Mở rộng bảng băm */
    func extend() {
        // Lưu tạm bảng băm gốc
        let bucketsTmp = buckets
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // Chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* In bảng băm */
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print("\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

@main
enum _HashMapOpenAddressing {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo bảng băm */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\nAfter removing 16750, hash table is\nKey -> Value")
        map.print()
    }
}
