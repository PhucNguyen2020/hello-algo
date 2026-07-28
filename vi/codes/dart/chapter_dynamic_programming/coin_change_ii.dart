/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Đổi tiền xu II: Quy hoạch động */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // Khởi tạo bảng dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // Khởi tạo cột đầu tiên
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // Chuyển trạng thái
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[i][a] = dp[i - 1][a];
      } else {
        // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* Đổi tiền xu II: Quy hoạch động tối ưu không gian */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // Khởi tạo bảng dp
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // Chuyển trạng thái
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[a] = dp[a];
      } else {
        // Tổng của hai lựa chọn: không chọn và chọn đồng xu i
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // Quy hoạch động
  int res = coinChangeIIDP(coins, amt);
  print("Number of coin combinations to make target amount is $res");

  // Quy hoạch động tối ưu không gian
  res = coinChangeIIDPComp(coins, amt);
  print("Number of coin combinations to make target amount is $res");
}
