/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver Code */
/* Khởi tạo bảng băm */
const map = new Map();

/* Thao tác thêm */
// Thêm cặp key-value (key, value) vào bảng băm
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');
console.info('\nAfter adding is complete, hash table is\nKey -> Value');
console.info(map);

/* Thao tác truy vấn */
// Nhập key vào bảng băm để lấy value
let name = map.get(15937);
console.info('\nInput student ID 15937, query name ' + name);

/* Thao tác xóa */
// Xóa cặp key-value (key, value) khỏi bảng băm
map.delete(10583);
console.info('\nAfter removing 10583, hash table is\nKey -> Value');
console.info(map);

/* Duyệt bảng băm */
console.info('\nTraverse key-value pairs Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nTraverse keys only Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nTraverse values only Value');
for (const v of map.values()) {
    console.info(v);
}
