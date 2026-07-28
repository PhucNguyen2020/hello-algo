/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* Bảng băm dùng phương pháp địa chỉ mở (open addressing) */
class HashMapOpenAddressing {
    private int size; // Số lượng cặp khóa-giá trị
    private int capacity = 4; // Dung lượng bảng băm
    private final double loadThres = 2.0 / 3.0; // Ngưỡng hệ số tải để kích hoạt mở rộng
    private final int extendRatio = 2; // Bội số mở rộng
    private Pair[] buckets; // Mảng bucket (ngăn chứa)
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Dấu hiệu đã xóa

    /* Hàm khởi tạo */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Hàm băm */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* Hệ số tải */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* Tìm chỉ số bucket tương ứng với khóa */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Dò tuyến tính, dừng khi gặp bucket rỗng
        while (buckets[index] != null) {
            // Nếu gặp khóa, trả về chỉ số bucket tương ứng
            if (buckets[index].key == key) {
                // Nếu trước đó đã gặp dấu hiệu đã xóa, di chuyển cặp khóa-giá trị đến chỉ số đó
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Trả về chỉ số bucket đã di chuyển
                }
                return index; // Trả về chỉ số bucket
            }
            // Ghi lại dấu hiệu đã xóa đầu tiên gặp được
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Tính chỉ số bucket tiếp theo, quay về đầu nếu vượt quá cuối
            index = (index + 1) % capacity;
        }
        // Nếu khóa không tồn tại, trả về chỉ số để chèn
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Thao tác truy vấn */
    public String get(int key) {
        // Tìm chỉ số bucket tương ứng với khóa
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, trả về giá trị tương ứng
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Nếu cặp khóa-giá trị không tồn tại, trả về null
        return null;
    }

    /* Thao tác thêm */
    public void put(int key, String val) {
        // Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
        if (loadFactor() > loadThres) {
            extend();
        }
        // Tìm chỉ số bucket tương ứng với khóa
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè giá trị rồi trả về
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // Nếu cặp khóa-giá trị không tồn tại, thêm cặp khóa-giá trị
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Thao tác xóa */
    public void remove(int key) {
        // Tìm chỉ số bucket tương ứng với khóa
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè bằng dấu hiệu đã xóa
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Mở rộng bảng băm */
    private void extend() {
        // Lưu tạm bảng băm gốc
        Pair[] bucketsTmp = buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* In bảng băm */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // Khởi tạo bảng băm
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // Thao tác thêm
        // Thêm cặp khóa-giá trị (key, val) vào bảng băm
        hashmap.put(12836, "Xiao Ha");
        hashmap.put(15937, "Xiao Luo");
        hashmap.put(16750, "Xiao Suan");
        hashmap.put(13276, "Xiao Fa");
        hashmap.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        hashmap.print();

        // Thao tác truy vấn
        // Nhập khóa vào bảng băm để lấy giá trị val
        String name = hashmap.get(13276);
        System.out.println("\nInput student ID 13276, query name " + name);

        // Thao tác xóa
        // Xóa cặp khóa-giá trị (key, val) khỏi bảng băm
        hashmap.remove(16750);
        System.out.println("\nAfter removing 16750, hash table is\nKey -> Value");
        hashmap.print();
    }
}
