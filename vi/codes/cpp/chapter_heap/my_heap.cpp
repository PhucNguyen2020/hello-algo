/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Max heap */
class MaxHeap {
  private:
    // Dùng mảng động để tránh vấn đề mở rộng
    vector<int> maxHeap;

    /* Lấy chỉ số của nút con trái */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Lấy chỉ số của nút con phải */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Lấy chỉ số của nút cha */
    int parent(int i) {
        return (i - 1) / 2; // Phép chia lấy phần nguyên
    }

    /* Bắt đầu từ nút i, heap hóa từ dưới lên trên */
    void siftUp(int i) {
        while (true) {
            // Lấy nút cha của nút i
            int p = parent(i);
            // Khi "vượt qua nút gốc" hoặc "nút không cần sửa chữa", kết thúc heap hóa
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Hoán đổi hai nút
            swap(maxHeap[i], maxHeap[p]);
            // Vòng lặp heap hóa lên trên
            i = p;
        }
    }

    /* Bắt đầu từ nút i, heap hóa từ trên xuống dưới */
    void siftDown(int i) {
        while (true) {
            // Nếu nút i là lớn nhất hoặc chỉ số l, r vượt quá giới hạn, không cần tiếp tục heap hóa, thoát vòng lặp
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Hoán đổi hai nút
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Vòng lặp heap hóa xuống dưới
            i = ma;
        }
    }

  public:
    /* Hàm khởi tạo, xây dựng heap dựa trên danh sách đầu vào */
    MaxHeap(vector<int> nums) {
        // Thêm nguyên trạng các phần tử của danh sách vào heap
        maxHeap = nums;
        // Heap hóa tất cả các nút trừ nút lá
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Lấy kích thước heap */
    int size() {
        return maxHeap.size();
    }

    /* Kiểm tra heap có rỗng hay không */
    bool isEmpty() {
        return size() == 0;
    }

    /* Truy cập phần tử đỉnh */
    int peek() {
        return maxHeap[0];
    }

    /* Phần tử vào heap */
    void push(int val) {
        // Thêm nút
        maxHeap.push_back(val);
        // Heap hóa từ dưới lên trên
        siftUp(size() - 1);
    }

    /* Phần tử ra khỏi heap */
    void pop() {
        // Xử lý trường hợp rỗng
        if (isEmpty()) {
            throw out_of_range("Heap is empty");
        }
        // Xóa nút
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Xóa nút
        maxHeap.pop_back();
        // Trả về phần tử đỉnh
        siftDown(0);
    }

    /* Mã chạy chương trình*/
    void print() {
        cout << "Heap array representation:";
        printVector(maxHeap);
        cout << "Heap tree representation:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Mã chạy chương trình */
int main() {
    /* Có thể lấy giá trị đối của các phần tử trước khi đưa vào heap, nhờ đó đảo ngược quan hệ lớn nhỏ, từ đó triển khai max heap */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nAfter inputting list and building heap" << endl;
    maxHeap.print();

    /* Kiểm tra heap có rỗng hay không */
    int peek = maxHeap.peek();
    cout << "\nHeap top element is " << peek << endl;

    /* Phần tử vào heap */
    int val = 7;
    maxHeap.push(val);
    cout << "\nAfter element " << val << " pushes to heap" << endl;
    maxHeap.print();

    /* Độ phức tạp thời gian là O(n), không phải O(nlogn) */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nAfter heap top element " << peek << " pops from heap" << endl;
    maxHeap.print();

    /* Lấy kích thước heap */
    int size = maxHeap.size();
    cout << "\nHeap size is " << size << endl;

    /* Kiểm tra heap có rỗng hay không */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nIs heap empty " << isEmpty << endl;

    return 0;
}
