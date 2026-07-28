/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Độ phức tạp bậc hằng số */
int constant(int n) {
    int count = 0;
    int size = 100000;
    int i = 0;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp bậc tuyến tính */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp bậc tuyến tính (duyệt mảng) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // Số lần lặp tỉ lệ thuận với độ dài mảng
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp bậc bình phương */
int quadratic(int n) {
    int count = 0;
    // Số lần lặp có quan hệ bậc hai với kích thước dữ liệu n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Độ phức tạp bậc bình phương (sắp xếp nổi bọt) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Bộ đếm
    // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối phạm vi đó
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

/* Độ phức tạp bậc mũ (cài đặt bằng vòng lặp) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // Số ô chia đôi sau mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Độ phức tạp bậc mũ (cài đặt bằng đệ quy) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Độ phức tạp bậc logarit (cài đặt bằng vòng lặp) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Độ phức tạp bậc logarit (cài đặt bằng đệ quy) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Độ phức tạp bậc tuyến tính-logarit */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Độ phức tạp bậc giai thừa (cài đặt bằng đệ quy) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Đoạn mã điều khiển chính */
int main(int argc, char *argv[]) {
    // Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
    int n = 8;
    printf("Input data size n = %d\n", n);

    int count = constant(n);
    printf("Constant-time operations count = %d\n", count);

    count = linear(n);
    printf("Linear-time operations count = %d\n", count);
    // Cấp phát bộ nhớ heap (tạo mảng một chiều có độ dài biến đổi: n phần tử kiểu int)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Linear-time (array traversal) operations count = %d\n", count);

    count = quadratic(n);
    printf("Quadratic-time operations count = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Quadratic-time (bubble sort) operations count = %d\n", count);

    count = exponential(n);
    printf("Exponential-time (iterative) operations count = %d\n", count);
    count = expRecur(n);
    printf("Exponential-time (recursive) operations count = %d\n", count);

    count = logarithmic(n);
    printf("Logarithmic-time (iterative) operations count = %d\n", count);
    count = logRecur(n);
    printf("Logarithmic-time (recursive) operations count = %d\n", count);

    count = linearLogRecur(n);
    printf("Linearithmic-time (recursive) operations count = %d\n", count);

    count = factorialRecur(n);
    printf("Factorial-time (recursive) operations count = %d\n", count);

    // Giải phóng bộ nhớ heap
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
