=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Đổi tiền xu: quy hoạch động ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Khởi tạo bảng dp
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # Chuyển trạng thái: hàng đầu và cột đầu
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # Chuyển trạng thái: các hàng và cột còn lại
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[i][a] = dp[i - 1][a]
      else
        # Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### Đổi tiền xu: quy hoạch động tối ưu không gian ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # Khởi tạo bảng dp
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # Chuyển trạng thái
  for i in 1...(n + 1)
    # Duyệt theo thứ tự thuận
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # Nếu vượt quá số tiền mục tiêu, không chọn đồng xu i
        dp[a] = dp[a]
      else
        # Giá trị nhỏ hơn giữa việc không chọn và chọn đồng xu i
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### Mã chương trình chính ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # Quy hoạch động
  res = coin_change_dp(coins, amt)
  puts "Minimum coins needed to make target amount is #{res}"

  # Quy hoạch động tối ưu không gian
  res = coin_change_dp_comp(coins, amt)
  puts "Minimum coins needed to make target amount is #{res}"
end
