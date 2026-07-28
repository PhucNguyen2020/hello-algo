/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* Lớp danh sách */
class MyList {
    private arr: Array<number>; // Mảng (lưu trữ các phần tử của danh sách)
    private _capacity: number = 10; // Dung lượng danh sách
    private _size: number = 0; // Độ dài danh sách (số phần tử hiện tại)
    private extendRatio: number = 2; // Hệ số mở rộng dung lượng danh sách mỗi lần

    /* Constructor */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    public size(): number {
        return this._size;
    }

    /* Lấy dung lượng danh sách */
    public capacity(): number {
        return this._capacity;
    }

    /* Truy cập phần tử */
    public get(index: number): number {
        // Nếu chỉ số ngoài phạm vi, ném ra ngoại lệ như bên dưới
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        return this.arr[index];
    }

    /* Cập nhật phần tử */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        this.arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    public add(num: number): void {
        // Nếu độ dài bằng dung lượng, cần mở rộng
        if (this._size === this._capacity) this.extendCapacity();
        // Thêm phần tử mới vào cuối danh sách
        this.arr[this._size] = num;
        this._size++;
    }

    /* Chèn phần tử vào giữa danh sách */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // Cập nhật số phần tử
        this.arr[index] = num;
        this._size++;
    }

    /* Xóa phần tử */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        let num = this.arr[index];
        // Dịch chuyển tất cả phần tử sau vị trí index lùi lại một vị trí
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Cập nhật số phần tử
        this._size--;
        // Trả về phần tử đã bị xóa
        return num;
    }

    /* Mở rộng danh sách */
    public extendCapacity(): void {
        // Tạo mảng mới có độ dài bằng dung lượng mới rồi sao chép mảng gốc sang mảng mới
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // Cập nhật dung lượng
        this._capacity = this.arr.length;
    }

    /* Chuyển danh sách thành mảng */
    public toArray(): number[] {
        let size = this.size();
        // Chỉ chuyển đổi các phần tử hợp lệ trong phạm vi độ dài
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Khởi tạo danh sách */
const nums = new MyList();
/* Thêm phần tử vào cuối */
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
    // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng danh sách, kích hoạt cơ chế mở rộng
    nums.add(i);
}
console.log(
    `After expansion, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

export {};
