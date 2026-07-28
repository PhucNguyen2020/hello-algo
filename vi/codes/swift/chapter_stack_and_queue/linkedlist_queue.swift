/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hàng đợi dựa trên cách triển khai danh sách liên kết */
class LinkedListQueue {
    private var front: ListNode? // Nút đầu
    private var rear: ListNode? // Nút cuối
    private var _size: Int

    init() {
        _size = 0
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
        // Thêm num vào sau nút cuối
        let node = ListNode(x: num)
        // Nếu hàng đợi rỗng, cho cả front và rear cùng trỏ đến node
        if front == nil {
            front = node
            rear = node
        }
        // Nếu hàng đợi không rỗng, thêm node vào sau nút cuối
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* Xóa phần tử khỏi hàng đợi */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Xóa nút đầu
        front = front?.next
        _size -= 1
        return num
    }

    /* Trả về danh sách để in ra */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return front!.val
    }

    /* Chuyển danh sách liên kết thành Array và trả về */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListQueue {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đầu hàng đợi */
        let queue = LinkedListQueue()

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
    }
}
