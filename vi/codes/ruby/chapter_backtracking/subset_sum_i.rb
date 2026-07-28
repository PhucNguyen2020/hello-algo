=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quay lui: tổng tập con I ###
def backtrack(state, target, choices, start, res)
  # Khi tổng của tập con bằng target, ghi lại lời giải
  if target.zero?
    res << state.dup
    return
  end
  # Duyệt qua tất cả các lựa chọn
  # Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
  for i in start...choices.length
    # Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay
    # Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
    break if target - choices[i] < 0
    # Thử: thực hiện lựa chọn, cập nhật target, start
    state << choices[i]
    # Tiến hành vòng lựa chọn tiếp theo
    backtrack(state, target - choices[i], choices, i, res)
    # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
    state.pop
  end
end

### Giải bài toán tổng tập con I ###
def subset_sum_i(nums, target)
  state = [] # Trạng thái (tập con)
  nums.sort! # Sắp xếp nums
  start = 0 # Điểm bắt đầu duyệt
  res = [] # Danh sách kết quả (danh sách các tập con)
  backtrack(state, target, nums, start, res)
  res
end

### Mã chương trình chính ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Input array = #{nums}, target = #{target}"
  puts "All subsets with sum equal to #{target} res = #{res}"
end
