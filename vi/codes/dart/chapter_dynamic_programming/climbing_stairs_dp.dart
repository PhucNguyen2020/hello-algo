/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Leo cầu thang: Quy hoạch động */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
  List<int> dp = List.filled(n + 1, 0);
  // Trạng thái khởi tạo: đặt trước lời giải của bài toán con nhỏ nhất
  dp[1] = 1;
  dp[2] = 2;
  // Chuyển trạng thái: dần giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* Leo cầu thang: Quy hoạch động tối ưu không gian */
int climbingStairsDPComp(int n) {
  if (n == 1 || n == 2) return n;
  int a = 1, b = 2;
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = a + b;
    a = tmp;
  }
  return b;
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDP(n);
  print("Climbing $n stairs has $res solutions");

  res = climbingStairsDPComp(n);
  print("Climbing $n stairs has $res solutions");
}
