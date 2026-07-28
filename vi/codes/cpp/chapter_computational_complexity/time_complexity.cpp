/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Độ phức tạp thời gian hằng số */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* Độ phức tạp thời gian tuyến tính */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* Độ phức tạp thời gian tuyến tính (duyệt mảng) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // Số lần lặp tỉ lệ thuận với độ dài mảng
    for (int num : nums) {
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian bậc hai */
int quadratic(int n) {
    int count = 0;
    // Số lần lặp liên quan bậc hai đến kích thước dữ liệu n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Độ phức tạp thời gian bậc hai (sắp xếp nổi bọt) */
int bubbleSort(vector<int> &nums) {
    int count = 0; // Bộ đếm
    // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về vị trí cuối cùng bên phải của phạm vi đó
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Hoán đổi nums[j] và nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Một lần hoán đổi phần tử gồm 3 thao tác đơn vị
            }
        }
    }
    return count;
}

/* Độ phức tạp thời gian theo cấp số mũ (cài đặt vòng lặp) */
int exponential(int n) {
    int count = 0, base = 1;
    // Số ô chia đôi qua mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Độ phức tạp thời gian theo cấp số mũ (cài đặt đệ quy) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Độ phức tạp thời gian logarit (cài đặt vòng lặp) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian logarit (cài đặt đệ quy) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Độ phức tạp thời gian tuyến tính-logarit */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp thời gian giai thừa (cài đặt đệ quy) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    // Chia thành n nhánh từ 1
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main() {
    // Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
    int n = 8;
    cout << "Input data size n = " << n << endl;

    int count = constant(n);
    cout << "Constant order operation count = " << count << endl;

    count = linear(n);
    cout << "Linear order operation count = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Linear order (array traversal) operation count = " << count << endl;

    count = quadratic(n);
    cout << "Quadratic order operation count = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Quadratic order (bubble sort) operation count = " << count << endl;

    count = exponential(n);
    cout << "Exponential order (loop implementation) operation count = " << count << endl;
    count = expRecur(n);
    cout << "Exponential order (recursive implementation) operation count = " << count << endl;

    count = logarithmic(n);
    cout << "Logarithmic order (loop implementation) operation count = " << count << endl;
    count = logRecur(n);
    cout << "Logarithmic order (recursive implementation) operation count = " << count << endl;

    count = linearLogRecur(n);
    cout << "Linearithmic order (recursive implementation) operation count = " << count << endl;

    count = factorialRecur(n);
    cout << "Factorial order (recursive implementation) operation count = " << count << endl;

    return 0;
}
