/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // Khi tổng tập con bằng target, ghi lại lời giải
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Duyệt qua tất cả các lựa chọn
  // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
  for (int i = start; i < choices.length; i++) {
    // Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay
    // Vì mảng đã được sắp xếp, các phần tử sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
    if (target - choices[i] < 0) {
      break;
    }
    // Thử: thực hiện lựa chọn, cập nhật target, start
    state.add(choices[i]);
    // Tiến hành vòng lựa chọn tiếp theo
    backtrack(state, target - choices[i], choices, i, res);
    // Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
    state.removeLast();
  }
}

/* Giải bài toán tổng tập con I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // Trạng thái (tập con)
  nums.sort(); // Sắp xếp nums
  int start = 0; // Điểm bắt đầu duyệt
  List<List<int>> res = []; // Danh sách kết quả (danh sách tập con)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum equal to $target res = $res");
}
