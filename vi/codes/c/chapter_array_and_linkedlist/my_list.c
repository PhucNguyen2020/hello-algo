/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Lớp danh sách */
typedef struct {
    int *arr;        // Mảng (lưu trữ các phần tử của danh sách)
    int capacity;    // Dung lượng danh sách
    int size;        // Kích thước danh sách
    int extendRatio; // Hệ số mở rộng danh sách
} MyList;

void extendCapacity(MyList *nums);

/* Hàm khởi tạo */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* Hàm hủy */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* Lấy độ dài danh sách */
int size(MyList *nums) {
    return nums->size;
}

/* Lấy dung lượng danh sách */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* Cập nhật phần tử */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* Thêm phần tử vào cuối danh sách */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* Duyệt trực tiếp các phần tử của danh sách */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Mở rộng dung lượng
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Sắp xếp danh sách */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Mở rộng dung lượng
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Xóa phần tử */
// Lưu ý: stdio.h đã chiếm từ khóa remove
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Đoạn mã điều khiển chính */
void extendCapacity(MyList *nums) {
    // Cấp phát không gian mới trước
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Sao chép dữ liệu cũ sang dữ liệu mới
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Giải phóng dữ liệu cũ
    free(temp);

    // Cập nhật dữ liệu mới
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Chuyển danh sách thành mảng để in ra */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Đoạn mã điều khiển chính */
int main() {
    /* Khởi tạo danh sách */
    MyList *nums = newMyList();
    /* Duyệt trực tiếp các phần tử của danh sách */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("List nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, Length = %d\n", capacity(nums), size(nums));

    /* Sắp xếp danh sách */
    insert(nums, 3, 6);
    printf("Insert number 6 at index 3, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Xóa phần tử */
    removeItem(nums, 3);
    printf("Remove element at index 3, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Cập nhật phần tử */
    int num = get(nums, 1);
    printf("Access element at index 1, get num = %d\n", num);

    /* Thêm phần tử vào cuối danh sách */
    set(nums, 1, 0);
    printf("Update element at index 1 to 0, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Kiểm tra cơ chế mở rộng dung lượng */
    for (int i = 0; i < 10; i++) {
        // Khi i = 5, độ dài danh sách sẽ vượt quá dung lượng danh sách, kích hoạt cơ chế mở rộng
        add(nums, i);
    }

    printf("List nums after expansion = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, Length = %d\n", capacity(nums), size(nums));

    /* Giải phóng bộ nhớ đã cấp phát */
    delMyList(nums);

    return 0;
}
