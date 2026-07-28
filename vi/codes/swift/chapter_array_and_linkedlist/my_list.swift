/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Lớp danh sách */
class MyList {
    private var arr: [Int] // Mảng (lưu trữ các phần tử của danh sách)
    private var _capacity: Int // Dung lượng danh sách
    private var _size: Int // Độ dài danh sách (số phần tử hiện tại)
    private let extendRatio: Int // Bội số mở rộng dung lượng danh sách mỗi lần

    /* Hàm khởi tạo */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    func size() -> Int {
        _size
    }

    /* Lấy dung lượng danh sách */
    func capacity() -> Int {
        _capacity
    }

    /* Cập nhật phần tử */
    func get(index: Int) -> Int {
        // Ném lỗi nếu chỉ số vượt giới hạn, các trường hợp bên dưới tương tự
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        return arr[index]
    }

    /* Thêm phần tử vào cuối danh sách */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        arr[index] = num
    }

    /* Duyệt trực tiếp các phần tử của danh sách */
    func add(num: Int) {
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // Cập nhật số lượng phần tử
        _size += 1
    }

    /* Sắp xếp danh sách */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if size() == capacity() {
            extendCapacity()
        }
        // Dịch chuyển tất cả phần tử sau chỉ số index lên trước một vị trí
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // Cập nhật số lượng phần tử
        _size += 1
    }

    /* Xóa phần tử */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("Index out of bounds")
        }
        let num = arr[index]
        // Dịch chuyển tất cả phần tử sau index lùi lên một vị trí
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // Cập nhật số lượng phần tử
        _size -= 1
        // Trả về phần tử đã bị xóa
        return num
    }

    /* Mã điều khiển */
    func extendCapacity() {
        // Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc và sao chép mảng gốc sang mảng mới
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // Thêm phần tử vào cuối danh sách
        _capacity = arr.count
    }

    /* Chuyển danh sách thành mảng */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Mã điều khiển */
    static func main() {
        /* Khởi tạo danh sách */
        let nums = MyList()
        /* Duyệt trực tiếp các phần tử của danh sách */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("List nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")

        /* Sắp xếp danh sách */
        nums.insert(index: 3, num: 6)
        print("Insert number 6 at index 3, get nums = \(nums.toArray())")

        /* Xóa phần tử */
        nums.remove(index: 3)
        print("Delete element at index 3, get nums = \(nums.toArray())")

        /* Cập nhật phần tử */
        let num = nums.get(index: 1)
        print("Access element at index 1, get num = \(num)")

        /* Thêm phần tử vào cuối danh sách */
        nums.set(index: 1, num: 0)
        print("Update element at index 1 to 0, get nums = \(nums.toArray())")

        /* Kiểm tra cơ chế mở rộng dung lượng */
        for i in 0 ..< 10 {
            // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
            nums.add(num: i)
        }
        print("After expansion, list nums = \(nums.toArray()), capacity = \(nums.capacity()), length = \(nums.size())")
    }
}
