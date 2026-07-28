/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Mã điều khiển */
    static func main() {
        /* Lấy độ dài của hàng đợi hai đầu */
        // Swift không có lớp hàng đợi hai đầu tích hợp sẵn, có thể dùng Array làm hàng đợi hai đầu
        var deque: [Int] = []

        /* Thêm phần tử vào hàng đợi */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Deque deque = \(deque)")

        /* Cập nhật phần tử */
        let peekFirst = deque.first!
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Rear element peekLast = \(peekLast)")

        /* Xóa phần tử khỏi hàng đợi */
        // Khi mô phỏng bằng Array, độ phức tạp của popFirst là O(n)
        let popFirst = deque.removeFirst()
        print("Dequeue front element popFirst = \(popFirst), after front dequeue deque = \(deque)")
        let popLast = deque.removeLast()
        print("Dequeue rear element popLast = \(popLast), after rear dequeue deque = \(deque)")

        /* Lấy độ dài của hàng đợi hai đầu */
        let size = deque.count
        print("Deque length size = \(size)")

        /* Kiểm tra hàng đợi hai đầu có rỗng không */
        let isEmpty = deque.isEmpty
        print("Is deque empty = \(isEmpty)")
    }
}
