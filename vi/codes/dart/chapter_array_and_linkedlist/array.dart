/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Truy cập ngẫu nhiên đến phần tử */
int randomAccess(List<int> nums) {
  // Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Lấy và trả về phần tử ngẫu nhiên
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Mở rộng độ dài mảng */
List<int> extend(List<int> nums, int enlarge) {
  // Khởi tạo một mảng mới với độ dài đã được mở rộng
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Sao chép tất cả phần tử từ mảng gốc sang mảng mới
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Trả về mảng mới đã được mở rộng
  return res;
}

/* Chèn phần tử _num vào mảng tại chỉ số index */
void insert(List<int> nums, int _num, int index) {
  // Dịch chuyển tất cả phần tử từ chỉ số index trở đi lùi lại một vị trí
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Gán _num cho phần tử tại chỉ số index
  nums[index] = _num;
}

/* Xóa phần tử tại chỉ số index */
void remove(List<int> nums, int index) {
  // Dịch chuyển tất cả phần tử sau chỉ số index tiến lên một vị trí
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Duyệt mảng */
void traverse(List<int> nums) {
  int count = 0;
  // Duyệt mảng theo chỉ số
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Duyệt trực tiếp các phần tử của mảng
  for (int _num in nums) {
    count += _num;
  }
  // Duyệt mảng bằng phương thức forEach
  nums.forEach((_num) {
    count += _num;
  });
}

/* Tìm phần tử được chỉ định trong mảng */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Chương trình chính */
void main() {
  /* Khởi tạo mảng */
  var arr = List.filled(5, 0);
  print('Array arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Array nums = $nums');

  /* Truy cập ngẫu nhiên đến phần tử */
  int randomNum = randomAccess(nums);
  print('Get random element $randomNum from nums');

  /* Mở rộng độ dài mảng */
  nums = extend(nums, 3);
  print('Extend array length to 8, get nums = $nums');

  /* Chèn phần tử */
  insert(nums, 6, 3);
  print("Insert number 6 at index 3, get nums = $nums");

  /* Xóa phần tử */
  remove(nums, 2);
  print("Delete element at index 2, get nums = $nums");

  /* Duyệt mảng */
  traverse(nums);

  /* Tìm phần tử */
  int index = find(nums, 3);
  print("Find element 3 in nums, index = $index");
}
