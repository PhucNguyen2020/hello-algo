/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Chương trình chính */
void main() {
  /* Khởi tạo danh sách (list) */
  List<int> nums = [1, 3, 2, 5, 4];
  print('List nums = $nums');

  /* Cập nhật phần tử */
  int _num = nums[1];
  print('Access element at index 1, get _num = $_num');

  /* Thêm phần tử vào cuối danh sách */
  nums[1] = 0;
  print('Update element at index 1 to 0, get nums = $nums');

  /* Xóa phần tử */
  nums.clear();
  print('After clearing list, nums = $nums');

  /* Duyệt trực tiếp các phần tử của danh sách */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('After adding elements, nums = $nums');

  /* Sắp xếp danh sách */
  nums.insert(3, 6);
  print('Insert number 6 at index 3, get nums = $nums');

  /* Xóa phần tử */
  nums.removeAt(3);
  print('Delete element at index 3, get nums = $nums');

  /* Duyệt danh sách theo chỉ số */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Duyệt trực tiếp các phần tử của danh sách */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Nối hai danh sách */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('After concatenating list nums1 to nums, get nums = $nums');

  /* Sắp xếp danh sách */
  nums.sort();
  print('After sorting list, nums = $nums');
}
