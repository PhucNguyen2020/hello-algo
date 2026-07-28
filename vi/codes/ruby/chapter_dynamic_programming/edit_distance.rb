=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Khoảng cách chỉnh sửa: tìm kiếm vét cạn ###
def edit_distance_dfs(s, t, i, j)
  # Nếu cả s và t đều rỗng, trả về 0
  return 0 if i == 0 && j == 0
  # Nếu s rỗng, trả về độ dài của t
  return j if i == 0
  # Nếu t rỗng, trả về độ dài của s
  return i if j == 0
  # Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Trả về số bước chỉnh sửa tối thiểu
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # Nếu cả s và t đều rỗng, trả về 0
  return 0 if i == 0 && j == 0
  # Nếu s rỗng, trả về độ dài của t
  return j if i == 0
  # Nếu t rỗng, trả về độ dài của s
  return i if j == 0
  # Nếu đã có bản ghi, trả về ngay
  return mem[i][j] if mem[i][j] != -1
  # Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Ghi lại và trả về số bước chỉnh sửa tối thiểu
  mem[i][j] = [insert, delete, replace].min + 1
end

### Khoảng cách chỉnh sửa: quy hoạch động ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # Chuyển trạng thái: hàng đầu và cột đầu
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # Chuyển trạng thái: các hàng và cột còn lại
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### Khoảng cách chỉnh sửa: quy hoạch động tối ưu không gian ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # Chuyển trạng thái: hàng đầu
  (1...(m + 1)).each { |j| dp[j] = j }
  # Chuyển trạng thái: các hàng còn lại
  for i in 1...(n + 1)
    # Chuyển trạng thái: cột đầu
    leftup = dp.first # Tạm thời lưu dp[i-1, j-1]
    dp[0] += 1
    # Chuyển trạng thái: các cột còn lại
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # Nếu hai ký tự bằng nhau, bỏ qua cả hai ký tự
        dp[j] = leftup
      else
        # Số bước chỉnh sửa tối thiểu = số bước chỉnh sửa tối thiểu của chèn, xóa, thay thế + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Cập nhật cho dp[i-1, j-1] của vòng tiếp theo
    end
  end
  dp[m]
end

### Mã chương trình chính ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # Tìm kiếm vét cạn
  res = edit_distance_dfs(s, t, n, m)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Tìm kiếm ghi nhớ
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Quy hoạch động
  res = edit_distance_dp(s, t)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Quy hoạch động tối ưu không gian
  res = edit_distance_dp_comp(s, t)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"
end
