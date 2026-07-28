/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // Khi tổng tập con bằng target, ghi lại lời giải
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Duyệt qua tất cả các lựa chọn
  for (int i = 0; i < choices.length; i++) {
    // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
    if (total + choices[i] > target) {
      continue;
    }
    // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
    state.add(choices[i]);
    // Tiến hành vòng lựa chọn tiếp theo
    backtrack(state, target, total + choices[i], choices, res);
    // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
    state.removeLast();
  }
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // Trạng thái (tập con)
  int total = 0; // Tổng các phần tử
  List<List<int>> res = []; // Danh sách kết quả (danh sách tập con)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum equal to $target res = $res");
  print("Please note that this method outputs results containing duplicate sets");
}
