/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Ngăn xếp dựa trên cách triển khai mảng */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Khởi tạo danh sách (mảng động)
        stack = []
    }

    /* Lấy độ dài của ngăn xếp */
    func size() -> Int {
        stack.count
    }

    /* Kiểm tra ngăn xếp có rỗng không */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* Đẩy vào ngăn xếp */
    func push(num: Int) {
        stack.append(num)
    }

    /* Lấy ra khỏi ngăn xếp */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.removeLast()
    }

    /* Trả về danh sách để in ra */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.last!
    }

    /* Chuyển List thành Array và trả về */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đỉnh ngăn xếp */
        let stack = ArrayStack()

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
