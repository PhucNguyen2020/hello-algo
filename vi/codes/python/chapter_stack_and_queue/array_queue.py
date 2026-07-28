"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Hàng đợi dựa trên cách triển khai mảng vòng"""

    def __init__(self, size: int):
        """Hàm khởi tạo"""
        self._nums: list[int] = [0] * size  # Mảng dùng để lưu trữ các phần tử của hàng đợi
        self._front: int = 0  # Con trỏ đầu, trỏ đến phần tử ở đầu hàng đợi
        self._size: int = 0  # Độ dài hàng đợi

    def capacity(self) -> int:
        """Lấy dung lượng của hàng đợi"""
        return len(self._nums)

    def size(self) -> int:
        """Lấy độ dài của hàng đợi"""
        return self._size

    def is_empty(self) -> bool:
        """Kiểm tra hàng đợi có rỗng hay không"""
        return self._size == 0

    def push(self, num: int):
        """Thêm phần tử vào hàng đợi"""
        if self._size == self.capacity():
            raise IndexError("Queue is full")
        # Tính con trỏ rear, trỏ đến chỉ số cuối + 1
        # Sử dụng phép chia lấy dư để đưa rear quay về đầu mảng sau khi vượt qua cuối mảng
        rear: int = (self._front + self._size) % self.capacity()
        # Thêm num vào cuối hàng đợi
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Xóa phần tử khỏi hàng đợi"""
        num: int = self.peek()
        # Con trỏ đầu dịch chuyển về sau một vị trí, nếu vượt qua cuối mảng thì quay về đầu mảng
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Truy cập phần tử ở đầu hàng đợi"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """Trả về danh sách để in"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Code minh họa"""
if __name__ == "__main__":
    # Khởi tạo hàng đợi
    queue = ArrayQueue(10)

    # Thêm các phần tử vào hàng đợi
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("queue =", queue.to_list())

    # Truy cập phần tử ở đầu hàng đợi
    peek: int = queue.peek()
    print("Front of the queue element peek =", peek)

    # Xóa phần tử khỏi hàng đợi
    pop: int = queue.pop()
    print("Dequeued element pop =", pop)
    print("After dequeue queue =", queue.to_list())

    # Lấy độ dài của hàng đợi
    size: int = queue.size()
    print("Length of the queue size =", size)

    # Kiểm tra hàng đợi có rỗng hay không
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)

    # Kiểm thử mảng vòng
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("Round", i, "enqueue + dequeue after queue = ", queue.to_list())
