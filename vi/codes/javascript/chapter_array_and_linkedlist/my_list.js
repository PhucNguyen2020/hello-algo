/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Lớp danh sách (list) */
class MyList {
    #arr = new Array(); // Mảng (lưu trữ các phần tử của danh sách)
    #capacity = 10; // Dung lượng của danh sách
    #size = 0; // Độ dài danh sách (số phần tử hiện tại)
    #extendRatio = 2; // Hệ số nhân dùng để mở rộng dung lượng danh sách mỗi lần

    /* Hàm khởi tạo */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    size() {
        return this.#size;
    }

    /* Lấy dung lượng của danh sách */
    capacity() {
        return this.#capacity;
    }

    /* Truy cập phần tử */
    get(index) {
        // Nếu chỉ số vượt quá phạm vi, ném ra ngoại lệ như bên dưới
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        return this.#arr[index];
    }

    /* Cập nhật phần tử */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        this.#arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    add(num) {
        // Nếu độ dài bằng dung lượng, cần mở rộng
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Thêm phần tử mới vào cuối danh sách
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Chèn phần tử vào giữa danh sách */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Cập nhật số phần tử
        this.#arr[index] = num;
        this.#size++;
    }

    /* Xóa phần tử */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        let num = this.#arr[index];
        // Dịch chuyển tất cả phần tử sau vị trí index lùi lại một vị trí
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Cập nhật số phần tử
        this.#size--;
        // Trả về phần tử đã bị xóa
        return num;
    }

    /* Mở rộng dung lượng danh sách */
    extendCapacity() {
        // Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc rồi sao chép mảng gốc sang mảng mới
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Cập nhật dung lượng
        this.#capacity = this.#arr.length;
    }

    /* Chuyển danh sách thành mảng */
    toArray() {
        let size = this.size();
        // Chỉ chuyển đổi phạm vi hợp lệ trong độ dài size
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Chương trình chính */
/* Khởi tạo danh sách */
const nums = new MyList();
/* Thêm phần tử vào cuối danh sách */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

/* Chèn phần tử vào giữa danh sách */
nums.insert(3, 6);
console.log(`Insert number 6 at index 3, get nums = ${nums.toArray()}`);

/* Xóa phần tử */
nums.remove(3);
console.log(`Delete element at index 3, get nums = ${nums.toArray()}`);

/* Truy cập phần tử */
const num = nums.get(1);
console.log(`Access element at index 1, get num = ${num}`);

/* Cập nhật phần tử */
nums.set(1, 0);
console.log(`Update element at index 1 to 0, get nums = ${nums.toArray()}`);

/* Kiểm tra cơ chế mở rộng dung lượng */
for (let i = 0; i < 10; i++) {
    // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
    nums.add(i);
}
console.log(
    `After expansion, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);
