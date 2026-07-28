/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đỉnh ngăn xếp */
        // Swift không có lớp ngăn xếp tích hợp sẵn, có thể dùng Array làm ngăn xếp
        var stack: [Int] = []

        /* Đẩy các phần tử vào ngăn xếp */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Stack stack = \(stack)")

        /* Trả về danh sách để in ra */
        let peek = stack.last!
        print("Top element peek = \(peek)")

        /* Lấy phần tử ra khỏi ngăn xếp */
        let pop = stack.removeLast()
        print("Pop element pop = \(pop), after pop stack = \(stack)")

        /* Lấy độ dài của ngăn xếp */
        let size = stack.count
        print("Stack length size = \(size)")

        /* Kiểm tra rỗng */
        let isEmpty = stack.isEmpty
        print("Is stack empty = \(isEmpty)")
    }
}
