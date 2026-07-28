/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Tạo một mảng gồm các phần tử { 1, 2, ..., n } với thứ tự xáo trộn */
func randomNumbers(n: Int) -> [Int] {
    // Tạo mảng nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // Xáo trộn ngẫu nhiên các phần tử của mảng
    nums.shuffle()
    return nums
}

/* Tìm chỉ số của số 1 trong mảng nums */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // Khi phần tử 1 nằm ở đầu mảng, đạt độ phức tạp thời gian tốt nhất O(1)
        // Khi phần tử 1 nằm ở cuối mảng, đạt độ phức tạp thời gian tệ nhất O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Mã điều khiển */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("Array [ 1, 2, ..., n ] after shuffling = \(nums)")
            print("Index of number 1 is \(index)")
        }
    }
}
