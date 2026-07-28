/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Lấy chữ số thứ k của phần tử num, với exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Truyền exp thay vì k giúp tránh phải lũy thừa lặp lại tốn kém ở đây
    (num / exp) % 10
}

/* Sắp xếp đếm (dựa trên chữ số thứ k của nums) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Phạm vi chữ số thập phân là 0~9, do đó cần một mảng giỏ có độ dài 10
    var counter = Array(repeating: 0, count: 10)
    // Đếm số lần xuất hiện của các chữ số 0~9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Lấy chữ số thứ k của nums[i], ký hiệu là d
        counter[d] += 1 // Đếm số lần xuất hiện của chữ số d
    }
    // Tính tổng tiền tố, chuyển "số lần xuất hiện" thành "chỉ số trong mảng"
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Duyệt ngược, dựa trên thống kê giỏ, đặt từng phần tử vào res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Lấy chỉ số j cho d trong mảng
        res[j] = nums[i] // Đặt phần tử hiện tại vào chỉ số j
        counter[d] -= 1 // Giảm số đếm của d đi 1
    }
    // Dùng res để ghi đè lên mảng gốc nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Sắp xếp theo cơ số (radix sort) */
func radixSort(nums: inout [Int]) {
    // Lấy phần tử lớn nhất của mảng, dùng để xác định số chữ số tối đa
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Duyệt từ chữ số thấp nhất đến chữ số cao nhất
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Thực hiện sắp xếp đếm trên chữ số thứ k của các phần tử mảng
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // tức exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Mã điều khiển */
    static func main() {
        // Sắp xếp theo cơ số
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("Sau khi sắp xếp theo cơ số, nums = \(nums)")
    }
}
