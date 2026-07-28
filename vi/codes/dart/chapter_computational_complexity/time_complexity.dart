/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Độ phức tạp hằng số */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* Độ phức tạp tuyến tính */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Độ phức tạp tuyến tính (duyệt mảng) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // Số lần lặp tỉ lệ thuận với độ dài mảng
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Độ phức tạp bình phương */
int quadratic(int n) {
  int count = 0;
  // Số lần lặp liên quan bình phương đến kích thước dữ liệu n
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* Độ phức tạp bình phương (sắp xếp nổi bọt) */
int bubbleSort(List<int> nums) {
  int count = 0; // Bộ đếm
  // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối phạm vi đó
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Hoán đổi nums[j] và nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // Hoán đổi phần tử gồm 3 thao tác đơn vị
      }
    }
  }
  return count;
}

/* Độ phức tạp hàm mũ (triển khai vòng lặp) */
int exponential(int n) {
  int count = 0, base = 1;
  // Các ô chia đôi mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* Độ phức tạp hàm mũ (triển khai đệ quy) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Độ phức tạp logarit (triển khai vòng lặp) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* Độ phức tạp logarit (triển khai đệ quy) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* Độ phức tạp tuyến tính-logarit */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Độ phức tạp giai thừa (triển khai đệ quy) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // Chia từ 1 thành n
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Driver Code */
void main() {
  // Bạn có thể sửa n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
  int n = 8;
  print('Input data size n = $n');

  int count = constant(n);
  print('Constant-time operations count = $count');

  count = linear(n);
  print('Linear-time operations count = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('Linear-time (array traversal) operations count = $count');

  count = quadratic(n);
  print('Quadratic-time operations count = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('Quadratic-time (bubble sort) operations count = $count');

  count = exponential(n);
  print('Exponential-time (iterative) operations count = $count');
  count = expRecur(n);
  print('Exponential-time (recursive) operations count = $count');

  count = logarithmic(n);
  print('Logarithmic-time (iterative) operations count = $count');
  count = logRecur(n);
  print('Logarithmic-time (recursive) operations count = $count');

  count = linearLogRecur(n);
  print('Linearithmic-time (recursive) operations count = $count');

  count = factorialRecur(n);
  print('Factorial-time (recursive) operations count = $count');
}
