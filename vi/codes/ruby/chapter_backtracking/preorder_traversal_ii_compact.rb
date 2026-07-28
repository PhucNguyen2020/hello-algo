=begin
File: preorder_traversal_ii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Duyệt trước: ví dụ 2 ###
def pre_order(root)
  return unless root

  # Thử
  $path << root

  # Ghi lại lời giải
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # Quay lui
  $path.pop
end

### Mã chương trình chính ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nInitialize binary tree"
  print_tree(root)

  # Duyệt trước
  $path, $res = [], []
  pre_order(root)

  puts "\nOutput all paths from root node to node 7"
  for path in $res
    p path.map { |node| node.val }
  end
end
