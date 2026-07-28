/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver Code */
int main() {
    /* Khởi tạo bảng băm */
    ArrayHashMap map = ArrayHashMap();

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
    string name = map.get(15937);
    cout << "\nInput student ID 15937, query name " << name << endl;

    /* Thao tác xóa */
    // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
    map.remove(10583);
    cout << "\nAfter removing 10583, hash table is\nKey -> Value" << endl;
    map.print();

    /* Duyệt bảng băm */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nTraverse keys only Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nTraverse values only Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
