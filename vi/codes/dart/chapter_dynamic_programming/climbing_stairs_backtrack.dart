/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Quay lui */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
  if (state == n) {
    res[0]++;
  }
  // Duyệt qua tất cả các lựa chọn
  for (int choice in choices) {
    // Cắt tỉa: không được phép vượt quá bậc thang thứ n
    if (state + choice > n) continue;
    // Thử: thực hiện lựa chọn, cập nhật trạng thái
    backtrack(choices, state + choice, n, res);
    // Quay lui
  }
}

/* Leo cầu thang: Quay lui */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Có thể chọn leo lên 1 hoặc 2 bậc
  int state = 0; // Bắt đầu leo từ bậc thang thứ 0
  List<int> res = [];
  res.add(0); // Sử dụng res[0] để ghi lại số lời giải
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Climbing $n stairs has $res solutions");
}
