/**
 * File: array_hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Cặp khóa-giá trị */
struct Pair {
  public:
    int key;
    string val;
    Pair(int key, string val) {
        this->key = key;
        this->val = val;
    }
};

/* Bảng băm cài đặt dựa trên mảng */
class ArrayHashMap {
  private:
    vector<Pair *> buckets;

  public:
    ArrayHashMap() {
        // Khởi tạo mảng với 100 bucket (ngăn chứa)
        buckets = vector<Pair *>(100);
    }

    ~ArrayHashMap() {
        // Giải phóng bộ nhớ
        for (const auto &bucket : buckets) {
            delete bucket;
        }
        buckets.clear();
    }

    /* Hàm băm */
    int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Thao tác truy vấn */
    string get(int key) {
        int index = hashFunc(key);
        Pair *pair = buckets[index];
        if (pair == nullptr)
            return "";
        return pair->val;
    }

    /* Thao tác thêm */
    void put(int key, string val) {
        Pair *pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets[index] = pair;
    }

    /* Thao tác xóa */
    void remove(int key) {
        int index = hashFunc(key);
        // Giải phóng bộ nhớ và gán về nullptr
        delete buckets[index];
        buckets[index] = nullptr;
    }

    /* Lấy tất cả các cặp khóa-giá trị */
    vector<Pair *> pairSet() {
        vector<Pair *> pairSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                pairSet.push_back(pair);
            }
        }
        return pairSet;
    }

    /* Lấy tất cả các khóa */
    vector<int> keySet() {
        vector<int> keySet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                keySet.push_back(pair->key);
            }
        }
        return keySet;
    }

    /* Lấy tất cả các giá trị */
    vector<string> valueSet() {
        vector<string> valueSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                valueSet.push_back(pair->val);
            }
        }
        return valueSet;
    }

    /* In bảng băm */
    void print() {
        for (Pair *kv : pairSet()) {
            cout << kv->key << " -> " << kv->val << endl;
        }
    }
};

// Xem array_hash_map_test.cpp để biết các trường hợp kiểm thử
