/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* Giải thuật quay lui: Hoán vị I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // Khi độ dài trạng thái bằng số lượng phần tử, ghi lại lời giải
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // Duyệt qua tất cả các lựa chọn
    for (i in choices.indices) {
        val choice = choices[i]
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
        if (!selected[i]) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            selected[i] = true
            state.add(choice)
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state, choices, selected, res)
            // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* Hoán vị I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Đoạn mã điều khiển */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("Input array nums = ${nums.contentToString()}")
    println("All permutations res = $res")
}