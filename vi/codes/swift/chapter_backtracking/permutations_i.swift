/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Giải thuật quay lui: Hoán vị I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Duyệt tất cả các lựa chọn
    for (i, choice) in choices.enumerated() {
        // Cắt tỉa: không cho phép chọn lại phần tử đã dùng
        if !selected[i] {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            selected[i] = true
            state.append(choice)
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            selected[i] = false
            state.removeLast()
        }
    }
}

/* Hoán vị I */
func permutationsI(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsI {
    /* Mã điều khiển */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsI(nums: nums)

        print("Input array nums = \(nums)")
        print("All permutations res = \(res)")
    }
}
