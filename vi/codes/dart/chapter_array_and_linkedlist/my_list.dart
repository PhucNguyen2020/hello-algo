/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Lớp danh sách (list) */
class MyList {
  late List<int> _arr; // Mảng (lưu trữ các phần tử của danh sách)
  int _capacity = 10; // Dung lượng của danh sách
  int _size = 0; // Độ dài danh sách (số phần tử hiện tại)
  int _extendRatio = 2; // Hệ số nhân dùng để mở rộng dung lượng danh sách mỗi lần

  /* Hàm khởi tạo */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Lấy độ dài danh sách (số phần tử hiện tại) */
  int size() => _size;

  /* Lấy dung lượng của danh sách */
  int capacity() => _capacity;

  /* Cập nhật phần tử */
  int get(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    return _arr[index];
  }

  /* Thêm phần tử vào cuối danh sách */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    _arr[index] = _num;
  }

  /* Duyệt trực tiếp các phần tử của danh sách */
  void add(int _num) {
    // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Cập nhật số phần tử
    _size++;
  }

  /* Sắp xếp danh sách */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('Index out of bounds');
    // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
    if (_size == _capacity) extendCapacity();
    // Dịch chuyển tất cả phần tử sau chỉ số index tiến lên một vị trí
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Cập nhật số phần tử
    _size++;
  }

  /* Xóa phần tử */
  int remove(int index) {
    if (index >= _size) throw RangeError('Index out of bounds');
    int _num = _arr[index];
    // Dịch chuyển tất cả phần tử sau chỉ số index lùi lại một vị trí
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Cập nhật số phần tử
    _size--;
    // Trả về phần tử đã bị xóa
    return _num;
  }

  /* Chương trình chính */
  void extendCapacity() {
    // Tạo một mảng mới có độ dài gấp _extendRatio lần mảng gốc
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Sao chép mảng gốc sang mảng mới
    List.copyRange(_newNums, 0, _arr);
    // Cập nhật tham chiếu _arr
    _arr = _newNums;
    // Thêm phần tử vào cuối danh sách
    _capacity = _arr.length;
  }

  /* Chuyển danh sách thành mảng */
  List<int> toArray() {
    List<int> arr = [];
    for (var i = 0; i < _size; i++) {
      arr.add(get(i));
    }
    return arr;
  }
}

/* Chương trình chính */
void main() {
  /* Khởi tạo danh sách */
  MyList nums = MyList();
  /* Thêm phần tử vào cuối danh sách */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');

  /* Sắp xếp danh sách */
  nums.insert(3, 6);
  print('Insert number 6 at index 3, get nums = ${nums.toArray()}');

  /* Xóa phần tử */
  nums.remove(3);
  print('Delete element at index 3, get nums = ${nums.toArray()}');

  /* Cập nhật phần tử */
  int _num = nums.get(1);
  print('Access element at index 1, get _num = $_num');

  /* Thêm phần tử vào cuối danh sách */
  nums.set(1, 0);
  print('Update element at index 1 to 0, get nums = ${nums.toArray()}');

  /* Kiểm tra cơ chế mở rộng dung lượng */
  for (var i = 0; i < 10; i++) {
    // Tại i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
    nums.add(i);
  }
  print(
      'After expansion, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}');
}
