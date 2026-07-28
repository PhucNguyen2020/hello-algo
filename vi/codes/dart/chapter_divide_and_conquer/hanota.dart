/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Di chuyển một đĩa */
void move(List<int> src, List<int> tar) {
  // Lấy một đĩa từ đỉnh của src
  int pan = src.removeLast();
  // Đặt đĩa lên đỉnh của tar
  tar.add(pan);
}

/* Giải bài toán tháp Hà Nội f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // Nếu chỉ còn một đĩa trong src, di chuyển trực tiếp nó đến tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ src sang buf, sử dụng tar
  dfs(i - 1, src, tar, buf);
  // Bài toán con f(1): di chuyển đĩa còn lại từ src sang tar
  move(src, tar);
  // Bài toán con f(i-1): di chuyển i-1 đĩa trên cùng từ buf sang tar, sử dụng src
  dfs(i - 1, buf, src, tar);
}

/* Giải bài toán tháp Hà Nội */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // Di chuyển n đĩa trên cùng từ A sang C, sử dụng B
  dfs(n, A, B, C);
}

/* Driver Code */
void main() {
  // Cuối danh sách là đỉnh của cọc
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("In initial state:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("After disk movement is complete:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
