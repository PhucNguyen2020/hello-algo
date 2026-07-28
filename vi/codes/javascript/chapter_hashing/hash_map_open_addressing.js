/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* Cặp key-value kiểu Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Bảng băm dùng địa chỉ mở */
class HashMapOpenAddressing {
    #size; // Số lượng cặp key-value
    #capacity; // Dung lượng bảng băm
    #loadThres; // Ngưỡng hệ số tải để kích hoạt mở rộng
    #extendRatio; // Hệ số mở rộng
    #buckets; // Mảng bucket (nhóm)
    #TOMBSTONE; // Ký hiệu đánh dấu đã xóa

    /* Hàm khởi tạo */
    constructor() {
        this.#size = 0; // Số lượng cặp key-value
        this.#capacity = 4; // Dung lượng bảng băm
        this.#loadThres = 2.0 / 3.0; // Ngưỡng hệ số tải để kích hoạt mở rộng
        this.#extendRatio = 2; // Hệ số mở rộng
        this.#buckets = Array(this.#capacity).fill(null); // Mảng bucket (nhóm)
        this.#TOMBSTONE = new Pair(-1, '-1'); // Ký hiệu đánh dấu đã xóa
    }

    /* Hàm băm */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Hệ số tải */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Tìm chỉ số bucket tương ứng với key */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // Dò tuyến tính, dừng lại khi gặp bucket rỗng
        while (this.#buckets[index] !== null) {
            // Nếu gặp key, trả về chỉ số bucket tương ứng
            if (this.#buckets[index].key === key) {
                // Nếu trước đó đã gặp ký hiệu đánh dấu đã xóa, di chuyển cặp key-value đến vị trí đó
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // Trả về chỉ số bucket sau khi di chuyển
                }
                return index; // Trả về chỉ số bucket
            }
            // Ghi lại ký hiệu đánh dấu đã xóa đầu tiên gặp được
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Tính chỉ số bucket tiếp theo, quay vòng về đầu nếu vượt quá cuối mảng
            index = (index + 1) % this.#capacity;
        }
        // Nếu key không tồn tại, trả về chỉ số để chèn vào
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Thao tác truy vấn */
    get(key) {
        // Tìm chỉ số bucket tương ứng với key
        const index = this.#findBucket(key);
        // Nếu tìm thấy cặp key-value, trả về val tương ứng
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // Nếu cặp key-value không tồn tại, trả về null
        return null;
    }

    /* Thao tác thêm */
    put(key, val) {
        // Khi hệ số tải vượt ngưỡng, tiến hành mở rộng
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // Tìm chỉ số bucket tương ứng với key
        const index = this.#findBucket(key);
        // Nếu tìm thấy cặp key-value, ghi đè val rồi trả về
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // Nếu cặp key-value không tồn tại, thêm cặp key-value mới
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* Thao tác xóa */
    remove(key) {
        // Tìm chỉ số bucket tương ứng với key
        const index = this.#findBucket(key);
        // Nếu tìm thấy cặp key-value, ghi đè bằng ký hiệu đánh dấu đã xóa
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* Mở rộng bảng băm */
    #extend() {
        // Lưu tạm bảng băm gốc
        const bucketsTmp = this.#buckets;
        // Khởi tạo bảng băm mới đã mở rộng
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // Di chuyển các cặp key-value từ bảng băm gốc sang bảng băm mới
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* In bảng băm */
    print() {
        for (const pair of this.#buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.#TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* Driver Code */
// Khởi tạo bảng băm
const hashmap = new HashMapOpenAddressing();

// Thao tác thêm
// Thêm cặp key-value (key, val) vào bảng băm
hashmap.put(12836, 'Xiao Ha');
hashmap.put(15937, 'Xiao Luo');
hashmap.put(16750, 'Xiao Suan');
hashmap.put(13276, 'Xiao Fa');
hashmap.put(10583, 'Xiao Ya');
console.log('\nAfter adding is complete, hash table is\nKey -> Value');
hashmap.print();

// Thao tác truy vấn
// Nhập key vào bảng băm để lấy value val
const name = hashmap.get(13276);
console.log('\nInput student ID 13276, query name ' + name);

// Thao tác xóa
// Xóa cặp key-value (key, val) khỏi bảng băm
hashmap.remove(16750);
console.log('\nAfter removing 16750, hash table is\nKey -> Value');
hashmap.print();
