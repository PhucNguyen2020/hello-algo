=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Thời gian hằng số ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### Thời gian tuyến tính ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### Thời gian tuyến tính (duyệt mảng) ###
def array_traversal(nums)
  count = 0

  # Số lần lặp tỷ lệ thuận với độ dài mảng
  for num in nums
    count += 1
  end

  count
end

### Thời gian bậc hai ###
def quadratic(n)
  count = 0

  # Số lần lặp có quan hệ bậc hai với kích thước dữ liệu n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### Thời gian bậc hai (sắp xếp nổi bọt) ###
def bubble_sort(nums)
  count = 0  # Bộ đếm

  # Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
  for i in (nums.length - 1).downto(0)
    # Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối cùng bên phải của phạm vi đó
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Hoán đổi nums[j] và nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # Hoán đổi phần tử gồm 3 thao tác đơn vị
      end
    end
  end

  count
end

### Thời gian hàm mũ (lặp) ###
def exponential(n)
  count, base = 0, 1

  # Số ô chia đôi mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### Thời gian hàm mũ (đệ quy) ###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### Thời gian logarit (lặp) ###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### Thời gian logarit (đệ quy) ###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### Thời gian tuyến tính-logarit ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### Thời gian giai thừa (đệ quy) ###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # Chia thành n nhánh từ 1 đến n
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Mã chương trình chính ###
if __FILE__ == $0
  # Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
  n = 8
  puts "Input data size n = #{n}"

  count = constant(n)
  puts "Constant-time operations count = #{count}"

  count = linear(n)
  puts "Linear-time operations count = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Linear-time (array traversal) operations count = #{count}"

  count = quadratic(n)
  puts "Quadratic-time operations count = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Quadratic-time (bubble sort) operations count = #{count}"

  count = exponential(n)
  puts "Exponential-time (iterative) operations count = #{count}"
  count = exp_recur(n)
  puts "Exponential-time (recursive) operations count = #{count}"

  count = logarithmic(n)
  puts "Logarithmic-time (iterative) operations count = #{count}"
  count = log_recur(n)
  puts "Logarithmic-time (recursive) operations count = #{count}"

  count = linear_log_recur(n)
  puts "Linearithmic-time (recursive) operations count = #{count}"

  count = factorial_recur(n)
  puts "Factorial-time (recursive) operations count = #{count}"
end
