/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0 (thủ thuật 1)
        a += n;  // +0 (thủ thuật 1)
        // +n (thủ thuật 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (thủ thuật 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // Độ phức tạp thời gian của giải thuật A: hằng số
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // Độ phức tạp thời gian của giải thuật B: tuyến tính
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // Độ phức tạp thời gian của giải thuật C: hằng số
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* Độ phức tạp thời gian hằng số */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Độ phức tạp thời gian tuyến tính */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Độ phức tạp thời gian tuyến tính (duyệt mảng) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Số lần lặp tỉ lệ thuận với độ dài mảng
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian bậc hai */
    int Quadratic(int n) {
        int count = 0;
        // Số lần lặp có quan hệ bậc hai với kích thước dữ liệu n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Độ phức tạp thời gian bậc hai (sắp xếp nổi bọt) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Bộ đếm
        // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Vòng lặp trong: đưa phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối phạm vi đó
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Hoán đổi nums[j] và nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Hoán đổi phần tử gồm 3 thao tác đơn vị
                }
            }
        }
        return count;
    }

    /* Độ phức tạp thời gian theo cấp số mũ (triển khai vòng lặp) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Mỗi vòng các ô nhân đôi, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Độ phức tạp thời gian theo cấp số mũ (triển khai đệ quy) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* Độ phức tạp thời gian logarit (triển khai vòng lặp) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian logarit (triển khai đệ quy) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* Độ phức tạp thời gian tuyến tính-logarit */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian giai thừa (triển khai đệ quy) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Chia từ 1 thành n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // Có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
        int n = 8;
        Console.WriteLine("Input data size n = " + n);

        int count = Constant(n);
        Console.WriteLine("Constant order operation count = " + count);

        count = Linear(n);
        Console.WriteLine("Linear order operation count = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("Linear order (array traversal) operation count = " + count);

        count = Quadratic(n);
        Console.WriteLine("Quadratic order operation count = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("Quadratic order (bubble sort) operation count = " + count);

        count = Exponential(n);
        Console.WriteLine("Exponential order (loop implementation) operation count = " + count);
        count = ExpRecur(n);
        Console.WriteLine("Exponential order (recursive implementation) operation count = " + count);

        count = Logarithmic(n);
        Console.WriteLine("Logarithmic order (loop implementation) operation count = " + count);
        count = LogRecur(n);
        Console.WriteLine("Logarithmic order (recursive implementation) operation count = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("Linearithmic order (recursive implementation) operation count = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("Factorial order (recursive implementation) operation count = " + count);
    }
}
