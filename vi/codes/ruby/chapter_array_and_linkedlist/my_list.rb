=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Lớp List ###
class MyList
  attr_reader :size       # Lấy độ dài list (số lượng phần tử hiện tại)
  attr_reader :capacity   # Lấy dung lượng list

  ### Hàm khởi tạo ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### Truy cập phần tử ###
  def get(index)
    # Nếu chỉ số vượt quá giới hạn, ném ra ngoại lệ, như bên dưới
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index]
  end

  ### Truy cập phần tử ###
  def set(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index] = num
  end

  ### Thêm phần tử vào cuối ###
  def add(num)
    # Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
    extend_capacity if size == capacity
    @arr[size] = num

    # Cập nhật số lượng phần tử
    @size += 1
  end

  ### Chèn phần tử vào giữa ###
  def insert(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size

    # Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
    extend_capacity if size == capacity

    # Dịch tất cả phần tử sau vị trí index tiến lên một vị trí
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Cập nhật số lượng phần tử
    @size += 1
  end

  ### Xóa phần tử ###
  def remove(index)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    num = @arr[index]

    # Dịch tất cả phần tử sau index tiến lên một vị trí
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Cập nhật số lượng phần tử
    @size -= 1

    # Trả về phần tử đã bị xóa
    num
  end

  ### Mở rộng dung lượng list ###
  def extend_capacity
    # Tạo mảng mới có độ dài gấp extend_ratio lần mảng gốc, sao chép mảng gốc sang mảng mới
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Thêm phần tử vào cuối
    @capacity = arr.length
  end

  ### Chuyển list thành mảng ###
  def to_array
    sz = size
    # Các phần tử vào hàng đợi
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # Khởi tạo list
  nums = MyList.new

  # Duyệt trực tiếp các phần tử của list
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "List nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"

  # Sắp xếp list
  nums.insert(3, 6)
  puts "Insert number 6 at index 3, get nums = #{nums.to_array}"

  # Xóa phần tử
  nums.remove(3)
  puts "Delete element at index 3, get nums = #{nums.to_array}"

  # Cập nhật phần tử
  num = nums.get(1)
  puts "Access element at index 1, get num = #{num}"

  # Thêm phần tử vào cuối
  nums.set(1, 0)
  puts "Update element at index 1 to 0, get nums = #{nums.to_array}"

  # Kiểm tra cơ chế mở rộng dung lượng
  for i in 0...10
    # Tại i = 5, độ dài list sẽ vượt quá dung lượng list, kích hoạt cơ chế mở rộng
    nums.add(i)
  end
  puts "After expansion, list nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"
end
</content>
</invoke>
