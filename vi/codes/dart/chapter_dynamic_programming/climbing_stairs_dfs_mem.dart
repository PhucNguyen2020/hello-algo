/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Tìm kiếm ghi nhớ */
int dfs(int i, List<int> mem) {
  // Đã biết dp[1] và dp[2], trả về chúng
  if (i == 1 || i == 2) return i;
  // Nếu bản ghi dp[i] đã tồn tại, trả về ngay
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // Ghi lại dp[i]
  mem[i] = count;
  return count;
}

/* Leo cầu thang: Tìm kiếm ghi nhớ */
int climbingStairsDFSMem(int n) {
  // mem[i] ghi lại tổng số lời giải để leo đến bậc thang thứ i, -1 nghĩa là chưa có bản ghi
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("Climbing $n stairs has $res solutions");
}
