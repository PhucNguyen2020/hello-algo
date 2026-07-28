=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Tìm kiếm ###
def dfs(i)
  # Đã biết dp[1] và dp[2], trả về chúng
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### Leo cầu thang: tìm kiếm ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
