/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* Bảng băm dùng phương pháp nối dây chuyền (separate chaining) */
class HashMapChaining {
    int size; // Số lượng cặp khóa-giá trị
    int capacity; // Dung lượng bảng băm
    double loadThres; // Ngưỡng hệ số tải để kích hoạt mở rộng
    int extendRatio; // Bội số mở rộng
    List<List<Pair>> buckets; // Mảng bucket (ngăn chứa)

    /* Hàm khởi tạo */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* Hàm băm */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Hệ số tải */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* Thao tác truy vấn */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Duyệt bucket, nếu tìm thấy khóa thì trả về giá trị tương ứng
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Nếu không tìm thấy khóa, trả về null
        return null;
    }

    /* Thao tác thêm */
    void put(int key, String val) {
        // Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Duyệt bucket, nếu gặp khóa đã cho thì cập nhật giá trị tương ứng rồi trả về
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // Nếu khóa chưa tồn tại, thêm cặp khóa-giá trị vào cuối
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* Thao tác xóa */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Duyệt bucket và xóa cặp khóa-giá trị khỏi đó
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* Mở rộng bảng băm */
    void extend() {
        // Lưu tạm bảng băm gốc
        List<List<Pair>> bucketsTmp = buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // Chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* In bảng băm */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* Khởi tạo bảng băm */
        HashMapChaining map = new HashMapChaining();

        /* Thao tác thêm */
        // Thêm cặp khóa-giá trị (key, value) vào bảng băm
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        map.print();

        /* Thao tác truy vấn */
        // Nhập khóa vào bảng băm để lấy giá trị
        String name = map.get(13276);
        System.out.println("\nInput student ID 13276, query name " + name);

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.remove(12836);
        System.out.println("\nAfter removing 12836, hash table is\nKey -> Value");
        map.print();
    }
}
