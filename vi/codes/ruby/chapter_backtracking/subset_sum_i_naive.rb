=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quay lui: tổng tập con I ###
def backtrack(state, target, total, choices, res)
  # Khi tổng của tập con bằng target, ghi lại lời giải
  if total == target
    res << state.dup
    return
  end

  # Duyệt qua tất cả các lựa chọn
  for i in 0...choices.length
    # Cắt tỉa: nếu tổng của tập con vượt quá target, bỏ qua lựa chọn này
    next if total + choices[i] > target
    # Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
    state << choices[i]
    # Tiến hành vòng lựa chọn tiếp theo
    backtrack(state, target, total + choices[i], choices, res)
    # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
    state.pop
  end
end

### Giải bài toán tổng tập con I (có tập con trùng lặp) ###
def subset_sum_i_naive(nums, target)
  state = [] # Trạng thái (tập con)
  total = 0 # Tổng của tập con
  res = [] # Danh sách kết quả (danh sách các tập con)
  backtrack(state, target, total, nums, res)
  res
end

### Mã chương trình chính ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "All subsets with sum equal to #{target} res = #{res}"
  puts "Please note that this method outputs results containing duplicate sets"
end
