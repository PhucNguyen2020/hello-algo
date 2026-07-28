# Bài tập

## Ôn tập khái niệm

### Giải thuật hoán vị này có bỏ sót kết quả không?

Một giải thuật quay lui cố gắng sinh ra tất cả các hoán vị bằng cách dùng `1, 2, 3` theo thứ tự đó. Mỗi lần chọn một số `x`, nó sẽ:

1. Thêm `x` vào cuối đường đi (path) hiện tại.
2. Đánh dấu `x` là "đã dùng."
3. Đệ quy để điền vào vị trí tiếp theo.

Khi lệnh gọi đệ quy trả về, học sinh chỉ xóa `x` khỏi cuối đường đi rồi thử số tiếp theo.

<!-- numbered-subquestions -->

1. Giải thuật này sinh ra hoán vị nào đầu tiên? Nó có thể sinh ra đủ cả 6 hoán vị không?
2. Trước khi quay lại tầng trước, việc chỉ xóa số cuối cùng khỏi đường đi có đủ không? Nếu không, cần làm thêm gì nữa? Hãy giải thích vì sao.

??? success "Đáp án"

    1. Nó sinh ra `[1, 2, 3]` đầu tiên, nhưng không thể sinh ra đủ tất cả các hoán vị. Mặc dù đường đi trở nên ngắn hơn khi các lệnh gọi trả về,
        các dấu đánh dấu của 1, 2 và 3 vẫn đều là "đã dùng," khiến không còn số nào khả dụng cho các nhánh sau.

    2. Như vậy là chưa đủ. Sau khi xóa `x` khỏi cuối đường đi, giải thuật còn phải đánh dấu lại `x` là "chưa dùng."
        Đường đi hiện tại và các dấu đánh dấu đã dùng cùng nhau mô tả trạng thái tìm kiếm. Một lựa chọn làm thay đổi cả hai, nên khi quay lui phải khôi phục cả hai
        trước khi một nhánh khác có thể chọn lại `x`.

### Thứ tự chọn số có quan trọng không?

Cho mảng đã sắp xếp `[2, 3, 5]` và giá trị mục tiêu 5. Mỗi số có thể được chọn nhiều lần.
Giải thuật yêu cầu các số trên mỗi đường tìm kiếm chỉ được xuất hiện theo thứ tự không giảm.

<!-- numbered-subquestions -->

1. Có thể tìm được những tổ hợp riêng biệt nào?
2. Tại sao không cần tìm kiếm cùng một nhóm số theo các thứ tự khác nhau? Ràng buộc thứ tự không giảm này đạt được điều gì?
3. Giả sử đường đi hiện tại là `[3]`, số dư còn lại là 2, và ứng viên tiếp theo là 3. Tại sao giải thuật có thể dừng việc kiểm tra tất cả các ứng viên sau đó ở tầng này?

??? success "Đáp án"

    1. Các tổ hợp riêng biệt là `[2, 3]` và `[5]`.

    2. Bài tập này coi `[2, 3]` và `[3, 2]` là cùng một tổ hợp; thứ tự chọn số không tạo ra một đáp án khác.
        Việc yêu cầu các số trong một đường đi phải xuất hiện theo thứ tự không giảm giúp việc tìm kiếm bỏ qua các cách sắp xếp trùng lặp như `[3, 2]`.

    3. Số dư còn lại là 2, trong khi ứng viên 3 đã lớn hơn 2. Vì mảng đã được sắp xếp,
        mọi ứng viên sau đó còn lớn hơn nữa và không thể được thêm vào tổ hợp hiện tại, nên giải thuật có thể dừng kiểm tra ở tầng này ngay lập tức.

### Quân hậu tiếp theo có thể đặt ở đâu?

Đặt các quân hậu theo từng hàng trên bàn cờ `4 × 4`, với cả chỉ số hàng và cột đều bắt đầu từ 0.
Các quân hậu đã được đặt tại `(0, 1)` và `(1, 3)`. Quân hậu tiếp theo phải được đặt ở hàng 2.

<!-- numbered-subquestions -->

1. Những cột nào bị loại vì đã có quân hậu?
2. Trong số các cột còn lại, những vị trí nào bị loại vì nằm trên cùng đường chéo với một quân hậu đã có?
3. Những vị trí nào ở hàng 2 vẫn còn khả dụng để thử?

??? success "Đáp án"

    1. Các cột 1 và 3 đã có quân hậu, nên các vị trí `(2, 1)` và `(2, 3)` bị loại.

    2. Trong số các vị trí còn lại, `(2, 2)` nằm trên cùng đường chéo với `(1, 3)`, nên nó cũng bị loại.
        Vị trí `(2, 0)` không chung cột lẫn đường chéo với bất kỳ quân hậu nào đã có.

    3. Vị trí duy nhất để thử ở hàng 2 là `(2, 0)`.

        Bước này chỉ cho thấy cách đặt hiện tại là hợp lệ. Nếu sau đó không thể hoàn thành bàn cờ, giải thuật vẫn phải quay lui và thử một lựa chọn khác ở tầng trước.

## Bài tập lập trình

### Hoán vị của các phần tử phân biệt

Mảng số nguyên `nums` có ít nhất một phần tử, và tất cả các phần tử của nó đều phân biệt.
Hãy liệt kê mọi thứ tự có thể tạo được bằng cách dùng mỗi phần tử đúng một lần, và trả về mỗi thứ tự dưới dạng một mảng.
Các hoán vị có thể xuất hiện theo bất kỳ thứ tự nào trong kết quả.
Hãy dùng giải thuật quay lui, với một mảng Boolean ghi lại xem phần tử ở mỗi vị trí đã được chọn cho hoán vị hiện tại hay chưa.

??? tip "Gợi ý"

    1. Độ sâu đệ quy cho biết vị trí nào của hoán vị đang được điền
    2. Ở mỗi tầng, chỉ thử những phần tử chưa được dùng
    3. Khi độ dài của đường đi bằng độ dài của `nums`, hãy thêm một bản sao của đường đi vào kết quả

[LeetCode](https://leetcode.com/problems/permutations/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
