/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Mã điều khiển chính */
fn main() {
    // Khởi tạo danh sách (list)
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums = ");
    print_util::print_array(&nums);

    // Truy cập phần tử
    let num = nums[1];
    println!("\nAccess element at index 1, get num = {num}");

    // Cập nhật phần tử
    nums[1] = 0;
    print!("Update element at index 1 to 0, resulting in nums = ");
    print_util::print_array(&nums);

    // Xóa toàn bộ phần tử
    nums.clear();
    print!("\nAfter clearing list, nums = ");
    print_util::print_array(&nums);

    // Thêm phần tử vào cuối danh sách
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nAfter adding elements, nums = ");
    print_util::print_array(&nums);

    // Chèn phần tử vào giữa danh sách
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums);

    // Xóa phần tử
    nums.remove(3);
    print!("\nDelete element at index 3, get nums = ");
    print_util::print_array(&nums);

    // Duyệt danh sách theo chỉ số
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Duyệt trực tiếp các phần tử của danh sách
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // Nối hai danh sách
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // Sau khi append (di chuyển), nums1 sẽ rỗng!

    // nums.extend(&nums1);   // extend (mượn) cho phép nums1 tiếp tục được sử dụng
    print!("\nAfter concatenating list nums1 to nums, get nums = ");
    print_util::print_array(&nums);

    // Sắp xếp danh sách
    nums.sort();
    print!("\nAfter sorting list, nums = ");
    print_util::print_array(&nums);
}
