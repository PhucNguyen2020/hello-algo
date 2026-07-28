/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Lớp danh sách (List) */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // Mảng (lưu trữ các phần tử của danh sách)
    capacity: usize,     // Dung lượng danh sách
    size: usize,         // Độ dài danh sách (số lượng phần tử hiện tại)
    extend_ratio: usize, // Hệ số mà dung lượng danh sách được mở rộng mỗi lần
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* Hàm khởi tạo */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* Lấy độ dài danh sách (số lượng phần tử hiện tại) */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* Lấy dung lượng danh sách */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* Truy cập phần tử */
    pub fn get(&self, index: usize) -> i32 {
        // Nếu chỉ số vượt quá giới hạn, ném ra ngoại lệ như bên dưới
        if index >= self.size {
            panic!("Index out of bounds")
        };
        return self.arr[index];
    }

    /* Cập nhật phần tử */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("Index out of bounds")
        };
        self.arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    pub fn add(&mut self, num: i32) {
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // Cập nhật số lượng phần tử
        self.size += 1;
    }

    /* Chèn phần tử vào giữa danh sách */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // Dịch chuyển tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // Cập nhật số lượng phần tử
        self.size += 1;
    }

    /* Xóa phần tử */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("Index out of bounds")
        };
        let num = self.arr[index];
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // Cập nhật số lượng phần tử
        self.size -= 1;
        // Trả về phần tử đã bị xóa
        return num;
    }

    /* Mở rộng dung lượng danh sách */
    pub fn extend_capacity(&mut self) {
        // Tạo một mảng mới có độ dài gấp extend_ratio lần mảng gốc, sao chép mảng gốc sang mảng mới
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // Cập nhật dung lượng
        self.capacity = new_capacity;
    }

    /* Chuyển danh sách thành mảng */
    pub fn to_array(&self) -> Vec<i32> {
        // Chỉ chuyển đổi các phần tử hợp lệ trong phạm vi độ dài
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Mã điều khiển chính */
fn main() {
    /* Khởi tạo danh sách */
    let mut nums = MyList::new(10);
    /* Thêm phần tử vào cuối danh sách */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("List nums = ");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());

    /* Chèn phần tử vào giữa danh sách */
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums.to_array());

    /* Xóa phần tử */
    nums.remove(3);
    print!("\nDelete element at index 3, get nums = ");
    print_util::print_array(&nums.to_array());

    /* Truy cập phần tử */
    let num = nums.get(1);
    println!("\nAccess element at index 1, get num = {num}");

    /* Cập nhật phần tử */
    nums.set(1, 0);
    print!("Update element at index 1 to 0, resulting in nums = ");
    print_util::print_array(&nums.to_array());

    /* Kiểm tra cơ chế mở rộng dung lượng */
    for i in 0..10 {
        // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng danh sách, kích hoạt cơ chế mở rộng
        nums.add(i);
    }
    print!("\nAfter expanding list, nums = ");
    print_util::print_array(&nums.to_array());
    print!(", capacity = {}, length = {}", nums.capacity(), nums.size());
}
