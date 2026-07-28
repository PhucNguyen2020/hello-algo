=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Xây dựng cây nhị phân: chia để trị ###
def dfs(preorder, inorder_map, i, l, r)
  # Kết thúc khi khoảng của cây con rỗng
  return if r - l < 0

  # Khởi tạo nút gốc
  root = TreeNode.new(preorder[i])
  # Truy vấn m để chia cây con trái và phải
  m = inorder_map[preorder[i]]
  # Bài toán con: xây dựng cây con trái
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # Bài toán con: xây dựng cây con phải
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # Trả về nút gốc
  root
end

### Xây dựng cây nhị phân ###
def build_tree(preorder, inorder)
  # Khởi tạo bảng băm, lưu ánh xạ từ phần tử duyệt giữa đến chỉ số
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Mã chương trình chính ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "Pre-order traversal = #{preorder}"
  puts "In-order traversal = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "The constructed binary tree is:"
  print_tree(root)
end
