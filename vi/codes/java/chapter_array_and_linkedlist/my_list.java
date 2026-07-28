/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* Lớp danh sách (list) */
class MyList {
    private int[] arr; // Mảng (lưu trữ các phần tử của danh sách)
    private int capacity = 10; // Dung lượng của danh sách
    private int size = 0; // Độ dài danh sách (số phần tử hiện tại)
    private int extendRatio = 2; // Hệ số nhân dùng để mở rộng dung lượng danh sách mỗi lần

    /* Hàm khởi tạo */
    public MyList() {
        arr = new int[capacity];
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    public int size() {
        return size;
    }

    /* Lấy dung lượng của danh sách */
    public int capacity() {
        return capacity;
    }

    /* Truy cập phần tử */
    public int get(int index) {
        // Nếu chỉ số vượt quá phạm vi, ném ra ngoại lệ như bên dưới
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        return arr[index];
    }

    /* Cập nhật phần tử */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    public void add(int num) {
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Cập nhật số phần tử
        size++;
    }

    /* Chèn phần tử vào giữa danh sách */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size == capacity())
            extendCapacity();
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Cập nhật số phần tử
        size++;
    }

    /* Xóa phần tử */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Index out of bounds");
        int num = arr[index];
        // Dịch chuyển tất cả phần tử sau vị trí index lùi lại một vị trí
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Cập nhật số phần tử
        size--;
        // Trả về phần tử đã bị xóa
        return num;
    }

    /* Mở rộng dung lượng danh sách */
    public void extendCapacity() {
        // Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc rồi sao chép mảng gốc sang mảng mới
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Cập nhật dung lượng
        capacity = arr.length;
    }

    /* Chuyển danh sách thành mảng */
    public int[] toArray() {
        int size = size();
        // Chỉ chuyển đổi phạm vi hợp lệ trong độ dài size
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Chương trình chính */
    public static void main(String[] args) {
        /* Khởi tạo danh sách */
        MyList nums = new MyList();
        /* Thêm phần tử vào cuối danh sách */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("List nums = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());

        /* Chèn phần tử vào giữa danh sách */
        nums.insert(3, 6);
        System.out.println("Insert number 6 at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Xóa phần tử */
        nums.remove(3);
        System.out.println("Remove element at index 3, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Truy cập phần tử */
        int num = nums.get(1);
        System.out.println("Access element at index 1, get num = " + num);

        /* Cập nhật phần tử */
        nums.set(1, 0);
        System.out.println("Update element at index 1 to 0, resulting in nums = " + Arrays.toString(nums.toArray()));

        /* Kiểm tra cơ chế mở rộng dung lượng */
        for (int i = 0; i < 10; i++) {
            // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
            nums.add(i);
        }
        System.out.println("List nums after expansion = " + Arrays.toString(nums.toArray()) +
                ", capacity = " + nums.capacity() + ", length = " + nums.size());
    }
}
