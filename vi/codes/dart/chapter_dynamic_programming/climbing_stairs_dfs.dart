/**
 * File: climbing_stairs_dfs.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Tìm kiếm */
int dfs(int i) {
  // Đã biết dp[1] và dp[2], trả về chúng
  if (i == 1 || i == 2) return i;
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1) + dfs(i - 2);
  return count;
}

/* Leo cầu thang: Tìm kiếm */
int climbingStairsDFS(int n) {
  return dfs(n);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFS(n);
  print("Climbing $n stairs has $res solutions");
}
