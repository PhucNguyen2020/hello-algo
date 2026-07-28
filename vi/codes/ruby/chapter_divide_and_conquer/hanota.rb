=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Di chuyển một đĩa ###
def move(src, tar)
  # Lấy một đĩa ra từ đỉnh của src
  pan = src.pop
  # Đặt đĩa lên đỉnh của tar
  tar << pan
end

### Giải bài toán Tháp Hà Nội f(i) ###
def dfs(i, src, buf, tar)
  # Nếu src chỉ còn lại một đĩa, di chuyển trực tiếp nó sang tar
  if i == 1
    move(src, tar)
    return
  end

  # Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, dùng tar làm trung gian
  dfs(i - 1, src, tar, buf)
  # Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
  move(src, tar)
  # Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, dùng src làm trung gian
  dfs(i - 1, buf, src, tar)
end

### Giải bài toán Tháp Hà Nội ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # Di chuyển n đĩa trên cùng từ A sang C, dùng B làm trung gian
  dfs(n, _A, _B, _C)
end

### Mã chương trình chính ###
if __FILE__ == $0
  # Cuối danh sách là đỉnh của cột
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "In initial state:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "After disk movement is complete:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
