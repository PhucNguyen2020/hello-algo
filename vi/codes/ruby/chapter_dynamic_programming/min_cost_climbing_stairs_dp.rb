=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Chi phí tối thiểu để leo cầu thang: quy hoạch động ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # Khởi tạo bảng dp, dùng để lưu lời giải của các bài toán con
  dp = Array.new(n + 1, 0)
  # Trạng thái ban đầu: đặt trước lời giải cho bài toán con nhỏ nhất
  dp[1], dp[2] = cost[1], cost[2]
  # Chuyển trạng thái: lần lượt giải các bài toán con lớn hơn từ các bài toán con nhỏ hơn
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

# Chi phí tối thiểu để leo cầu thang: quy hoạch động tối ưu không gian
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### Mã chương trình chính ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "Input stair cost list is #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "Minimum cost to climb stairs is #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "Minimum cost to climb stairs is #{res}"
end
