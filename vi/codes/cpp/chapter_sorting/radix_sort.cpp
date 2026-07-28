/**
 * File: radix_sort.cpp
 * Created Time: 2023-03-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Lấy chữ số thứ k của phần tử num, với exp = 10^(k-1) */
int digit(int num, int exp) {
    // Truyền exp thay vì k có thể tránh việc phải tính lũy thừa tốn kém lặp lại ở đây
    return (num / exp) % 10;
}

/* Sắp xếp đếm (dựa trên chữ số thứ k của nums) */
void countingSortDigit(vector<int> &nums, int exp) {
    // Phạm vi chữ số thập phân là 0~9, do đó cần mảng giỏ có độ dài 10
    vector<int> counter(10, 0);
    int n = nums.size();
    // Đếm số lần xuất hiện của các chữ số 0~9
    for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Lấy chữ số thứ k của nums[i], ký hiệu là d
        counter[d]++;                // Đếm số lần xuất hiện của chữ số d
    }
    // Tính tổng tiền tố, chuyển "số lần xuất hiện" thành "chỉ số mảng"
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Duyệt theo thứ tự ngược, dựa trên thống kê của giỏ, đặt từng phần tử vào res
    vector<int> res(n, 0);
    for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Lấy chỉ số j cho d trong mảng
        res[j] = nums[i];       // Đặt phần tử hiện tại vào chỉ số j
        counter[d]--;           // Giảm số đếm của d đi 1
    }
    // Dùng res để ghi đè lên mảng gốc nums
    for (int i = 0; i < n; i++)
        nums[i] = res[i];
}

/* Sắp xếp theo cơ số (radix sort) */
void radixSort(vector<int> &nums) {
    // Lấy phần tử lớn nhất của mảng, dùng để xác định số chữ số tối đa
    int m = *max_element(nums.begin(), nums.end());
    // Duyệt từ chữ số thấp nhất đến chữ số cao nhất
    for (int exp = 1; exp <= m; exp *= 10)
        // Thực hiện sắp xếp đếm trên chữ số thứ k của các phần tử mảng
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // tức là, exp = 10^(k-1)
        countingSortDigit(nums, exp);
}

/* Mã chạy chương trình */
int main() {
    // Sắp xếp theo cơ số
    vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                        88906420, 72429244, 30524779, 82060337, 63832996};
    radixSort(nums);
    cout << "After radix sort completes, nums = ";
    printVector(nums);

    return 0;
}
