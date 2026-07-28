/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Giải thuật quay lui: n hoàng hậu */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // Khi đã đặt xong tất cả các hàng, ghi lại nghiệm
    if row == n {
        res.push(state.clone());
        return;
    }
    // Duyệt qua tất cả các cột
    for col in 0..n {
        // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Cắt tỉa: không cho phép tồn tại hoàng hậu trên cùng cột, đường chéo chính và đường chéo phụ của ô này
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Thử: đặt hoàng hậu vào ô này
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Đặt hàng tiếp theo
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Quay lui: khôi phục ô này thành ô trống
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Giải bài toán n hoàng hậu */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho hoàng hậu và '#' đại diện cho ô trống
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Ghi lại xem cột có hoàng hậu hay không
    let mut diags1 = vec![false; 2 * n - 1]; // Ghi lại xem đường chéo chính có hoàng hậu hay không
    let mut diags2 = vec![false; 2 * n - 1]; // Ghi lại xem đường chéo phụ có hoàng hậu hay không
    let mut res: Vec<Vec<Vec<String>>> = Vec::new();

    backtrack(
        0,
        n,
        &mut state,
        &mut res,
        &mut cols,
        &mut diags1,
        &mut diags2,
    );

    res
}

/* Mã điều khiển chính */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("Input board size is {n}");
    println!("Total queen placement solutions: {}", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
