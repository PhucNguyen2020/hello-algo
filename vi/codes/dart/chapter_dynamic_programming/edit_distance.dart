/**
 * File: edit_distance.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Khoảng cách chỉnh sửa: Tìm kiếm vét cạn */
int editDistanceDFS(String s, String t, int i, int j) {
  // Nếu cả s và t đều rỗng, trả về 0
  if (i == 0 && j == 0) return 0;
  // Nếu s rỗng, trả về độ dài của t
  if (i == 0) return j;
  // Nếu t rỗng, trả về độ dài của s
  if (j == 0) return i;
  // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
  if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1);
  // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
  int insert = editDistanceDFS(s, t, i, j - 1);
  int delete = editDistanceDFS(s, t, i - 1, j);
  int replace = editDistanceDFS(s, t, i - 1, j - 1);
  // Trả về số bước chỉnh sửa tối thiểu
  return min(min(insert, delete), replace) + 1;
}

/* Khoảng cách chỉnh sửa: Tìm kiếm ghi nhớ */
int editDistanceDFSMem(String s, String t, List<List<int>> mem, int i, int j) {
  // Nếu cả s và t đều rỗng, trả về 0
  if (i == 0 && j == 0) return 0;
  // Nếu s rỗng, trả về độ dài của t
  if (i == 0) return j;
  // Nếu t rỗng, trả về độ dài của s
  if (j == 0) return i;
  // Nếu đã có bản ghi, trả về ngay
  if (mem[i][j] != -1) return mem[i][j];
  // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
  if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
  int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
  int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
  int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Ghi lại và trả về số bước chỉnh sửa tối thiểu
  mem[i][j] = min(min(insert, delete), replace) + 1;
  return mem[i][j];
}

/* Khoảng cách chỉnh sửa: Quy hoạch động */
int editDistanceDP(String s, String t) {
  int n = s.length, m = t.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
  // Chuyển trạng thái: hàng đầu tiên và cột đầu tiên
  for (int i = 1; i <= n; i++) {
    dp[i][0] = i;
  }
  for (int j = 1; j <= m; j++) {
    dp[0][j] = j;
  }
  // Chuyển trạng thái: các hàng và cột còn lại
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      if (s[i - 1] == t[j - 1]) {
        // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[n][m];
}

/* Khoảng cách chỉnh sửa: Quy hoạch động tối ưu không gian */
int editDistanceDPComp(String s, String t) {
  int n = s.length, m = t.length;
  List<int> dp = List.filled(m + 1, 0);
  // Chuyển trạng thái: hàng đầu tiên
  for (int j = 1; j <= m; j++) {
    dp[j] = j;
  }
  // Chuyển trạng thái: các hàng còn lại
  for (int i = 1; i <= n; i++) {
    // Chuyển trạng thái: cột đầu tiên
    int leftup = dp[0]; // Tạm thời lưu dp[i-1, j-1]
    dp[0] = i;
    // Chuyển trạng thái: các cột còn lại
    for (int j = 1; j <= m; j++) {
      int temp = dp[j];
      if (s[i - 1] == t[j - 1]) {
        // Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        dp[j] = leftup;
      } else {
        // Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
      }
      leftup = temp; // Cập nhật cho dp[i-1, j-1] của vòng tiếp theo
    }
  }
  return dp[m];
}

/* Driver Code */
void main() {
  String s = "bag";
  String t = "pack";
  int n = s.length, m = t.length;

  // Tìm kiếm vét cạn
  int res = editDistanceDFS(s, t, n, m);
  print("Changing " + s + " to " + t + " requires minimum $res edits");

  // Tìm kiếm ghi nhớ
  List<List<int>> mem = List.generate(n + 1, (_) => List.filled(m + 1, -1));
  res = editDistanceDFSMem(s, t, mem, n, m);
  print("Changing " + s + " to " + t + " requires minimum $res edits");

  // Quy hoạch động
  res = editDistanceDP(s, t);
  print("Changing " + s + " to " + t + " requires minimum $res edits");

  // Quy hoạch động tối ưu không gian
  res = editDistanceDPComp(s, t);
  print("Changing " + s + " to " + t + " requires minimum $res edits");
}
