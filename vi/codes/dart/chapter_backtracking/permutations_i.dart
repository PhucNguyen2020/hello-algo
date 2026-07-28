/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Giải thuật quay lui: Hoán vị I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // Khi độ dài trạng thái bằng số phần tử, ghi lại lời giải
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Duyệt qua tất cả các lựa chọn
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
    if (!selected[i]) {
      // Thử: thực hiện lựa chọn, cập nhật trạng thái
      selected[i] = true;
      state.add(choice);
      // Tiến hành vòng lựa chọn tiếp theo
      backtrack(state, choices, selected, res);
      // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* Hoán vị I */
List<List<int>> permutationsI(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("Input array nums = $nums");
  print("All permutations res = $res");
}
