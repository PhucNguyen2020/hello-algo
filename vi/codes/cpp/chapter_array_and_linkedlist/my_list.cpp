/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Lớp danh sách (List) tự cài đặt */
class MyList {
  private:
    int *arr;             // Mảng (lưu trữ các phần tử của danh sách)
    int arrCapacity = 10; // Dung lượng của danh sách
    int arrSize = 0;      // Độ dài danh sách (số phần tử hiện tại)
    int extendRatio = 2;   // Hệ số mở rộng dung lượng danh sách mỗi lần

  public:
    /* Hàm khởi tạo */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Hàm hủy */
    ~MyList() {
        delete[] arr;
    }

    /* Lấy độ dài danh sách (số phần tử hiện tại) */
    int size() {
        return arrSize;
    }

    /* Lấy dung lượng danh sách */
    int capacity() {
        return arrCapacity;
    }

    /* Truy cập phần tử */
    int get(int index) {
        // Nếu chỉ số vượt quá phạm vi, ném ra ngoại lệ như bên dưới
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        return arr[index];
    }

    /* Cập nhật phần tử */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        arr[index] = num;
    }

    /* Thêm phần tử vào cuối danh sách */
    void add(int num) {
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Cập nhật số phần tử
        arrSize++;
    }

    /* Chèn phần tử vào giữa danh sách */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // Khi số phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
        if (size() == capacity())
            extendCapacity();
        // Dịch tất cả các phần tử sau vị trí index tiến lên một vị trí
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Cập nhật số phần tử
        arrSize++;
    }

    /* Xóa phần tử */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        int num = arr[index];
        // Dịch tất cả các phần tử sau vị trí index lùi lại một vị trí
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Cập nhật số phần tử
        arrSize--;
        // Trả về phần tử đã bị xóa
        return num;
    }

    /* Mở rộng dung lượng danh sách */
    void extendCapacity() {
        // Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // Sao chép tất cả các phần tử từ mảng gốc sang mảng mới
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // Giải phóng bộ nhớ
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* Chuyển danh sách thành Vector để in */
    vector<int> toVector() {
        // Chỉ lấy các phần tử hợp lệ
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Mã chạy chính (Driver Code) */
int main() {
    /* Khởi tạo danh sách */
    MyList *nums = new MyList();
    /* Thêm phần tử vào cuối danh sách */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    /* Chèn phần tử vào giữa danh sách */
    nums->insert(3, 6);
    cout << "Insert number 6 at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Xóa phần tử */
    nums->remove(3);
    cout << "Remove element at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Truy cập phần tử */
    int num = nums->get(1);
    cout << "Access element at index 1, get num = " << num << endl;

    /* Cập nhật phần tử */
    nums->set(1, 0);
    cout << "Update element at index 1 to 0, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Kiểm tra cơ chế mở rộng dung lượng */
    for (int i = 0; i < 10; i++) {
        // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng, kích hoạt cơ chế mở rộng
        nums->add(i);
    }
    cout << "List nums after expansion = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    // Giải phóng bộ nhớ
    delete nums;

    return 0;
}
