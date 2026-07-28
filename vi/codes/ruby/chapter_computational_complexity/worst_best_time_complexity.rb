=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Sinh mảng gồm các phần tử: 1, 2, ..., n, đã được xáo trộn ###
def random_numbers(n)
  # Sinh mảng nums =: 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # Xáo trộn ngẫu nhiên các phần tử của mảng
  nums.shuffle!
end

### Tìm chỉ số của số 1 trong mảng nums ###
def find_one(nums)
  for i in 0...nums.length
    # Khi phần tử 1 ở đầu mảng, đạt độ phức tạp thời gian tốt nhất O(1)
    # Khi phần tử 1 ở cuối mảng, đạt độ phức tạp thời gian xấu nhất O(n)
    return i if nums[i] == 1
  end

  -1
end

### Mã chương trình chính ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\nArray [ 1, 2, ..., n ] after shuffling = #{nums}"
    puts "Index of number 1 is #{index}"
  end
end
