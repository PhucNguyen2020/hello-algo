/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Hàng đợi dựa trên cách triển khai mảng vòng (circular array) */
class ArrayQueue {
    private var nums: [Int] // Mảng dùng để lưu trữ các phần tử của hàng đợi
    private var front: Int // Con trỏ đầu, trỏ đến phần tử ở đầu hàng đợi
    private var _size: Int // Độ dài hàng đợi

    init(capacity: Int) {
        // Khởi tạo mảng
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Lấy dung lượng của hàng đợi */
    func capacity() -> Int {
        nums.count
    }

    /* Lấy độ dài của hàng đợi */
    func size() -> Int {
        _size
    }

    /* Kiểm tra hàng đợi có rỗng không */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Thêm phần tử vào hàng đợi */
    func push(num: Int) {
        if size() == capacity() {
            print("Queue is full")
            return
        }
        // Dùng phép chia lấy dư để đưa rear vòng về đầu mảng sau khi vượt quá cuối mảng
        // Thêm num vào cuối hàng đợi
        let rear = (front + size()) % capacity()
        // Con trỏ đầu di chuyển lùi một vị trí
        nums[rear] = num
        _size += 1
    }

    /* Xóa phần tử khỏi hàng đợi */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Di chuyển con trỏ đầu lùi một vị trí, nếu vượt quá cuối mảng thì quay về đầu mảng
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Trả về danh sách để in ra */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return nums[front]
    }

    /* Trả về mảng */
    func toArray() -> [Int] {
        // Thêm phần tử vào hàng đợi
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đầu hàng đợi */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Thêm phần tử vào hàng đợi */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Queue queue = \(queue.toArray())")

        /* Trả về danh sách để in ra */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Xóa phần tử khỏi hàng đợi */
        let pop = queue.pop()
        print("Dequeue element pop = \(pop), after dequeue queue = \(queue.toArray())")

        /* Lấy độ dài của hàng đợi */
        let size = queue.size()
        print("Queue length size = \(size)")

        /* Kiểm tra hàng đợi có rỗng không */
        let isEmpty = queue.isEmpty()
        print("Is queue empty = \(isEmpty)")

        /* Kiểm thử mảng vòng */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("After round \(i) enqueue + dequeue, queue = \(queue.toArray())")
        }
    }
}
