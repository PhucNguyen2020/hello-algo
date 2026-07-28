/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Hàng đợi hai đầu dựa trên cách triển khai mảng vòng (circular array) */
class ArrayDeque {
    private var nums: [Int] // Mảng dùng để lưu trữ các phần tử của hàng đợi hai đầu
    private var front: Int // Con trỏ đầu, trỏ đến phần tử ở đầu hàng đợi
    private var _size: Int // Độ dài của hàng đợi hai đầu

    /* Hàm khởi tạo */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Lấy dung lượng của hàng đợi hai đầu */
    func capacity() -> Int {
        nums.count
    }

    /* Lấy độ dài của hàng đợi hai đầu */
    func size() -> Int {
        _size
    }

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Tính chỉ số trong mảng vòng */
    private func index(i: Int) -> Int {
        // Dùng phép chia lấy dư để nối liền đầu và cuối mảng
        // Khi i vượt quá cuối mảng, quay về đầu mảng
        // Khi i vượt quá đầu mảng, quay về cuối mảng
        (i + capacity()) % capacity()
    }

    /* Thêm phần tử vào đầu hàng đợi */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Dùng phép chia lấy dư để đưa front vòng về cuối mảng sau khi vượt quá đầu mảng
        // Thêm num vào đầu hàng đợi
        front = index(i: front - 1)
        // Thêm num vào đầu hàng đợi
        nums[front] = num
        _size += 1
    }

    /* Thêm phần tử vào cuối hàng đợi */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Dùng phép chia lấy dư để đưa rear vòng về đầu mảng sau khi vượt quá cuối mảng
        let rear = index(i: front + size())
        // Con trỏ đầu di chuyển lùi một vị trí
        nums[rear] = num
        _size += 1
    }

    /* Xóa phần tử ở đầu hàng đợi */
    func popFirst() -> Int {
        let num = peekFirst()
        // Di chuyển con trỏ đầu lùi một vị trí
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Truy cập phần tử ở cuối hàng đợi */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Trả về danh sách để in ra */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return nums[front]
    }

    /* Mã điều khiển */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        // Khởi tạo hàng đợi hai đầu
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Trả về mảng để in ra */
    func toArray() -> [Int] {
        // Thêm phần tử vào hàng đợi
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Mã điều khiển */
    static func main() {
        /* Lấy độ dài của hàng đợi hai đầu */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Deque deque = \(deque.toArray())")

        /* Cập nhật phần tử */
        let peekFirst = deque.peekFirst()
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Rear element peekLast = \(peekLast)")

        /* Thêm phần tử vào hàng đợi */
        deque.pushLast(num: 4)
        print("After element 4 enqueues at rear, deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("After element 1 enqueues at front, deque = \(deque.toArray())")

        /* Xóa phần tử khỏi hàng đợi */
        let popLast = deque.popLast()
        print("Dequeue rear element = \(popLast), after rear dequeue deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Dequeue front element = \(popFirst), after front dequeue deque = \(deque.toArray())")

        /* Lấy độ dài của hàng đợi hai đầu */
        let size = deque.size()
        print("Deque length size = \(size)")

        /* Kiểm tra hàng đợi hai đầu có rỗng không */
        let isEmpty = deque.isEmpty()
        print("Is deque empty = \(isEmpty)")
    }
}
