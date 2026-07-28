/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* Độ phức tạp thời gian hằng số */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Độ phức tạp thời gian tuyến tính */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Độ phức tạp thời gian tuyến tính (duyệt mảng) */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // Số lần lặp tỷ lệ thuận với độ dài mảng
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian bậc hai */
    static int quadratic(int n) {
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
    static int bubbleSort(int[] nums) {
        int count = 0; // Bộ đếm
        // Vòng lặp ngoài: phạm vi chưa sắp xếp là [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Vòng lặp trong: hoán đổi phần tử lớn nhất trong phạm vi chưa sắp xếp [0, i] về cuối bên phải của phạm vi đó
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Hoán đổi nums[j] và nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Hoán đổi phần tử gồm 3 thao tác đơn vị
                }
            }
        }
        return count;
    }

    /* Độ phức tạp thời gian theo cấp số mũ (triển khai vòng lặp) */
    static int exponential(int n) {
        int count = 0, base = 1;
        // Số ô nhân đôi sau mỗi vòng, tạo thành dãy 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Độ phức tạp thời gian theo cấp số mũ (triển khai đệ quy) */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* Độ phức tạp thời gian logarit (triển khai vòng lặp) */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian logarit (triển khai đệ quy) */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* Độ phức tạp thời gian tuyến tính-logarit */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Độ phức tạp thời gian giai thừa (triển khai đệ quy) */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Chia từ 1 đến n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* Mã điều khiển */
    public static void main(String[] args) {
        // Bạn có thể thay đổi n để chạy và quan sát xu hướng số lượng thao tác của các độ phức tạp khác nhau
        int n = 8;
        System.out.println("Kích thước dữ liệu đầu vào n = " + n);

        int count = constant(n);
        System.out.println("Số lượng thao tác của độ phức tạp hằng số = " + count);

        count = linear(n);
        System.out.println("Số lượng thao tác của độ phức tạp tuyến tính = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("Số lượng thao tác của độ phức tạp tuyến tính (duyệt mảng) = " + count);

        count = quadratic(n);
        System.out.println("Số lượng thao tác của độ phức tạp bậc hai = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("Số lượng thao tác của độ phức tạp bậc hai (sắp xếp nổi bọt) = " + count);

        count = exponential(n);
        System.out.println("Số lượng thao tác của độ phức tạp cấp số mũ (triển khai vòng lặp) = " + count);
        count = expRecur(n);
        System.out.println("Số lượng thao tác của độ phức tạp cấp số mũ (triển khai đệ quy) = " + count);

        count = logarithmic(n);
        System.out.println("Số lượng thao tác của độ phức tạp logarit (triển khai vòng lặp) = " + count);
        count = logRecur(n);
        System.out.println("Số lượng thao tác của độ phức tạp logarit (triển khai đệ quy) = " + count);

        count = linearLogRecur(n);
        System.out.println("Số lượng thao tác của độ phức tạp tuyến tính-logarit (triển khai đệ quy) = " + count);

        count = factorialRecur(n);
        System.out.println("Số lượng thao tác của độ phức tạp giai thừa (triển khai đệ quy) = " + count);
    }
}
