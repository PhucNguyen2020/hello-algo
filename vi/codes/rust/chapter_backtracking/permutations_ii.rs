/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* Giải thuật quay lui: Hoán vị II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Khi độ dài state bằng số lượng phần tử, ghi lại nghiệm
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Duyệt qua tất cả các lựa chọn
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // Cắt tỉa: không cho phép chọn lại phần tử đã chọn, và không cho phép chọn lại các phần tử có giá trị bằng nhau
        if !selected[i] && !duplicated.contains(&choice) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            duplicated.insert(choice); // Ghi lại giá trị phần tử đã chọn
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

/* Hoán vị II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Mã điều khiển chính */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}
