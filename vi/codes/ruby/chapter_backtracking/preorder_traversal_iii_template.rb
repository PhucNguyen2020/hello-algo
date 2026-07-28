=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Kiểm tra xem trạng thái hiện tại có phải lời giải hay không ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### Ghi lại lời giải ###
def record_solution(state, res)
  res << state.dup
end

### Kiểm tra xem lựa chọn có hợp lệ ở trạng thái hiện tại hay không ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### Cập nhật trạng thái ###
def make_choice(state, choice)
  state << choice
end

### Khôi phục trạng thái ###
def undo_choice(state, choice)
  state.pop
end

### Quay lui: ví dụ 3 ###
def backtrack(state, choices, res)
  # Kiểm tra xem đây có phải lời giải hay không
  record_solution(state, res) if is_solution?(state)

  # Duyệt qua tất cả các lựa chọn
  for choice in choices
    # Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
    if is_valid?(state, choice)
      # Thử: thực hiện lựa chọn, cập nhật trạng thái
      make_choice(state, choice)
      # Tiến hành vòng lựa chọn tiếp theo
      backtrack(state, [choice.left, choice.right], res)
      # Quay lui: hoàn tác lựa chọn, khôi phục trạng thái trước đó
      undo_choice(state, choice)
    end
  end
end

### Mã chương trình chính ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nInitialize binary tree"
  print_tree(root)

  # Thuật toán quay lui
  res = []
  backtrack([], [root], res)

  puts "\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3"
  for path in res
    p path.map { |node| node.val }
  end
end
