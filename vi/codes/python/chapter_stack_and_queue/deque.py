"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Code minh họa"""
if __name__ == "__main__":
    # Khởi tạo hàng đợi hai đầu
    deq: deque[int] = deque()

    # Thêm các phần tử vào hàng đợi
    deq.append(2)  # Thêm vào cuối hàng đợi
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Thêm vào đầu hàng đợi
    deq.appendleft(1)
    print("double-ended queue deque =", deq)

    # Truy cập các phần tử
    front: int = deq[0]  # Phần tử ở đầu hàng đợi
    print("Front of the queue element front =", front)
    rear: int = deq[-1]  # Phần tử ở cuối hàng đợi
    print("Rear of the queue element rear =", rear)

    # Xóa các phần tử khỏi hàng đợi
    pop_front: int = deq.popleft()  # Xóa phần tử ở đầu hàng đợi
    print("Front dequeued element  pop_front =", pop_front)
    print("After front dequeue deque =", deq)
    pop_rear: int = deq.pop()  # Xóa phần tử ở cuối hàng đợi
    print("Rear dequeued element  pop_rear =", pop_rear)
    print("After rear dequeue deque =", deq)

    # Lấy độ dài của hàng đợi hai đầu
    size: int = len(deq)
    print("Length of the double-ended queue size =", size)

    # Kiểm tra hàng đợi hai đầu có rỗng hay không
    is_empty: bool = len(deq) == 0
    print("Is the double-ended queue empty =", is_empty)
