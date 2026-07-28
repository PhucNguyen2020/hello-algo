=begin
File: n_queens.rb
Created Time: 2024-05-21
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: bài toán n quân hậu ###
def backtrack(row, n, state, res, cols, diags1, diags2)
  # Khi đã đặt xong tất cả các hàng, ghi lại lời giải
  if row == n
    res << state.map { |row| row.dup }
    return
  end

  # Duyệt qua tất cả các cột
  for col in 0...n
    # Tính đường chéo chính và đường chéo phụ tương ứng với ô này
    diag1 = row - col + n - 1
    diag2 = row + col
    # Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
    if !cols[col] && !diags1[diag1] && !diags2[diag2]
      # Thử: đặt quân hậu vào ô này
      state[row][col] = "Q"
      cols[col] = diags1[diag1] = diags2[diag2] = true
      # Đặt quân hậu ở hàng tiếp theo
      backtrack(row + 1, n, state, res, cols, diags1, diags2)
      # Quay lui: khôi phục ô này thành ô trống
      state[row][col] = "#"
      cols[col] = diags1[diag1] = diags2[diag2] = false
    end
  end
end

### Giải bài toán n quân hậu ###
def n_queens(n)
  # Khởi tạo bàn cờ n*n, trong đó 'Q' là quân hậu và '#' là ô trống
  state = Array.new(n) { Array.new(n, "#") }
  cols = Array.new(n, false) # Ghi lại xem cột đó có quân hậu hay không
  diags1 = Array.new(2 * n - 1, false) # Ghi lại xem đường chéo chính đó có quân hậu hay không
  diags2 = Array.new(2 * n - 1, false) # Ghi lại xem đường chéo phụ đó có quân hậu hay không
  res = []
  backtrack(0, n, state, res, cols, diags1, diags2)

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 4
  res = n_queens(n)

  puts "Input board size is #{n}"
  puts "Total queen placement solutions: #{res.length}"

  for state in res
    puts "--------------------"
    for row in state
      p row
    end
  end
end
