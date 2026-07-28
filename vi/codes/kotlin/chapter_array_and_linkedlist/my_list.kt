/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Lớp danh sách (list) */
class MyList {
    private var arr: IntArray = intArrayOf() // Mảng (lưu trữ các phần tử của danh sách)
    private var capacity: Int = 10 // Dung lượng danh sách
    private var size: Int = 0 // Độ dài danh sách (số lượng phần tử hiện tại)
    private var extendRatio: Int = 2 // Bội số mở rộng dung lượng danh sách mỗi lần

    /* Hàm khởi tạo */
    init {
        arr = IntArray(capacity)
    }

    /* Lấy độ dài danh sách (số lượng phần tử hiện tại) */
    fun size(): Int {
        return size
    }

    /* Lấy dung lượng danh sách */
    fun capacity(): Int {
        return capacity
    }

    /* Truy cập phần tử */
    fun get(index: Int): Int {
        // Nếu chỉ số vượt quá giới hạn thì ném ra ngoại lệ, như bên dưới
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        return arr[index]
    }

    /* Cập nhật phần tử */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        arr[index] = num
    }

    /* Thêm phần tử vào cuối danh sách */
    fun add(num: Int) {
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // Cập nhật số lượng phần tử
        size++
    }

    /* Chèn phần tử vào giữa danh sách */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size == capacity())
            extendCapacity()
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // Cập nhật số lượng phần tử
        size++
    }

    /* Xóa phần tử */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("Index out of bounds")
        val num = arr[index]
        // Dịch chuyển tất cả phần tử sau vị trí index lùi lại một vị trí
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // Cập nhật số lượng phần tử
        size--
        // Trả về phần tử đã bị xóa
        return num
    }

    /* Mở rộng dung lượng danh sách */
    fun extendCapacity() {
        // Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc, rồi sao chép mảng gốc sang mảng mới
        arr = arr.copyOf(capacity() * extendRatio)
        // Cập nhật dung lượng
        capacity = arr.size
    }

    /* Chuyển danh sách thành mảng */
    fun toArray(): IntArray {
        val size = size()
        // Chỉ chuyển đổi phạm vi hợp lệ trong độ dài size
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Chương trình điều khiển (Driver Code) */
fun main() {
    /* Khởi tạo danh sách (list) */
    val nums = MyList()
    /* Thêm phần tử vào cuối danh sách */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("List nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length = ${nums.size()}")

    /* Chèn phần tử vào giữa danh sách */
    nums.insert(3, 6)
    println("Insert number 6 at index 3, get nums = ${nums.toArray().contentToString()}")

    /* Xóa phần tử */
    nums.remove(3)
    println("Delete element at index 3, get nums = ${nums.toArray().contentToString()}")

    /* Truy cập phần tử */
    val num = nums.get(1)
    println("Access element at index 1, get num = $num")

    /* Cập nhật phần tử */
    nums.set(1, 0)
    println("Update element at index 1 to 0, get nums = ${nums.toArray().contentToString()}")

    /* Kiểm tra cơ chế mở rộng dung lượng */
    for (i in 0..9) {
        // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
        nums.add(i)
    }
    println("After expansion, list nums = ${nums.toArray().contentToString()}, capacity = ${nums.capacity()}, length =  ${nums.size()}")
}