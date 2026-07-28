/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Bảng băm sử dụng phương pháp nối chuỗi */
class HashMapChaining {
  private:
    int size;                       // Số lượng cặp khóa-giá trị
    int capacity;                   // Dung lượng bảng băm
    double loadThres;               // Ngưỡng hệ số tải để kích hoạt mở rộng
    int extendRatio;                // Bội số mở rộng
    vector<vector<Pair *>> buckets; // Mảng bucket (ngăn chứa)

  public:
    /* Hàm khởi tạo */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* Hàm hủy */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // Giải phóng bộ nhớ
                delete pair;
            }
        }
    }

    /* Hàm băm */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Hệ số tải */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* Thao tác truy vấn */
    string get(int key) {
        int index = hashFunc(key);
        // Duyệt bucket, nếu tìm thấy key thì trả về val tương ứng
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Nếu không tìm thấy key thì trả về chuỗi rỗng
        return "";
    }

    /* Thao tác thêm */
    void put(int key, string val) {
        // Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Duyệt bucket, nếu gặp key chỉ định thì cập nhật val tương ứng và trả về
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // Nếu key không tồn tại, thêm cặp khóa-giá trị vào cuối
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Thao tác xóa */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Duyệt bucket và xóa cặp khóa-giá trị khỏi đó
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Xóa cặp khóa-giá trị khỏi đó
                delete tmp;                       // Giải phóng bộ nhớ
                size--;
                return;
            }
        }
    }

    /* Mở rộng bảng băm */
    void extend() {
        // Lưu tạm bảng băm gốc
        vector<vector<Pair *>> bucketsTmp = buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Di chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // Giải phóng bộ nhớ
                delete pair;
            }
        }
    }

    /* In bảng băm */
    void print() {
        for (auto &bucket : buckets) {
            cout << "[";
            for (Pair *pair : bucket) {
                cout << pair->key << " -> " << pair->val << ", ";
            }
            cout << "]\n";
        }
    }
};

/* Driver Code */
int main() {
    /* Khởi tạo bảng băm */
    HashMapChaining map = HashMapChaining();

    /* Thao tác thêm */
    // Thêm cặp khóa-giá trị (key, value) vào bảng băm
    map.put(12836, "Xiao Ha");
    map.put(15937, "Xiao Luo");
    map.put(16750, "Xiao Suan");
    map.put(13276, "Xiao Fa");
    map.put(10583, "Xiao Ya");
    cout << "\nAfter adding is complete, hash table is\nKey -> Value" << endl;
    map.print();

    /* Thao tác truy vấn */
    // Đưa khóa vào bảng băm để lấy giá trị
    string name = map.get(13276);
    cout << "\nInput student ID 13276, query name " << name << endl;

    /* Thao tác xóa */
    // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
    map.remove(12836);
    cout << "\nAfter removing 12836, hash table is\nKey -> Value" << endl;
    map.print();

    return 0;
}
