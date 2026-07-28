/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Cặp key-value kiểu Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Bảng băm dùng phương pháp nối dây chuyền */
class HashMapChaining {
    #size; // Số lượng cặp key-value
    #capacity; // Dung lượng bảng băm
    #loadThres; // Ngưỡng hệ số tải để kích hoạt mở rộng
    #extendRatio; // Hệ số mở rộng
    #buckets; // Mảng bucket (nhóm)

    /* Hàm khởi tạo */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* Hàm băm */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Hệ số tải */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Thao tác truy vấn */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Duyệt bucket, nếu tìm thấy key thì trả về val tương ứng
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Nếu không tìm thấy key, trả về null
        return null;
    }

    /* Thao tác thêm */
    put(key, val) {
        // Khi hệ số tải vượt ngưỡng, tiến hành mở rộng
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Duyệt bucket, nếu gặp key đã chỉ định thì cập nhật val tương ứng rồi trả về
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // Nếu key chưa tồn tại, thêm cặp key-value vào cuối
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Thao tác xóa */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Duyệt bucket và xóa cặp key-value khỏi đó
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Mở rộng bảng băm */
    #extend() {
        // Lưu tạm bảng băm gốc
        const bucketsTmp = this.#buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Di chuyển các cặp key-value từ bảng băm gốc sang bảng băm mới
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* In bảng băm */
    print() {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* Khởi tạo bảng băm */
const map = new HashMapChaining();

/* Thao tác thêm */
// Thêm cặp key-value (key, value) vào bảng băm
map.put(12836, 'Xiao Ha');
map.put(15937, 'Xiao Luo');
map.put(16750, 'Xiao Suan');
map.put(13276, 'Xiao Fa');
map.put(10583, 'Xiao Ya');
console.log('\nAfter adding is complete, hash table is\nKey -> Value');
map.print();

/* Thao tác truy vấn */
// Nhập key vào bảng băm để lấy value
const name = map.get(13276);
console.log('\nInput student ID 13276, query name ' + name);

/* Thao tác xóa */
// Xóa cặp key-value (key, value) khỏi bảng băm
map.remove(12836);
console.log('\nAfter removing 12836, hash table is\nKey -> Value');
map.print();
