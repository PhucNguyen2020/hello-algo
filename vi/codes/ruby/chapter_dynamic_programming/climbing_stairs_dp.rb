=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Leo cầu thang: quy hoạch động ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
  dp = Array.new(n + 1, 0)
  # Trạng thái ban đầu: đặt trước lời giải cho bài toán con nhỏ nhất
  dp[1], dp[2] = 1, 2
  # Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### Leo cầu thang: quy hoạch động tối ưu không gian ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "Climbing #{n} stairs has #{res} solutions"

  res = climbing_stairs_dp_comp(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
