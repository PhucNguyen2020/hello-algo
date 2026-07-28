"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Hàng đợi hai đầu dựa trên cách triển khai mảng vòng"""

    def __init__(self, capacity: int):
        """Hàm khởi tạo"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Lấy dung lượng của hàng đợi hai đầu"""
        return len(self._nums)

    def size(self) -> int:
        """Lấy độ dài của hàng đợi hai đầu"""
        return self._size

    def is_empty(self) -> bool:
        """Kiểm tra hàng đợi hai đầu có rỗng hay không"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Tính chỉ số mảng vòng"""
        # Sử dụng phép chia lấy dư để nối đầu và cuối mảng lại với nhau
        # Khi i vượt qua cuối mảng, quay trở lại đầu mảng
        # Khi i vượt qua đầu mảng, quay trở lại cuối mảng
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Thêm phần tử vào đầu hàng đợi"""
        if self._size == self.capacity():
            print("Double-ended queue is full")
            return
        # Con trỏ đầu dịch chuyển sang trái một vị trí
        # Sử dụng phép chia lấy dư để đưa front quay về cuối mảng sau khi vượt qua đầu mảng
        self._front = self.index(self._front - 1)
        # Thêm num vào đầu hàng đợi
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Thêm phần tử vào cuối hàng đợi"""
        if self._size == self.capacity():
            print("Double-ended queue is full")
            return
        # Tính con trỏ rear, trỏ đến chỉ số cuối + 1
        rear = self.index(self._front + self._size)
        # Thêm num vào cuối hàng đợi
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Xóa phần tử ở đầu hàng đợi"""
        num = self.peek_first()
        # Con trỏ đầu dịch chuyển về sau một vị trí
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Xóa phần tử ở cuối hàng đợi"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Truy cập phần tử ở đầu hàng đợi"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Truy cập phần tử ở cuối hàng đợi"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # Tính chỉ số phần tử cuối
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Trả về mảng để in"""
        # Chỉ chuyển đổi các phần tử nằm trong phạm vi độ dài hợp lệ
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Code minh họa"""
if __name__ == "__main__":
    # Khởi tạo hàng đợi hai đầu
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("double-ended queue deque =", deque.to_array())

    # Truy cập các phần tử
    peek_first: int = deque.peek_first()
    print("Front of the queue element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear of the queue element peek_last =", peek_last)

    # Thêm các phần tử vào hàng đợi
    deque.push_last(4)
    print("Element 4 rear enqueue after deque =", deque.to_array())
    deque.push_first(1)
    print("Element 1 front enqueue after deque =", deque.to_array())

    # Xóa các phần tử khỏi hàng đợi
    pop_last: int = deque.pop_last()
    print("Rear dequeued element =", pop_last, ", rear dequeue after deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Front dequeued element =", pop_first, ", front dequeue after deque =", deque.to_array())

    # Lấy độ dài của hàng đợi hai đầu
    size: int = deque.size()
    print("Length of the double-ended queue size =", size)

    # Kiểm tra hàng đợi hai đầu có rỗng hay không
    is_empty: bool = deque.is_empty()
    print("Is the double-ended queue empty =", is_empty)
