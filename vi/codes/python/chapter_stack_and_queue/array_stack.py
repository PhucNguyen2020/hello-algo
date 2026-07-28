"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """Ngăn xếp dựa trên cách triển khai mảng"""

    def __init__(self):
        """Hàm khởi tạo"""
        self._stack: list[int] = []

    def size(self) -> int:
        """Lấy độ dài của ngăn xếp"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Kiểm tra ngăn xếp có rỗng hay không"""
        return self.size() == 0

    def push(self, item: int):
        """Đẩy phần tử vào ngăn xếp"""
        self._stack.append(item)

    def pop(self) -> int:
        """Lấy phần tử ra khỏi ngăn xếp"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack.pop()

    def peek(self) -> int:
        """Truy cập phần tử ở đỉnh ngăn xếp"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Trả về danh sách để in"""
        return self._stack


"""Code minh họa"""
if __name__ == "__main__":
    # Khởi tạo ngăn xếp
    stack = ArrayStack()

    # Đẩy các phần tử vào ngăn xếp
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("stack =", stack.to_list())

    # Truy cập phần tử ở đỉnh ngăn xếp
    peek: int = stack.peek()
    print("Top of the stack element peek =", peek)

    # Lấy phần tử ra khỏi ngăn xếp
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("After pop stack =", stack.to_list())

    # Lấy độ dài của ngăn xếp
    size: int = stack.size()
    print("Length of the stack size =", size)

    # Kiểm tra ngăn xếp có rỗng hay không
    is_empty: bool = stack.is_empty()
    print("Is the stack empty =", is_empty)
