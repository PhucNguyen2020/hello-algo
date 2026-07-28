/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Tạo mảng có các phần tử { 1, 2, ..., n }, thứ tự bị xáo trộn */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Tạo mảng nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // Xáo trộn ngẫu nhiên các phần tử của mảng
  nums.shuffle();

  return nums;
}

/* Tìm chỉ số của số 1 trong mảng nums */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // Khi phần tử 1 nằm ở đầu mảng, đạt được độ phức tạp thời gian tốt nhất O(1)
    // Khi phần tử 1 nằm ở cuối mảng, đạt được độ phức tạp thời gian xấu nhất O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver Code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\nArray [ 1, 2, ..., n ] after shuffling = $nums');
    print('Index of number 1 is + $index');
  }
}
