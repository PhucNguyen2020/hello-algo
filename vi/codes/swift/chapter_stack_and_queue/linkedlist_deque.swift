/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Nút của danh sách liên kết đôi */
class ListNode {
    var val: Int // Giá trị của nút
    var next: ListNode? // Tham chiếu đến nút kế tiếp
    weak var prev: ListNode? // Tham chiếu đến nút trước đó

    init(val: Int) {
        self.val = val
    }
}

/* Hàng đợi hai đầu dựa trên cách triển khai danh sách liên kết đôi */
class LinkedListDeque {
    private var front: ListNode? // Nút đầu front
    private var rear: ListNode? // Nút cuối rear
    private var _size: Int // Độ dài của hàng đợi hai đầu

    init() {
        _size = 0
    }

    /* Lấy độ dài của hàng đợi hai đầu */
    func size() -> Int {
        _size
    }

    /* Kiểm tra hàng đợi hai đầu có rỗng không */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Thao tác thêm phần tử vào hàng đợi */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // Nếu danh sách liên kết rỗng, cho cả front và rear cùng trỏ đến node
        if isEmpty() {
            front = node
            rear = node
        }
        // Thao tác thêm phần tử vào đầu hàng đợi
        else if isFront {
            // Thêm node vào đầu danh sách liên kết
            front?.prev = node
            node.next = front
            front = node // Cập nhật nút đầu
        }
        // Thao tác thêm phần tử vào cuối hàng đợi
        else {
            // Thêm node vào cuối danh sách liên kết
            rear?.next = node
            node.prev = rear
            rear = node // Cập nhật nút cuối
        }
        _size += 1 // Cập nhật độ dài hàng đợi
    }

    /* Thêm phần tử vào đầu hàng đợi */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Thêm phần tử vào cuối hàng đợi */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Thao tác xóa phần tử khỏi hàng đợi */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        let val: Int
        // Lưu tạm giá trị của nút đầu
        if isFront {
            val = front!.val // Xóa nút đầu
            // Xóa nút đầu
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // Cập nhật nút đầu
        }
        // Lưu tạm giá trị của nút cuối
        else {
            val = rear!.val // Xóa nút cuối
            // Cập nhật nút cuối
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // Cập nhật nút cuối
        }
        _size -= 1 // Cập nhật độ dài hàng đợi
        return val
    }

    /* Xóa phần tử ở đầu hàng đợi */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Xóa phần tử ở cuối hàng đợi */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Trả về danh sách để in ra */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return front!.val
    }

    /* Mã điều khiển */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return rear!.val
    }

    /* Trả về mảng để in ra */
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
enum _LinkedListDeque {
    /* Mã điều khiển */
    static func main() {
        /* Lấy độ dài của hàng đợi hai đầu */
        let deque = LinkedListDeque()
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
