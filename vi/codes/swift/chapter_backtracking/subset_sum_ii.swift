/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Giải thuật quay lui: Tổng tập con II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Khi tổng của tập con bằng target, ghi lại lời giải
    if target == 0 {
        res.append(state)
        return
    }
    // Duyệt tất cả các lựa chọn
    // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    // Cắt tỉa 3: bắt đầu duyệt từ start để tránh chọn lại cùng một phần tử
    for i in choices.indices.dropFirst(start) {
        // Cắt tỉa 1: nếu tổng của tập con vượt quá target, kết thúc vòng lặp ngay lập tức
        // Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if target - choices[i] < 0 {
            break
        }
        // Cắt tỉa 4: nếu phần tử này bằng phần tử bên trái, tức là nhánh tìm kiếm này bị trùng lặp, bỏ qua ngay
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.append(choices[i])
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.removeLast()
    }
}

/* Giải bài toán tổng tập con II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Trạng thái (tập con)
    let nums = nums.sorted() // Sắp xếp nums
    let start = 0 // Điểm bắt đầu duyệt
    var res: [[Int]] = [] // Danh sách kết quả (danh sách các tập con)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Mã điều khiển */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum equal to \(target) res = \(res)")
    }
}
