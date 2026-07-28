/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};
use std::cell::RefCell;
use std::rc::Rc;

/* Chèn nút P vào sau nút n0 trong danh sách liên kết */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* Xóa nút đầu tiên đứng sau nút n0 trong danh sách liên kết */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* Truy cập nút tại vị trí index trong danh sách liên kết */
pub fn access<T>(head: Rc<RefCell<ListNode<T>>>, index: i32) -> Option<Rc<RefCell<ListNode<T>>>> {
    fn dfs<T>(
        head: Option<&Rc<RefCell<ListNode<T>>>>,
        index: i32,
    ) -> Option<Rc<RefCell<ListNode<T>>>> {
        if index <= 0 {
            return head.cloned();
        }

        if let Some(node) = head {
            dfs(node.borrow().next.as_ref(), index - 1)
        } else {
            None
        }
    }

    dfs(Some(head).as_ref(), index)
}

/* Tìm nút đầu tiên có giá trị target trong danh sách liên kết */
pub fn find<T: PartialEq>(head: Rc<RefCell<ListNode<T>>>, target: T) -> i32 {
    fn find<T: PartialEq>(head: Option<&Rc<RefCell<ListNode<T>>>>, target: T, idx: i32) -> i32 {
        if let Some(node) = head {
            if node.borrow().val == target {
                return idx;
            }
            return find(node.borrow().next.as_ref(), target, idx + 1);
        } else {
            -1
        }
    }

    find(Some(head).as_ref(), target, 0)
}

/* Mã điều khiển chính */
fn main() {
    /* Khởi tạo danh sách liên kết */
    // Khởi tạo từng nút
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // Xây dựng tham chiếu giữa các nút
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("Initialized linked list is ");
    print_util::print_linked_list(&n0);

    /* Chèn nút */
    insert(&n0, ListNode::new(0));
    print!("After inserting node, linked list is ");
    print_util::print_linked_list(&n0);

    /* Xóa nút */
    remove(&n0);
    print!("After deleting node, linked list is ");
    print_util::print_linked_list(&n0);

    /* Truy cập nút */
    let node = access(n0.clone(), 3);
    println!("Value of node at index 3 in linked list = {}", node.unwrap().borrow().val);

    /* Tìm nút */
    let index = find(n0.clone(), 2);
    println!("Index of node with value 2 in linked list = {}", index);
}
