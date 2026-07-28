/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Ngăn xếp dựa trên cách triển khai danh sách liên kết */
class LinkedListStack {
    private var _peek: ListNode? // Dùng nút đầu làm đỉnh ngăn xếp
    private var _size: Int // Độ dài ngăn xếp

    init() {
        _size = 0
    }

    /* Lấy độ dài của ngăn xếp */
    func size() -> Int {
        _size
    }

    /* Kiểm tra ngăn xếp có rỗng không */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Đẩy vào ngăn xếp */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* Lấy ra khỏi ngăn xếp */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* Trả về danh sách để in ra */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return _peek!.val
    }

    /* Chuyển List thành Array và trả về */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: size())
        for i in res.indices.reversed() {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListStack {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đỉnh ngăn xếp */
        let stack = LinkedListStack()

        /* Đẩy các phần tử vào ngăn xếp */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Stack stack = \(stack.toArray())")

        /* Trả về danh sách để in ra */
        let peek = stack.peek()
        print("Top element peek = \(peek)")

        /* Lấy phần tử ra khỏi ngăn xếp */
        let pop = stack.pop()
        print("Pop element pop = \(pop), after pop stack = \(stack.toArray())")

        /* Lấy độ dài của ngăn xếp */
        let size = stack.size()
        print("Stack length size = \(size)")

        /* Kiểm tra rỗng */
        let isEmpty = stack.isEmpty()
        print("Is stack empty = \(isEmpty)")
    }
}
