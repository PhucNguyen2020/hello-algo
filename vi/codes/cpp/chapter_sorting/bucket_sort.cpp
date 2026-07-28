/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sắp xếp theo giỏ */
void bucketSort(vector<float> &nums) {
    // Khởi tạo k = n/2 giỏ, dự kiến mỗi giỏ chứa 2 phần tử
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Phân phối các phần tử của mảng vào các giỏ khác nhau
    for (float num : nums) {
        // Phạm vi dữ liệu đầu vào là [0, 1), dùng num * k để ánh xạ sang phạm vi chỉ số [0, k-1]
        int i = num * k;
        // Thêm num vào giỏ bucket_idx
        buckets[i].push_back(num);
    }
    // 2. Sắp xếp từng giỏ
    for (vector<float> &bucket : buckets) {
        // Dùng hàm sắp xếp có sẵn, cũng có thể thay bằng giải thuật sắp xếp khác
        sort(bucket.begin(), bucket.end());
    }
    // 3. Duyệt các giỏ để gộp kết quả
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Mã chạy chương trình */
int main() {
    // Giả sử dữ liệu đầu vào là số thực dấu phẩy động, khoảng [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "After bucket sort completes, nums = ";
    printVector(nums);

    return 0;
}
