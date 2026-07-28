/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if total == target {
        res.append(state)
        return
    }
    // Duyệt tất cả các lựa chọn
    for i in choices.indices {
        // Cắt tỉa: nếu tổng của tập con vượt quá target, bỏ qua lựa chọn này
        if total + choices[i] > target {
            continue
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
        state.append(choices[i])
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.removeLast()
    }
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Trạng thái (tập con)
    let total = 0 // Tổng của tập con
    var res: [[Int]] = [] // Danh sách kết quả (danh sách các tập con)
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Mã điều khiển */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum equal to \(target) res = \(res)")
        print("Please note that this method outputs results containing duplicate sets")
    }
}
