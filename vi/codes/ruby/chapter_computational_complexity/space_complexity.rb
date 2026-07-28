=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Hàm ###
def function
  # Thực hiện một số thao tác
  0
end

### Thời gian hằng số ###
def constant(n)
  # Hằng số, biến, đối tượng chiếm không gian O(1)
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # Biến trong vòng lặp chiếm không gian O(1)
  (0...n).each { c = 0 }
  # Hàm trong vòng lặp chiếm không gian O(1)
  (0...n).each { function }
end

### Không gian tuyến tính ###
def linear(n)
  # Danh sách có độ dài n chiếm không gian O(n)
  nums = Array.new(n, 0)

  # Bảng băm có độ dài n chiếm không gian O(n)
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### Không gian tuyến tính (đệ quy) ###
def linear_recur(n)
  puts "Recursion n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### Không gian bậc hai ###
def quadratic(n)
  # Danh sách 2 chiều chiếm không gian O(n^2)
  Array.new(n) { Array.new(n, 0) }
end

### Không gian bậc hai (đệ quy) ###
def quadratic_recur(n)
  return 0 unless n > 0

  # Mảng nums có độ dài n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### Không gian hàm mũ (xây dựng cây nhị phân đầy đủ) ###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### Mã chương trình chính ###
if __FILE__ == $0
  n = 5

  # Bậc hằng số
  constant(n)

  # Bậc tuyến tính
  linear(n)
  linear_recur(n)

  # Bậc hàm mũ
  quadratic(n)
  quadratic_recur(n)

  # Bậc hàm mũ
  root = build_tree(n)
  print_tree(root)
end
