/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Giải thuật quay lui: Hoán vị I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Khi độ dài state bằng số lượng phần tử, ghi lại nghiệm
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    for i in 0..choices.len() {
        let choice = choices[i];
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn
        if !selected[i] {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            selected[i] = true;
            state.push(choice);
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(state.clone(), choices, selected, res);
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            selected[i] = false;
            state.pop();
        }
    }
}

/* Hoán vị I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // Trạng thái (tập con)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Mã điều khiển chính */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}
