# Bài tập

## Ôn tập khái niệm

### Độ phức tạp thời gian và không gian của lặp và đệ quy

Hai hàm dưới đây đều tính $1 + 2 + \dots + n$ (giả sử $n \ge 1$). Đặt `n` bằng 4,
hãy trả lời các câu hỏi theo đúng thứ tự thực thi thực tế của chương trình, sau đó so sánh hiệu suất của hai cách tiếp cận.

```python
def sum_iter(n):
    s = 0
    for i in range(1, n + 1):
        s += i
    return s

def sum_recur(n):
    if n == 1:
        return 1
    return n + sum_recur(n - 1)
```

<!-- numbered-subquestions -->

1. Khi `sum_iter(4)` chạy, giá trị của `s` sau mỗi lần lặp là bao nhiêu?
2. Khi `sum_recur(4)` chạy, các lệnh gọi hàm diễn ra theo thứ tự nào? Khi các lệnh gọi trả về từ tầng sâu nhất, kết quả được tính ra như thế nào?
3. Độ phức tạp thời gian và không gian của hai cách tiếp cận là gì? Hãy giải thích lập luận của bạn dựa trên quá trình thực thi ở Câu hỏi 1 và 2.

??? success "Đáp án"

    1. Biến lặp `i` lần lượt nhận các giá trị `1, 2, 3, 4`. Sau mỗi lần lặp, `s` lần lượt trở thành
        `1, 3, 6, 10`, do đó `sum_iter(4)` trả về 10.

    2. Các lệnh gọi hàm diễn ra theo thứ tự sau:
        `sum_recur(4) → sum_recur(3) → sum_recur(2) → sum_recur(1)`.
        `sum_recur(1)` trả về 1. Các lệnh gọi còn lại sau đó lần lượt thu được `2 + 1 = 3`, `3 + 3 = 6`, và `4 + 6 = 10`.
        Tại thời điểm sâu nhất, cả bốn lệnh gọi hàm đều vẫn chưa hoàn thành.

    3. Cả hai hàm đều thực hiện số lần lặp hoặc số lần gọi hàm tỷ lệ thuận với $n$, nên cả hai đều có độ phức tạp thời gian $O(n)$.
        Độ phức tạp không gian của chúng thì khác nhau. Phiên bản lặp chỉ sử dụng một số lượng biến không đổi, nên độ phức tạp không gian của nó là $O(1)$.
        Trong phiên bản đệ quy, các lệnh gọi trước đó phải chờ kết quả trước khi trả về, nên ngăn xếp lệnh gọi lưu giữ tối đa $n$ lệnh gọi cùng một lúc.
        Độ phức tạp không gian của nó là $O(n)$.

        Khi phân tích độ phức tạp không gian, hãy nhớ tính cả không gian được sử dụng bởi các lệnh gọi đệ quy lẫn các biến được khai báo trong mã nguồn.

### Độ phức tạp thời gian của ba đoạn mã

Mỗi đoạn mã dưới đây nhận một số nguyên dương $n$ làm đầu vào. Hãy sắp xếp chúng theo thứ tự độ phức tạp thời gian từ thấp đến cao, và cho biết độ phức tạp của từng đoạn.

```python
# Đoạn 1
s = 0
for i in range(n):
    s += i

# Đoạn 2
s = 0
for i in range(n):
    for j in range(i, n):
        s += j

# Đoạn 3
while n > 1:
    n = n // 2
```

??? success "Đáp án"

    Theo thứ tự từ thấp đến cao là Đoạn 3 với $O(\log n)$, Đoạn 1 với $O(n)$, và Đoạn 2 với $O(n^2)$.
    Đoạn 3 giảm một nửa $n$ sau mỗi lần lặp, nên nó chạy khoảng $\log_2 n$ lần.
    Vòng lặp trong Đoạn 1 chạy đúng $n$ lần. Vòng lặp bên trong của Đoạn 2 chạy
    $n,n-1,\dots,1$ lần, tổng cộng là $n(n+1)/2$, nên độ phức tạp thời gian của nó là bậc hai.

### Cách đảo ngược nào sử dụng ít không gian hơn?

Có hai cách để đảo ngược toàn bộ phần tử trong mảng `nums`:

<!-- numbered-subquestions -->

1. Tạo một mảng mới `res` có cùng độ dài, sao chép các phần tử vào đó theo thứ tự ngược lại, rồi trả về.
2. Di chuyển hai chỉ số `i` và `j` từ đầu và cuối mảng hướng vào trong, hoán đổi `nums[i]` và `nums[j]` ở mỗi bước.

    Độ phức tạp không gian của mỗi cách tiếp cận là gì? Cách nào là thao tác "tại chỗ" (in-place)?

??? success "Đáp án"

    1. Cách này cần một mảng phụ có cùng độ dài với mảng đầu vào, nên độ phức tạp không gian của nó là $O(n)$.

    2. Cách này chỉ sử dụng hai biến chỉ số,
        nên độ phức tạp không gian của nó là $O(1)$. Đây là một thao tác tại chỗ.

        Lưu ý rằng đảo ngược tại chỗ sẽ làm thay đổi mảng đầu vào,
        nên chỉ nên ưu tiên dùng cách này khi được phép sửa đổi dữ liệu đầu vào. Nếu cần giữ nguyên mảng gốc, chi phí sao chép của cách thứ nhất là không thể tránh khỏi.

## Bài tập lập trình

### Số Fibonacci

Dãy Fibonacci được định nghĩa bởi $F(0)=0$, $F(1)=1$, và với $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Cho một số nguyên không âm `n`, hãy dùng vòng lặp để tính và trả về $F(n)$. Không được sử dụng đệ quy.

??? tip "Gợi ý"

    1. Xử lý riêng các trường hợp n bằng 0 hoặc 1
    2. Chỉ cần hai số hạng liền trước để tính số hạng tiếp theo; không cần lưu toàn bộ dãy số
    3. Khi cập nhật hai biến, hãy cẩn thận để không ghi đè lên giá trị cũ trước khi nó được sử dụng

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
