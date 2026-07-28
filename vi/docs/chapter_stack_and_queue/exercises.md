# Bài tập

## Ôn tập khái niệm

### Phần tử nào rời khỏi ngăn xếp hoặc hàng đợi trước tiên?

Chuẩn bị một ngăn xếp rỗng `S` và một hàng đợi rỗng `Q`. Thực hiện cùng một chuỗi thao tác trên mỗi cấu trúc:

Bước 1: Thêm `A`.
Bước 2: Thêm `B`.
Bước 3: Lấy ra và ghi lại một phần tử.
Bước 4: Thêm `C`.
Bước 5: Tiếp tục lấy ra và ghi lại các phần tử cho đến khi cấu trúc rỗng.

Viết ra thứ tự các phần tử được lấy ra khỏi `S` và khỏi `Q`. Giải thích sự khác biệt bằng nguyên tắc "vào sau ra trước" hoặc "vào trước ra trước."

??? success "Đáp án"

    Thứ tự lấy ra của ngăn xếp `S` là `B, C, A`. Sau khi thêm các phần tử `A, B`, phần tử được thêm gần nhất là `B` sẽ được lấy ra trước. Sau khi thêm `C`,
    `C, A` được lấy ra theo thứ tự đó. Đây chính là "vào sau ra trước."

    Thứ tự lấy ra của hàng đợi `Q` là `A, B, C`. Sau khi thêm các phần tử `A, B`, phần tử được thêm sớm nhất là `A` sẽ được lấy ra trước.
    Sau khi thêm `C`, `B, C` được lấy ra theo thứ tự đó. Đây chính là "vào trước ra trước."

### Điều gì xảy ra khi con trỏ cuối vượt qua điểm kết thúc của mảng?

Một hàng đợi được triển khai bằng mảng vòng có độ dài 5, với các chỉ số từ `0` đến `4`.
Hiện tại, `front = 3` và `size = 2`; `A, B` được lưu tại các chỉ số 3 và 4 tương ứng.

<!-- numbered-subquestions -->

1. Khi thêm `C` vào hàng đợi, `C` sẽ được lưu tại chỉ số nào? `size` sau khi thêm vào là bao nhiêu?
2. Tiếp theo, thực hiện lấy ra một lần. Phần tử nào bị xóa? Giá trị mới của `front` và `size` là gì?
3. Thứ tự logic từ đầu đến cuối hàng đợi hiện tại là gì? Việc lấy ra có cần dịch chuyển các phần tử khác trong mảng không? Vì sao?

??? success "Đáp án"

    1. Vị trí của phần tử mới là
        `(front + size) % 5 = (3 + 2) % 5 = 0`,
        nên `C` được lưu tại chỉ số 0. Sau khi thêm vào, `size = 3`.

    2. Lấy ra sẽ xóa phần tử ở đầu hiện tại là `A`. Chỉ số đầu mới là
        `(3 + 1) % 5 = 4`, nên `front = 4` và `size = 2`.

    3. Thứ tự logic của các phần tử hợp lệ là `B, C`, với `B` ở chỉ số 4 và `C` ở chỉ số 0.
        Việc lấy ra chỉ cần thay đổi `front` và `size`. Mảng vòng sử dụng phép chia lấy dư để quay chỉ số về đầu mảng,
        nên không cần dịch chuyển tất cả các phần tử khác lên phía trước.

### Các thao tác ở hai đầu của hàng đợi hai đầu

Ở đây, `push_first` thêm một phần tử vào đầu, `push_last` thêm một phần tử vào cuối,
`pop_first` xóa một phần tử ở đầu, và `pop_last` xóa một phần tử ở cuối.

Thực hiện các thao tác sau trên một hàng đợi hai đầu rỗng `deq`:

1. `push_last(A)`
2. `push_last(B)`
3. `push_first(C)`
4. `pop_last()`
5. `push_last(D)`
6. `pop_first()`

<!-- numbered-subquestions -->

1. Hai thao tác lấy ra trả về những phần tử nào?
2. Sau khi tất cả các thao tác hoàn tất, những phần tử nào còn lại, tính từ đầu đến cuối?
3. Xem xét sáu thao tác trên. Một hàng đợi chỉ cho phép chèn ở cuối và xóa ở đầu có thể thực hiện được tất cả các thao tác này không? Nếu không, hãy xác định các thao tác mà nó không thể thực hiện. Sau đó cho biết hàng đợi hai đầu có thể thực hiện chúng hay không và giải thích vì sao.

??? success "Đáp án"

    Sau ba bước đầu tiên, hàng đợi hai đầu tính từ đầu đến cuối là `[C, A, B]`.

    <!-- numbered-subquestions -->

    1. `pop_last()` xóa `B`. Sau khi thêm `D`, hàng đợi hai đầu trở thành `[C, A, D]`,
        và `pop_first()` sau đó xóa `C`.

    2. `[A, D]` còn lại.

    3. Một hàng đợi chỉ cho phép chèn ở cuối và xóa ở đầu không thể thực hiện được tất cả các thao tác.
        Bước 3, `push_first(C)`, yêu cầu chèn ở đầu, và Bước 4, `pop_last()`, yêu cầu xóa ở cuối. Cả hai đều nằm ngoài các thao tác mà một hàng đợi như vậy hỗ trợ.
        Hàng đợi hai đầu cho phép chèn và xóa ở cả hai đầu, nên nó có thể thực hiện tất cả sáu thao tác.

## Bài tập lập trình

### Kiểm tra chuỗi dấu ngoặc

Cho một chuỗi `s` chỉ chứa ba loại dấu ngoặc `()`, `[]`, và `{}`, hãy dùng ngăn xếp để xác định xem chuỗi đó có hợp lệ hay không.

Một chuỗi hợp lệ phải thỏa mãn cả hai điều kiện: mỗi dấu ngoặc đóng phải khớp với loại của dấu ngoặc mở chưa được khớp gần nhất,
và không còn dấu ngoặc mở nào chưa được khớp sau khi duyệt xong. Trả về một giá trị Boolean cho kết quả.

??? tip "Gợi ý"

    1. Bạn có thể tạo một ánh xạ từ mỗi dấu ngoặc đóng đến dấu ngoặc mở tương ứng
    2. Khi gặp một dấu ngoặc đóng, trước tiên kiểm tra xem ngăn xếp có rỗng không, sau đó kiểm tra xem đỉnh ngăn xếp có khớp không
    3. Ngăn xếp cũng phải rỗng sau khi duyệt xong

[LeetCode](https://leetcode.com/problems/valid-parentheses/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
