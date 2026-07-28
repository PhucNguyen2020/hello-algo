=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quay lui: hoán vị II ###
def backtrack(state, choices, selected, res)
  # Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
  if state.length == choices.length
    res << state.dup
    return
  end

  # Duyệt qua tất cả các lựa chọn
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử bằng nhau
    if !selected[i] && !duplicated.include?(choice)
      # Thử: thực hiện lựa chọn, cập nhật trạng thái
      duplicated.add(choice)
      selected[i] = true
      state << choice
      # Tiến hành vòng lựa chọn tiếp theo
      backtrack(state, choices, selected, res)
      # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
      selected[i] = false
      state.pop
    end
  end
end

### Hoán vị II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Mã chương trình chính ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "Input array nums = #{nums}"
  puts "All permutations res = #{res}"
end
