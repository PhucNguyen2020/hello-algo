/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Giải thuật quay lui: Tổng tập con I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // Khi tổng tập con bằng target, ghi lại nghiệm
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    // Cắt tỉa 2: bắt đầu duyệt từ start để tránh sinh ra các tập con trùng lặp
    for i in start..choices.len() {
        // Cắt tỉa 1: nếu tổng tập con vượt quá target, kết thúc vòng lặp ngay lập tức
        // Điều này là do mảng đã được sắp xếp, các phần tử phía sau lớn hơn nên tổng tập con chắc chắn sẽ vượt quá target
        if target - choices[i] < 0 {
            break;
        }
        // Thử: thực hiện lựa chọn, cập nhật target, start
        state.push(choices[i]);
        // Tiến hành vòng lựa chọn tiếp theo
        backtrack(state, target - choices[i], choices, i, res);
        // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
        state.pop();
    }
}

/* Giải bài toán tổng tập con I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // Trạng thái (tập con)
    nums.sort(); // Sắp xếp nums
    let start = 0; // Điểm bắt đầu duyệt
    let mut res = Vec::new(); // Danh sách kết quả (danh sách các tập con)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Mã điều khiển chính */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum equal to {} res = {:?}", target, &res);
}
