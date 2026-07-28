=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Tổng đường đi nhỏ nhất: tìm kiếm vét cạn ###
def min_path_sum_dfs(grid, i, j)
  # Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
  return grid[i][j] if i == 0 && j == 0
  # Nếu chỉ số hàng hoặc cột vượt quá phạm vi, trả về chi phí +∞
  return Float::INFINITY if i < 0 || j < 0
  # Tính chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i-1, j) và (i, j-1)
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # Trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
  [left, up].min + grid[i][j]
end

### Tổng đường đi nhỏ nhất: tìm kiếm ghi nhớ ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # Nếu là ô trên cùng bên trái, kết thúc tìm kiếm
  return grid[0][0] if i == 0 && j == 0
  # Nếu chỉ số hàng hoặc cột vượt quá phạm vi, trả về chi phí +∞
  return Float::INFINITY if i < 0 || j < 0
  # Nếu đã có bản ghi, trả về ngay
  return mem[i][j] if mem[i][j] != -1
  # Chi phí đường đi nhỏ nhất của ô bên trái và ô phía trên
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # Ghi lại và trả về chi phí đường đi nhỏ nhất từ trên cùng bên trái đến (i, j)
  mem[i][j] = [left, up].min + grid[i][j]
end

### Tổng đường đi nhỏ nhất: quy hoạch động ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # Khởi tạo bảng dp
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # Chuyển trạng thái: hàng đầu
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # Chuyển trạng thái: cột đầu
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # Chuyển trạng thái: các hàng và cột còn lại
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### Tổng đường đi nhỏ nhất: quy hoạch động tối ưu không gian ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # Khởi tạo bảng dp
  dp = Array.new(m, 0)
  # Chuyển trạng thái: hàng đầu
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # Chuyển trạng thái: các hàng còn lại
  for i in 1...n
    # Chuyển trạng thái: cột đầu
    dp[0] = dp[0] + grid[i][0]
    # Chuyển trạng thái: các cột còn lại
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Mã chương trình chính ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # Tìm kiếm vét cạn
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "Minimum path sum from top-left to bottom-right is #{res}"

  # Tìm kiếm ghi nhớ
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "Minimum path sum from top-left to bottom-right is #{res}"

  # Quy hoạch động
  res = min_path_sum_dp(grid)
  puts "Minimum path sum from top-left to bottom-right is #{res}"

  # Quy hoạch động tối ưu không gian
  res = min_path_sum_dp_comp(grid)
  puts "Minimum path sum from top-left to bottom-right is #{res}"
end
