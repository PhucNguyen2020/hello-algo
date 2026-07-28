/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Bảng băm sử dụng phương pháp địa chỉ mở */
class HashMapOpenAddressing {
  private:
    int size;                             // Số lượng cặp khóa-giá trị
    int capacity = 4;                     // Dung lượng bảng băm
    const double loadThres = 2.0 / 3.0;     // Ngưỡng hệ số tải để kích hoạt mở rộng
    const int extendRatio = 2;            // Bội số mở rộng
    vector<Pair *> buckets;               // Mảng bucket (ngăn chứa)
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Dấu hiệu đã xóa

  public:
    /* Hàm khởi tạo */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* Hàm hủy */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* Hàm băm */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Hệ số tải */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* Tìm chỉ số bucket tương ứng với key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Dò tuyến tính, dừng khi gặp bucket rỗng
        while (buckets[index] != nullptr) {
            // Nếu gặp key, trả về chỉ số bucket tương ứng
            if (buckets[index]->key == key) {
                // Nếu trước đó đã gặp dấu hiệu đã xóa, di chuyển cặp khóa-giá trị đến vị trí đó
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Trả về chỉ số bucket đã di chuyển đến
                }
                return index; // Trả về chỉ số bucket
            }
            // Ghi lại dấu hiệu đã xóa đầu tiên gặp được
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Tính chỉ số bucket, quay lại đầu nếu vượt quá cuối
            index = (index + 1) % capacity;
        }
        // Nếu key không tồn tại, trả về chỉ số để chèn vào
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Thao tác truy vấn */
    string get(int key) {
        // Tìm chỉ số bucket tương ứng với key
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, trả về val tương ứng
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // Nếu cặp khóa-giá trị không tồn tại, trả về chuỗi rỗng
        return "";
    }

    /* Thao tác thêm */
    void put(int key, string val) {
        // Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
        if (loadFactor() > loadThres) {
            extend();
        }
        // Tìm chỉ số bucket tương ứng với key
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè val và trả về
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // Nếu cặp khóa-giá trị không tồn tại, thêm cặp khóa-giá trị
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Thao tác xóa */
    void remove(int key) {
        // Tìm chỉ số bucket tương ứng với key
        int index = findBucket(key);
        // Nếu tìm thấy cặp khóa-giá trị, ghi đè bằng dấu hiệu đã xóa
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Mở rộng bảng băm */
    void extend() {
        // Lưu tạm bảng băm gốc
        vector<Pair *> bucketsTmp = buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Di chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* In bảng băm */
    void print() {
        for (Pair *pair : buckets) {
            if (pair == nullptr) {
                cout << "nullptr" << endl;
            } else if (pair == TOMBSTONE) {
                cout << "TOMBSTONE" << endl;
            } else {
                cout << pair->key << " -> " << pair->val << endl;
            }
        }
    }
};

/* Driver Code */
int main() {
    // Khởi tạo bảng băm
    HashMapOpenAddressing hashmap;

    // Thao tác thêm
    // Thêm cặp khóa-giá trị (key, val) vào bảng băm
    hashmap.put(12836, "Xiao Ha");
    hashmap.put(15937, "Xiao Luo");
    hashmap.put(16750, "Xiao Suan");
    hashmap.put(13276, "Xiao Fa");
    hashmap.put(10583, "Xiao Ya");
    cout << "\nAfter adding is complete, hash table is\nKey -> Value" << endl;
    hashmap.print();

    // Thao tác truy vấn
    // Đưa khóa vào bảng băm để lấy giá trị val
    string name = hashmap.get(13276);
    cout << "\nInput student ID 13276, query name " << name << endl;

    // Thao tác xóa
    // Xóa cặp khóa-giá trị (key, val) khỏi bảng băm
    hashmap.remove(16750);
    cout << "\nAfter removing 16750, hash table is\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
