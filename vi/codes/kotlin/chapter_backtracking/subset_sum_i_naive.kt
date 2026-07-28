/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* Giải thuật quay lui: Tổng tập con I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // Khi tổng tập con bằng target, ghi lại lời giải
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Duyệt qua tất cả các lựa chọn
    for (i in choices.indices) {
        // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
        if (total + choices[i] > target) {
            continue
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
        state.add(choices[i])
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res)
        // Quay lui: hủy lựa chọn, khôi phục về trạng thái trước đó
        state.removeAt(state.size - 1)
    }
}

/* Giải bài toán tổng tập con I (bao gồm cả các tập con trùng lặp) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Trạng thái (tập con)
    val total = 0 // Tổng tập con
    val res = mutableListOf<MutableList<Int>?>() // Danh sách kết quả (danh sách các tập con)
    backtrack(state, target, total, nums, res)
    return res
}

/* Đoạn mã điều khiển */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum equal to $target res = $res")
    println("Please note that this method outputs results containing duplicate sets")
}