/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Vòng lặp for */
int forLoop(int n) {
  int res = 0;
  // Tính tổng 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* Vòng lặp while */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // Khởi tạo biến điều kiện
  // Tính tổng 1, 2, ..., n-1, n
  while (i <= n) {
    res += i;
    i++; // Cập nhật biến điều kiện
  }
  return res;
}

/* Vòng lặp while (hai lần cập nhật) */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // Khởi tạo biến điều kiện
  // Tính tổng 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // Cập nhật biến điều kiện
    i++;
    i *= 2;
  }
  return res;
}

/* Vòng lặp for lồng nhau */
String nestedForLoop(int n) {
  String res = "";
  // Lặp i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // Lặp j = 1, 2, ..., n-1, n
    for (int j = 1; j <= n; j++) {
      res += "($i, $j), ";
    }
  }
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = forLoop(n);
  print("\nFor loop sum result res = $res");

  res = whileLoop(n);
  print("\nWhile loop sum result res = $res");

  res = whileLoopII(n);
  print("\nWhile loop (two updates) sum result res = $res");

  String resStr = nestedForLoop(n);
  print("\nNested for loop result $resStr");
}
