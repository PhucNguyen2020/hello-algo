/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Khởi tạo bảng băm */
    unordered_map<int, string> map;

    /* Thao tác thêm */
    // Thêm cặp khóa-giá trị (key, value) vào bảng băm
    map[12836] = "Xiao Ha";
    map[15937] = "Xiao Luo";
    map[16750] = "Xiao Suan";
    map[13276] = "Xiao Fa";
    map[10583] = "Xiao Ya";
    cout << "\nAfter adding is complete, hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* Thao tác truy vấn */
    // Đưa khóa vào bảng băm để lấy giá trị
    string name = map[15937];
    cout << "\nInput student ID 15937, query name " << name << endl;

    /* Thao tác xóa */
    // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
    map.erase(10583);
    cout << "\nAfter removing 10583, hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* Duyệt bảng băm */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nTraverse Key->Value using iterator" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
