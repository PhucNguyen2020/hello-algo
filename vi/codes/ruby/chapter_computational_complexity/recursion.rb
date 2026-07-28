=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Đệ quy ###
def recur(n)
  # Điều kiện dừng
  return 1 if n == 1
  # Đệ quy: gọi đệ quy
  res = recur(n - 1)
  # Trả về: trả về kết quả
  n + res
end

### Dùng lặp để mô phỏng đệ quy ###
def for_loop_recur(n)
  # Dùng một ngăn xếp tường minh để mô phỏng ngăn xếp lời gọi hệ thống
  stack = []
  res = 0

  # Đệ quy: gọi đệ quy
  for i in n.downto(0)
    # Mô phỏng "đệ quy" bằng cách "đẩy vào ngăn xếp"
    stack << i
  end
  # Trả về: trả về kết quả
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### Đệ quy đuôi ###
def tail_recur(n, res)
  # Điều kiện dừng
  return res if n == 0
  # Gọi đệ quy đuôi
  tail_recur(n - 1, res + n)
end

### Dãy Fibonacci: đệ quy ###
def fib(n)
  # Điều kiện dừng f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # Gọi đệ quy f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # Trả về kết quả f(n)
  res
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\nRecursion sum result res = #{res}"

  res = for_loop_recur(n)
  puts "\nUsing iteration to simulate recursion sum result res = #{res}"

  res = tail_recur(n, 0)
  puts "\nTail recursion sum result res = #{res}"

  res = fib(n)
  puts "\nThe #{n}th Fibonacci number is #{res}"
end
