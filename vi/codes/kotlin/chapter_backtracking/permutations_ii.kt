/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* Giải thuật quay lui: Hoán vị II */
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
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn và không cho phép chọn lại các phần tử có giá trị bằng nhau
        if (!selected[i] && !duplicated.contains(choice)) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated.add(choice) // Ghi lại giá trị phần tử đã chọn
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

/* Hoán vị II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Đoạn mã điều khiển */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("Input array nums = ${nums.contentToString()}")
    println("All permutations res = $res")
}