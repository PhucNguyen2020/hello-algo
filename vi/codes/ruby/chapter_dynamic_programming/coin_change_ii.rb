=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Đổi tiền xu II: quy hoạch động ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # Khởi tạo bảng dp
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Khởi tạo cột đầu
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # Chuyển trạng thái
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[i][a] = dp[i - 1][a]
      else
        # Tổng của hai lựa chọn: không chọn và chọn đồng xu i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### Đổi tiền xu II: quy hoạch động tối ưu không gian ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # Khởi tạo bảng dp
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # Chuyển trạng thái
  for i in 1...(n + 1)
    # Duyệt theo thứ tự thuận
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[a] = dp[a]
      else
        # Tổng của hai lựa chọn: không chọn và chọn đồng xu i
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### Mã chương trình chính ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # Quy hoạch động
  res = coin_change_ii_dp(coins, amt)
  puts "Number of coin combinations to make target amount is #{res}"

  # Quy hoạch động tối ưu không gian
  res = coin_change_ii_dp_comp(coins, amt)
  puts "Number of coin combinations to make target amount is #{res}"
end
