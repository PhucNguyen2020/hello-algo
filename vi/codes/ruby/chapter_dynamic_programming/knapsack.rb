=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Bài toán cái túi 0-1: tìm kiếm vét cạn ###
def knapsack_dfs(wgt, val, i, c)
  # Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
  return 0 if i == 0 || c == 0
  # Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Tính giá trị lớn nhất giữa việc không cho vào và cho vật phẩm i vào
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Trả về giá trị lớn hơn trong hai lựa chọn
  [no, yes].max
end

### Bài toán cái túi 0-1: tìm kiếm ghi nhớ ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # Nếu đã chọn hết vật phẩm hoặc túi không còn dung lượng, trả về giá trị 0
  return 0 if i == 0 || c == 0
  # Nếu đã có bản ghi, trả về ngay
  return mem[i][c] if mem[i][c] != -1
  # Nếu vượt quá dung lượng túi, chỉ có thể chọn không cho vào
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Tính giá trị lớn nhất giữa việc không cho vào và cho vật phẩm i vào
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Ghi lại và trả về giá trị lớn hơn trong hai lựa chọn
  mem[i][c] = [no, yes].max
end

### Bài toán cái túi 0-1: quy hoạch động ###
def knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Khởi tạo bảng dp
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # Chuyển trạng thái
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # Nếu vượt quá dung lượng túi, không chọn vật phẩm i
        dp[i][c] = dp[i - 1][c]
      else
        # Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Bài toán cái túi 0-1: quy hoạch động tối ưu không gian ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Khởi tạo bảng dp
  dp = Array.new(cap + 1, 0)
  # Chuyển trạng thái
  for i in 1...(n + 1)
    # Duyệt theo thứ tự ngược
    for c in cap.downto(1)
      if wgt[i - 1] > c
        # Nếu vượt quá dung lượng túi, không chọn vật phẩm i
        dp[c] = dp[c]
      else
        # Giá trị lớn hơn giữa việc không chọn và chọn vật phẩm i
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Mã chương trình chính ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Tìm kiếm vét cạn
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Tìm kiếm ghi nhớ
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Quy hoạch động
  res = knapsack_dp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Quy hoạch động tối ưu không gian
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"
end
