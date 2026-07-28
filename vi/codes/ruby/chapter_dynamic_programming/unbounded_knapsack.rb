=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Bài toán cái túi không giới hạn: quy hoạch động ###
def unbounded_knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Bài toán cái túi không giới hạn: quy hoạch động tối ưu không gian ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Khởi tạo bảng dp
  dp = Array.new(cap + 1, 0)
  # Chuyển trạng thái
  for i in 1...(n + 1)
    # Duyệt theo thứ tự thuận
    for c in 1...(cap + 1)
      if wgt[i -1] > c
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
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # Quy hoạch động
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Quy hoạch động tối ưu không gian
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"
end
