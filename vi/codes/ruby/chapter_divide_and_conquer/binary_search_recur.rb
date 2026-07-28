=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Tìm kiếm nhị phân: bài toán con f(i, j) ###
def dfs(nums, target, i, j)
  # Nếu khoảng rỗng, nghĩa là không có phần tử mục tiêu, trả về -1
  return -1 if i > j

  # Tính chỉ số điểm giữa m
  m = (i + j) / 2

  if nums[m] < target
    # Đệ quy bài toán con f(m+1, j)
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # Đệ quy bài toán con f(i, m-1)
    return dfs(nums, target, i, m - 1)
  else
    # Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
    return m
  end
end

### Tìm kiếm nhị phân ###
def binary_search(nums, target)
  n = nums.length
  # Giải bài toán f(0, n-1)
  dfs(nums, target, 0, n - 1)
end

### Mã chương trình chính ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Tìm kiếm nhị phân (khoảng đóng cả hai đầu)
  index = binary_search(nums, target)
  puts "Index of target element 6 is #{index}"
end
