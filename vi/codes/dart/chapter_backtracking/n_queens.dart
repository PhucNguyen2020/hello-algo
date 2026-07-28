/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Giải thuật quay lui: Bài toán N quân hậu */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // Khi tất cả các hàng đã được đặt, ghi lại lời giải
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Duyệt qua tất cả các cột
  for (int col = 0; col < n; col++) {
    // Tính đường chéo chính và đường chéo phụ tương ứng với ô này
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Cắt tỉa: không cho phép quân hậu tồn tại trên cùng cột, đường chéo chính và đường chéo phụ của ô này
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Thử: đặt quân hậu vào ô này
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Đặt hàng tiếp theo
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Quay lui: khôi phục ô này thành ô trống
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Giải bài toán N quân hậu */
List<List<List<String>>> nQueens(int n) {
  // Khởi tạo bàn cờ n*n, trong đó 'Q' đại diện cho quân hậu và '#' đại diện cho ô trống
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Ghi lại xem cột này đã có quân hậu hay chưa
  List<bool> diags1 = List.filled(2 * n - 1, false); // Ghi lại xem đường chéo chính này đã có quân hậu hay chưa
  List<bool> diags2 = List.filled(2 * n - 1, false); // Ghi lại xem đường chéo phụ này đã có quân hậu hay chưa
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Input board size is $n");
  print("Total queen placement solutions: ${res.length}");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
