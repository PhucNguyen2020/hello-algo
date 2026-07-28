/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sắp xếp theo giỏ (bucket sort) */
func bucketSort(nums: inout [Double]) {
    // Khởi tạo k = n/2 giỏ, dự kiến phân bổ 2 phần tử cho mỗi giỏ
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Phân phối các phần tử của mảng vào các giỏ khác nhau
    for num in nums {
        // Phạm vi dữ liệu đầu vào là [0, 1), dùng num * k để ánh xạ tới phạm vi chỉ số [0, k-1]
        let i = Int(num * Double(k))
        // Thêm num vào giỏ i
        buckets[i].append(num)
    }
    // 2. Sắp xếp từng giỏ
    for i in buckets.indices {
        // Dùng hàm sắp xếp có sẵn, cũng có thể thay bằng các giải thuật sắp xếp khác
        buckets[i].sort()
    }
    // 3. Duyệt qua các giỏ để hợp nhất kết quả
    var i = nums.startIndex
    for bucket in buckets {
        for num in bucket {
            nums[i] = num
            i += 1
        }
    }
}

@main
enum BucketSort {
    /* Mã điều khiển */
    static func main() {
        // Giả sử dữ liệu đầu vào là số thực dấu phẩy động, khoảng [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("Sau khi sắp xếp theo giỏ, nums = \(nums)")
    }
}
