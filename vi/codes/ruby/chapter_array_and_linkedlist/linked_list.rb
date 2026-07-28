=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### Chèn nút _p sau nút n0 trong danh sách liên kết ###
# `p` trong Ruby là hàm có sẵn, `P` là hằng số, nên dùng `_p` thay thế
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### Xóa nút đầu tiên sau nút n0 trong danh sách liên kết ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### Truy cập nút tại vị trí index trong danh sách liên kết ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### Tìm nút đầu tiên có giá trị target trong danh sách liên kết ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  # Khởi tạo danh sách liên kết
  # Khởi tạo từng nút
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # Xây dựng các liên kết giữa các nút
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "Initialized linked list is"
  print_linked_list(n0)

  # Chèn nút
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # Xóa nút
  remove(n0)
  puts "Linked list after removing node is"
  print_linked_list(n0)

  # Truy cập nút
  node = access(n0, 3)
  puts "Value of node at index 3 in linked list = #{node.val}"

  # Tìm kiếm nút
  index = find(n0, 2)
  puts "Index of node with value 2 in linked list = #{index}"
end
</content>
</invoke>
