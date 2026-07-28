=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Quay lui ###
def backtrack(choices, state, n, res)
  # Khi leo đến bậc thang thứ n, cộng 1 vào số lượng lời giải
  res[0] += 1 if state == n
  # Duyệt tất cả các lựa chọn
  for choice in choices
    # Cắt tỉa: không được phép vượt quá bậc thang thứ n
    next if state + choice > n

    # Thử: thực hiện lựa chọn, cập nhật trạng thái
    backtrack(choices, state + choice, n, res)
  end
  # Quay lui
end

### Leo cầu thang: quay lui ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Có thể chọn leo 1 hoặc 2 bậc thang
  state = 0 # Bắt đầu leo từ bậc thang thứ 0
  res = [0] # Dùng res[0] để ghi lại số lượng lời giải
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
