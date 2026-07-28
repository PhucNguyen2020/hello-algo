/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* Lớp danh sách */
class MyList {
    private int[] arr;           // Mảng (lưu trữ các phần tử của danh sách)
    private int arrCapacity = 10;    // Dung lượng danh sách
    private int arrSize = 0;         // Độ dài danh sách (số phần tử hiện tại)
    private readonly int extendRatio = 2;  // Hệ số nhân khi mở rộng dung lượng danh sách mỗi lần

    /* Hàm khởi tạo */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    public int Size() {
        return arrSize;
    }

    /* Lấy dung lượng danh sách */
    public int Capacity() {
        return arrCapacity;
    }

    /* Truy cập phần tử */
    public int Get(int index) {
        // Nếu chỉ số vượt quá giới hạn, ném ra ngoại lệ như bên dưới
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        return arr[index];
    }

    /* Cập nhật phần tử */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    public void Add(int num) {
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Cập nhật số lượng phần tử
        arrSize++;
    }

    /* Chèn phần tử vào giữa danh sách */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Dịch chuyển tất cả phần tử sau vị trí index tiến lên một vị trí
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Cập nhật số lượng phần tử
        arrSize++;
    }

    /* Xóa phần tử */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Index out of bounds");
        int num = arr[index];
        // Dịch chuyển tất cả phần tử sau vị trí index lùi lại một vị trí
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Cập nhật số lượng phần tử
        arrSize--;
        // Trả về phần tử đã xóa
        return num;
    }

    /* Mở rộng dung lượng danh sách */
    public void ExtendCapacity() {
        // Tạo mảng mới có độ dài arrCapacity * extendRatio và sao chép mảng gốc sang mảng mới
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Cập nhật dung lượng danh sách
        arrCapacity = arr.Length;
    }

    /* Chuyển danh sách thành mảng */
    public int[] ToArray() {
        // Chỉ chuyển đổi phần dữ liệu hợp lệ trong độ dài arrSize
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* Khởi tạo danh sách */
        MyList nums = new();
        /* Thêm phần tử vào cuối danh sách */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("List nums = " + string.Join(",", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());

        /* Chèn phần tử vào giữa danh sách */
        nums.Insert(3, 6);
        Console.WriteLine("Insert number 6 at index 3, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Xóa phần tử */
        nums.Remove(3);
        Console.WriteLine("Remove element at index 3, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Truy cập phần tử */
        int num = nums.Get(1);
        Console.WriteLine("Access element at index 1, get num = " + num);

        /* Cập nhật phần tử */
        nums.Set(1, 0);
        Console.WriteLine("Update element at index 1 to 0, resulting in nums = " + string.Join(",", nums.ToArray()));

        /* Kiểm tra cơ chế mở rộng dung lượng */
        for (int i = 0; i < 10; i++) {
            // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
            nums.Add(i);
        }
        Console.WriteLine("List nums after expansion = " + string.Join(",", nums.ToArray()) +
                           ", capacity = " + nums.Capacity() + ", length = " + nums.Size());
    }
}
