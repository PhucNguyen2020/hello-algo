/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Cặp key-value kiểu Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Bảng băm dựa trên cài đặt mảng */
class ArrayHashMap {
    #buckets;
    constructor() {
        // Khởi tạo mảng với 100 bucket (nhóm)
        this.#buckets = new Array(100).fill(null);
    }

    /* Hàm băm */
    #hashFunc(key) {
        return key % 100;
    }

    /* Thao tác truy vấn */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Thao tác thêm */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Thao tác xóa */
    delete(key) {
        let index = this.#hashFunc(key);
        // Đặt về null để biểu thị đã xóa
        this.#buckets[index] = null;
    }

    /* Lấy tất cả cặp key-value */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* Lấy tất cả key */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* Lấy tất cả value */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* In bảng băm */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* Driver Code */
/* Khởi tạo bảng băm */
const map = new ArrayHashMap();
/* Thao tác thêm */
// Thêm cặp key-value (key, value) vào bảng băm
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');
console.info('\nAfter adding is complete, hash table is\nKey -> Value');
map.print();

/* Thao tác truy vấn */
// Nhập key vào bảng băm để lấy value
let name = map.get(15937);
console.info('\nInput student ID 15937, query name ' + name);

/* Thao tác xóa */
// Xóa cặp key-value (key, value) khỏi bảng băm
map.delete(10583);
console.info('\nAfter removing 10583, hash table is\nKey -> Value');
map.print();

/* Duyệt bảng băm */
console.info('\nTraverse key-value pairs Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nTraverse keys only Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nTraverse values only Value');
for (const val of map.values()) {
    console.info(val);
}
