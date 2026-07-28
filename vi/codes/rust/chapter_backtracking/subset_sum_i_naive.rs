/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // Khi tổng tập con bằng target, ghi lại nghiệm
    if total == target {
        res.push(state.clone());
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    for i in 0..choices.len() {
        // Cắt tỉa: nếu tổng tập con vượt quá target, bỏ qua lựa chọn này
        if total + choices[i] > target {
            continue;
        }
        // Thử: thực hiện lựa chọn, cập nhật tổng phần tử total
        state.push(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target, total + choices[i], choices, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.pop();
    }
}

/* Giải bài toán tổng tập con I (bao gồm các tập con trùng lặp) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Trạng thái (tập con)
    let total = 0; // Tổng tập con
    let mut res = Vec::new(); // Danh sách kết quả (danh sách các tập con)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Mã điều khiển chính */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum equal to {} res = {:?}", target, &res);
    println!("Please note that this method outputs results containing duplicate sets");
}
