/**
 * File: recursion.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Đệ quy */
int recur(int n) {
  // Điều kiện dừng
  if (n == 1) return 1;
  // Đệ quy: gọi đệ quy
  int res = recur(n - 1);
  // Trả về: trả về kết quả
  return n + res;
}

/* Mô phỏng đệ quy bằng lặp */
int forLoopRecur(int n) {
  // Sử dụng một ngăn xếp tường minh để mô phỏng ngăn xếp gọi hàm của hệ thống
  List<int> stack = [];
  int res = 0;
  // Đệ quy: gọi đệ quy
  for (int i = n; i > 0; i--) {
    // Mô phỏng "đệ quy" bằng "đẩy vào ngăn xếp"
    stack.add(i);
  }
  // Trả về: trả về kết quả
  while (!stack.isEmpty) {
    // Mô phỏng "trả về" bằng "lấy ra khỏi ngăn xếp"
    res += stack.removeLast();
  }
  // res = 1+2+3+...+n
  return res;
}

/* Đệ quy đuôi */
int tailRecur(int n, int res) {
  // Điều kiện dừng
  if (n == 0) return res;
  // Gọi đệ quy đuôi
  return tailRecur(n - 1, res + n);
}

/* Dãy Fibonacci: đệ quy */
int fib(int n) {
  // Điều kiện dừng f(1) = 0, f(2) = 1
  if (n == 1 || n == 2) return n - 1;
  // Gọi đệ quy f(n) = f(n-1) + f(n-2)
  int res = fib(n - 1) + fib(n - 2);
  // Trả về kết quả f(n)
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = recur(n);
  print("\nRecursion sum result res = $res");

  res = tailRecur(n, 0);
  print("\nTail recursion sum result res = $res");

  res = forLoopRecur(n);
  print("\nUsing iteration to simulate recursion sum result res = $res");

  res = fib(n);
  print("\nThe ${n}th Fibonacci number is $res");
}
