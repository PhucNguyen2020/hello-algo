/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Giải thuật quay lui: Hoán vị II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Duyệt tất cả các lựa chọn
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Cắt tỉa: không cho phép chọn lại phần tử đã dùng và không cho phép chọn lại các phần tử có giá trị trùng nhau
        if !selected[i], !duplicated.contains(choice) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated.insert(choice) // Ghi nhận giá trị phần tử đã được chọn
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

/* Hoán vị II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* Mã điều khiển */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("Input array nums = \(nums)")
        print("All permutations res = \(res)")
    }
}
