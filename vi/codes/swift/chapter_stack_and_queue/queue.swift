/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Mã điều khiển */
    static func main() {
        /* Truy cập phần tử ở đầu hàng đợi */
        // Swift không có lớp hàng đợi tích hợp sẵn, có thể dùng Array làm hàng đợi
        var queue: [Int] = []

        /* Thêm phần tử vào hàng đợi */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Queue queue = \(queue)")

        /* Trả về danh sách để in ra */
        let peek = queue.first!
        print("Front element peek = \(peek)")

        /* Xóa phần tử khỏi hàng đợi */
        // Khi mô phỏng bằng Array, độ phức tạp của pop là O(n)
        let pool = queue.removeFirst()
        print("Dequeue element pop = \(pool), after dequeue queue = \(queue)")

        /* Lấy độ dài của hàng đợi */
        let size = queue.count
        print("Queue length size = \(size)")

        /* Kiểm tra hàng đợi có rỗng không */
        let isEmpty = queue.isEmpty
        print("Is queue empty = \(isEmpty)")
    }
}
