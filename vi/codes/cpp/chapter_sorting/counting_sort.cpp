/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sắp xếp đếm */
// Triển khai đơn giản, không thể dùng để sắp xếp đối tượng
void countingSortNaive(vector<int> &nums) {
    // 1. Đếm phần tử lớn nhất m trong mảng
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Đếm số lần xuất hiện của mỗi số
    // counter[num] biểu thị số lần xuất hiện của num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Duyệt counter, điền lại từng phần tử vào mảng gốc nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Sắp xếp đếm */
// Triển khai đầy đủ, có thể sắp xếp đối tượng và là giải thuật sắp xếp ổn định
void countingSort(vector<int> &nums) {
    // 1. Đếm phần tử lớn nhất m trong mảng
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Đếm số lần xuất hiện của mỗi số
    // counter[num] biểu thị số lần xuất hiện của num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Tính tổng tiền tố của counter, chuyển "số lần xuất hiện" thành "chỉ số cuối cùng"
    // counter[num]-1 là chỉ số cuối cùng mà num xuất hiện trong res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Duyệt nums theo thứ tự ngược, đặt từng phần tử vào mảng kết quả res
    // Khởi tạo mảng res để ghi lại kết quả
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Đặt num vào chỉ số tương ứng
        counter[num]--;              // Giảm tổng tiền tố đi 1, được chỉ số tiếp theo để đặt num
    }
    // Dùng mảng kết quả res để ghi đè lên mảng gốc nums
    nums = res;
}

/* Mã chạy chương trình */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "After counting sort (cannot sort objects) completes, nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "After counting sort completes, nums1 = ";
    printVector(nums1);

    return 0;
}
