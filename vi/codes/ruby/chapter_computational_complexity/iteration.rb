=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### Vòng lặp for ###
def for_loop(n)
  res = 0

  # Tính tổng 1, 2, ..., n-1, n
  for i in 1..n
    res += i
  end

  res
end

### Vòng lặp while ###
def while_loop(n)
  res = 0
  i = 1 # Khởi tạo biến điều kiện

  # Tính tổng 1, 2, ..., n-1, n
  while i <= n
    res += i
    i += 1 # Cập nhật biến điều kiện
  end

  res
end

### Vòng lặp while (hai lần cập nhật) ###
def while_loop_ii(n)
  res = 0
  i = 1 # Khởi tạo biến điều kiện

  # Tính tổng 1, 4, 10, ...
  while i <= n
    res += i
    # Cập nhật biến điều kiện
    i += 1
    i *= 2
  end

  res
end

### Vòng lặp for lồng nhau ###
def nested_for_loop(n)
  res = ""

  # Lặp i = 1, 2, ..., n-1, n
  for i in 1..n
    # Lặp j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nFor loop sum result res = #{res}"

  res = while_loop(n)
  puts "\nWhile loop sum result res = #{res}"

  res = while_loop_ii(n)
  puts "\nWhile loop (two updates) sum result res = #{res}"

  res = nested_for_loop(n)
  puts "\nNested for loop traversal result #{res}"
end
