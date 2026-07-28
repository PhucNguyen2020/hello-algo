=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Leo cầu thang có ràng buộc: quy hoạch động ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # Trạng thái ban đầu: đặt trước lời giải cho bài toán con nhỏ nhất
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
