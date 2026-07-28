=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Truy cập ngẫu nhiên phần tử ###
def random_access(nums)
  # Chọn ngẫu nhiên một số trong khoảng [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Lấy và trả về phần tử ngẫu nhiên
  nums[random_index]
end


### Mở rộng độ dài mảng ###
# Lưu ý: Array của Ruby là mảng động, có thể mở rộng trực tiếp
# Vì mục đích học tập, hàm này coi Array như mảng có độ dài cố định
def extend(nums, enlarge)
  # Khởi tạo mảng với độ dài đã mở rộng
  res = Array.new(nums.length + enlarge, 0)

  # Sao chép tất cả phần tử từ mảng gốc sang mảng mới
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Trả về mảng mới đã mở rộng
  res
end

### Chèn phần tử num vào vị trí index trong mảng ###
def insert(nums, num, index)
  # Dịch tất cả phần tử từ vị trí index trở về sau lùi lại một vị trí
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Gán num cho phần tử tại vị trí index
  nums[index] = num
end


### Xóa phần tử tại vị trí index ###
def remove(nums, index)
  # Dịch tất cả phần tử sau vị trí index tiến lên một vị trí
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### Duyệt mảng ###
def traverse(nums)
  count = 0

  # Duyệt mảng theo chỉ số
  for i in 0...nums.length
    count += nums[i]
  end

  # Duyệt trực tiếp các phần tử của mảng
  for num in nums
    count += num
  end
end

### Tìm phần tử chỉ định trong mảng ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # Khởi tạo mảng
  arr = Array.new(5, 0)
  puts "Array arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Array nums = #{nums}"

  # Chèn phần tử
  random_num = random_access(nums)
  puts "Get random element #{random_num} from nums"

  # Duyệt mảng
  nums = extend(nums, 3)
  puts "Extend array length to 8, get nums = #{nums}"

  # Chèn phần tử
  insert(nums, 6, 3)
  puts "Insert number 6 at index 3, get nums = #{nums}"

  # Xóa phần tử
  remove(nums, 2)
  puts "Delete element at index 2, get nums = #{nums}"

  # Duyệt mảng
  traverse(nums)

  # Tìm phần tử
  index = find(nums, 3)
  puts "Find element 3 in nums, index = #{index}"
end
</content>
</invoke>
