=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Tìm kiếm ghi nhớ ###
def dfs(i, mem)
  # Đã biết dp[1] và dp[2], trả về chúng
  return i if i == 1 || i == 2
  # Nếu bản ghi dp[i] đã tồn tại, trả về ngay
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # Ghi lại dp[i]
  mem[i] = count
end

### Leo cầu thang: tìm kiếm ghi nhớ ###
def climbing_stairs_dfs_mem(n)
  # mem[i] ghi lại tổng số lời giải để leo đến bậc thứ i, -1 nghĩa là chưa có bản ghi
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
