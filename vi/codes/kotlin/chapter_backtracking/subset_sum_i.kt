/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* Giải thuật quay lui: Tổng tập con I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // Khi tổng tập con bằng target, ghi lại lời giải
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Duyệt qua tất cả các lựa chọn
    // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    for (i in start..<choices.size) {
        // Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay
        // Vì mảng đã được sắp xếp, các phần tử phía sau lớn hơn, nên tổng tập con chắc chắn sẽ vượt quá target
        if (target - choices[i] < 0) {
            break
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.add(choices[i])
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i, res)
        // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
        state.removeAt(state.size - 1)
    }
}

/* Giải bài toán tổng tập con I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Trạng thái (tập con)
    nums.sort() // Sắp xếp nums
    val start = 0 // Điểm bắt đầu duyệt
    val res = mutableListOf<MutableList<Int>?>() // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, nums, start, res)
    return res
}

/* Đoạn mã điều khiển */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum equal to $target res = $res")
}