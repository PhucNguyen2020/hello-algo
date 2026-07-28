/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Quay lui (backtracking) */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // Khi leo đến bậc thang thứ n, cộng thêm 1 vào số lời giải
    if state == n {
        res[0] += 1
    }
    // Duyệt qua tất cả các lựa chọn
    for choice in choices {
        // Cắt tỉa: không cho phép vượt quá bậc thang thứ n
        if state + choice > n {
            continue
        }
        // Thử: đưa ra lựa chọn, cập nhật trạng thái
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Quay lui
    }
}

/* Leo cầu thang: quay lui */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Có thể chọn leo lên 1 hoặc 2 bậc
    let state = 0 // Bắt đầu leo từ bậc thang thứ 0
    var res: [Int] = []
    res.append(0) // Dùng res[0] để ghi lại số lời giải
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Mã điều khiển */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
