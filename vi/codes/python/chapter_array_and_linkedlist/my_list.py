"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """Lớp List"""

    def __init__(self):
        """Hàm khởi tạo"""
        self._capacity: int = 10  # Dung lượng của list
        self._arr: list[int] = [0] * self._capacity  # Mảng (lưu trữ các phần tử của list)
        self._size: int = 0  # Độ dài của list (số lượng phần tử hiện có)
        self._extend_ratio: int = 2  # Hệ số mở rộng dung lượng của list mỗi lần

    def size(self) -> int:
        """Lấy độ dài của list (số lượng phần tử hiện có)"""
        return self._size

    def capacity(self) -> int:
        """Lấy dung lượng của list"""
        return self._capacity

    def get(self, index: int) -> int:
        """Truy cập phần tử"""
        # Nếu chỉ số vượt quá phạm vi thì ném ngoại lệ như bên dưới
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Cập nhật phần tử"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        self._arr[index] = num

    def add(self, num: int):
        """Thêm phần tử vào cuối"""
        # Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Chèn phần tử vào giữa"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        # Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if self._size == self.capacity():
            self.extend_capacity()
        # Dịch chuyển tất cả các phần tử từ vị trí index trở về sau lùi lại một vị trí
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Cập nhật số lượng phần tử
        self._size += 1

    def remove(self, index: int) -> int:
        """Xóa phần tử"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        num = self._arr[index]
        # Dịch chuyển tất cả các phần tử sau vị trí index tiến lên một vị trí
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Cập nhật số lượng phần tử
        self._size -= 1
        # Trả về phần tử đã bị xóa
        return num

    def extend_capacity(self):
        """Mở rộng dung lượng của list"""
        # Tạo một mảng mới có độ dài gấp _extend_ratio lần mảng gốc, rồi sao chép mảng gốc sang mảng mới
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Cập nhật dung lượng của list
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Trả về list với độ dài hợp lệ"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # Khởi tạo list
    nums = MyList()
    # Thêm phần tử vào cuối
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"List nums = {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")

    # Chèn phần tử vào giữa
    nums.insert(6, index=3)
    print("Insert number 6 at index 3, get nums =", nums.to_array())

    # Xóa phần tử
    nums.remove(3)
    print("Remove the element at index 3, get nums =", nums.to_array())

    # Truy cập phần tử
    num = nums.get(1)
    print("Access the element at index 1, get num =", num)

    # Cập nhật phần tử
    nums.set(0, 1)
    print("Update the element at index 1 to 0, get nums =", nums.to_array())

    # Kiểm tra cơ chế mở rộng
    for i in range(10):
        # Tại i = 5, độ dài của list sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng tại đây
        nums.add(i)
    print(f"List after extension {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")
