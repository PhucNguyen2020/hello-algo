/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Truy cập ngẫu nhiên một phần tử */
fn random_access(nums: &[i32]) -> i32 {
    // Chọn ngẫu nhiên một số trong khoảng [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Lấy và trả về phần tử ngẫu nhiên
    let random_num = nums[random_index];
    random_num
}

/* Mở rộng độ dài mảng */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Khởi tạo một mảng với độ dài đã mở rộng
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Sao chép toàn bộ phần tử từ mảng gốc sang mảng mới
    res[0..nums.len()].copy_from_slice(nums);

    // Trả về mảng mới đã được mở rộng
    res
}

/* Chèn phần tử num vào vị trí index trong mảng */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Dịch chuyển tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Gán num vào phần tử tại vị trí index
    nums[index] = num;
}

/* Xóa phần tử tại vị trí index */
fn remove(nums: &mut [i32], index: usize) {
    // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* Duyệt mảng */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Duyệt mảng theo chỉ số
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Duyệt trực tiếp các phần tử của mảng
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* Tìm phần tử chỉ định trong mảng */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Mã điều khiển chính */
fn main() {
    /* Khởi tạo mảng */
    let arr: [i32; 5] = [0; 5];
    print!("Array arr = ");
    print_util::print_array(&arr);
    // Trong Rust, khi chỉ định độ dài ([i32; 5]) thì đó là mảng (array), còn không chỉ định độ dài (&[i32]) thì đó là lát cắt (slice)
    // Vì mảng trong Rust được thiết kế có độ dài xác định tại thời điểm biên dịch, nên chỉ hằng số mới có thể chỉ định độ dài
    // Vector là kiểu dữ liệu mà Rust thường dùng để biểu diễn mảng động
    // Để thuận tiện cho việc triển khai phương thức extend(), phần dưới đây sẽ coi vector như mảng
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nArray nums = ");
    print_util::print_array(&nums);

    // Chèn phần tử
    let random_num = random_access(&nums);
    println!("\nGet random element {} from nums", random_num);

    // Duyệt mảng
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("Extend array length to 8, resulting in nums = ");
    print_util::print_array(&nums);

    // Chèn phần tử
    insert(&mut nums, 6, 3);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums);

    // Xóa phần tử
    remove(&mut nums, 2);
    print!("\nDelete element at index 2, get nums = ");
    print_util::print_array(&nums);

    // Duyệt mảng
    traverse(&nums);

    // Tìm phần tử
    let index = find(&nums, 3).unwrap();
    println!("\nFind element 3 in nums, index = {}", index);
}
