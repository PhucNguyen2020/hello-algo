/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* Kiểm tra xem trạng thái hiện tại có phải là nghiệm hay không */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* Ghi lại nghiệm */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* Kiểm tra xem lựa chọn có hợp lệ trong trạng thái hiện tại hay không */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* Cập nhật trạng thái */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* Khôi phục trạng thái */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* Giải thuật quay lui: Ví dụ 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // Kiểm tra xem đó có phải là nghiệm hay không
    if is_solution(state) {
        // Ghi lại nghiệm
        record_solution(state, res);
    }
    // Duyệt qua tất cả các lựa chọn
    for &choice in choices.iter() {
        // Cắt tỉa: kiểm tra xem lựa chọn có hợp lệ hay không
        if is_valid(state, choice) {
            // Thử: thực hiện lựa chọn, cập nhật trạng thái
            make_choice(state, choice.unwrap().clone());
            // Tiến hành vòng lựa chọn tiếp theo
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // Quay lui: hoàn tác lựa chọn, khôi phục về trạng thái trước đó
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Mã điều khiển chính */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Initialize binary tree");
    print_util::print_tree(root.as_ref().unwrap());

    // Giải thuật quay lui
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
