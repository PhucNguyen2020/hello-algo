# Bài tập

## Ôn tập khái niệm

### Những nhiệm vụ nào phù hợp với chia để trị?

Một sinh viên muốn giải mỗi nhiệm vụ dưới đây bằng cách "chia thành hai nửa, giải từng nửa riêng biệt, rồi kết hợp kết quả."
Hãy phân loại mỗi nhiệm vụ là "phù hợp với chia để trị", "có thể dùng chia để trị, nhưng sẽ không giảm được tổng khối lượng công việc", hoặc "hai nửa không thể giải độc lập", và giải thích lý do.

<!-- numbered-subquestions -->

1. Sắp xếp một mảng chưa được sắp xếp.
2. Tìm giá trị lớn nhất trong một mảng.
3. Thực hiện một dãy các thao tác ngăn xếp `push(x)` và `pop()` theo thứ tự, và xuất ra phần tử trả về bởi mỗi lần `pop()`.

??? success "Đáp án"

    1. Phù hợp: chia mảng làm đôi, sắp xếp từng nửa độc lập, rồi hợp nhất chúng trong thời gian $O(n)$. Đây chính xác là sắp xếp trộn.
    2. Có thể dùng chia để trị, nhưng nó không giảm được tổng khối lượng công việc. Hai nửa vẫn cần kiểm tra tổng cộng $n$ phần tử,
        nên độ phức tạp thời gian vẫn là $O(n)$, giống như quét trực tiếp.
    3. Hai nửa không thể giải độc lập. Nội dung của ngăn xếp tại thời điểm bắt đầu nửa thứ hai phụ thuộc vào kết quả thực thi của nửa thứ nhất,
        nên hai nửa không thể hoàn thành nếu không biết kết quả của nhau.

### Lũy thừa nhanh giảm khối lượng tính toán như thế nào

Hàm đệ quy dưới đây sử dụng chia để trị để tính $x^n$:

```python
def fast_pow(x, n):
    if n == 0:
        return 1
    half = fast_pow(x, n // 2)
    if n % 2 == 0:
        return half * half
    return half * half * x
```

Sử dụng nó để tính `fast_pow(3, 5)`:

<!-- numbered-subquestions -->

1. Khi các lời gọi đệ quy diễn ra, đối số `n` nhận các giá trị nào theo thứ tự?
2. Bắt đầu từ lời gọi sâu nhất, mỗi tầng trả về giá trị gì?
3. Tại sao kết quả nên được lưu vào `half` thay vì viết `fast_pow(x, n // 2)` hai lần?

??? success "Đáp án"

    1. Đối số nhận các giá trị `5 → 2 → 1 → 0`. Số mũ được chia đôi ở mỗi bước cho đến khi đạt trường hợp cơ sở.

    2. Khi `n = 0`, hàm trả về 1. Khi `n = 1`, nó trả về $1×1×3=3$.
        Khi `n = 2`, nó trả về $3×3=9$. Khi `n = 5`, nó trả về $9×9×3=243$.

    3. Nếu `fast_pow(x, n // 2)` được viết một lần ở mỗi phía của phép nhân, hai lời gọi đệ quy sẽ tính chính xác cùng một bài toán con.
        Việc lưu kết quả vào `half` có nghĩa là mỗi tầng chỉ thực hiện một lời gọi đệ quy, nên độ sâu đệ quy khoảng $\log n$.
        Việc gọi hai lần sẽ gây ra rất nhiều tính toán lặp lại.

### Chia dãy duyệt thành cây con trái và cây con phải

Một cây nhị phân không có nút trùng lặp. Dãy duyệt trước và duyệt giữa của nó là:

- Duyệt trước: `[A, B, D, E, C]`
- Duyệt giữa: `[D, B, E, A, C]`

Chỉ chia các dãy một lần, tại nút gốc. Bạn không cần tiếp tục đệ quy hay vẽ toàn bộ cây:

<!-- numbered-subquestions -->

1. Nút nào là nút gốc?
2. Những dãy con nào của dãy duyệt giữa tương ứng với cây con trái và cây con phải?
3. Những dãy con nào của dãy duyệt trước tương ứng với cây con trái và cây con phải? Những nút nào là con trực tiếp của nút gốc?

??? success "Đáp án"

    1. Nút đầu tiên trong dãy duyệt trước là nút gốc, vì vậy nút gốc là `A`.

    2. `A` chia dãy duyệt giữa thành hai phần: `[D, B, E]` cho cây con trái và `[C]` cho cây con phải.

    3. Cây con trái chứa 3 nút, nên 3 phần tử duyệt trước sau nút gốc `A` thuộc về cây con trái,
        tức là `[B, D, E]`. Phần còn lại `[C]` thuộc về cây con phải.
        Do đó, con trái của nút gốc là `B`, và con phải của nó là `C`.

## Bài tập lập trình

### Lũy thừa nhanh

Cho một số thực `x` và một số nguyên `n`, tính $x^n$ mà không gọi hàm lũy thừa có sẵn của ngôn ngữ.
Sử dụng chia để trị đệ quy: chia đôi số mũ ở mỗi bước và tái sử dụng kết quả của bài toán con đã tính được.
Bài tập này định nghĩa $x^0=1$, kể cả khi `x = 0`. Khi `n < 0`, đảm bảo `x != 0`, và đáp án có thể được biến đổi thành $(1/x)^{-n}$.

??? tip "Gợi ý"

    1. Khi n bằng 0, đáp án là 1
    2. Sau khi tính x lũy thừa n // 2, lưu kết quả vào half thay vì gọi đệ quy lần thứ hai
    3. Khi n < 0, trước tiên đổi x thành 1 / x rồi đổi n thành -n; trong C++ hoặc Java, trước tiên chuyển n sang số nguyên 64-bit để tránh tràn số khi lấy số đối của số nguyên 32-bit nhỏ nhất

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
