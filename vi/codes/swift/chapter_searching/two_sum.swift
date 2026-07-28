/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Phương pháp 1: Duyệt vét cạn */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // Hai vòng lặp lồng nhau, độ phức tạp thời gian là O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* Phương pháp 2: Bảng băm hỗ trợ */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // Bảng băm hỗ trợ, độ phức tạp không gian là O(n)
    var dic: [Int: Int] = [:]
    // Một vòng lặp duy nhất, độ phức tạp thời gian là O(n)
    for i in nums.indices {
        if let j = dic[target - nums[i]] {
            return [j, i]
        }
        dic[nums[i]] = i
    }
    return [0]
}

@main
enum LeetcodeTwoSum {
    /* Mã điều khiển */
    static func main() {
        // ======= Trường hợp thử nghiệm =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== Mã điều khiển ======
        // Phương pháp 1
        var res = twoSumBruteForce(nums: nums, target: target)
        print("Kết quả phương pháp 1 res = \(res)")
        // Phương pháp 2
        res = twoSumHashTable(nums: nums, target: target)
        print("Kết quả phương pháp 2 res = \(res)")
    }
}
