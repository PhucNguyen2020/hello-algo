# Bài tập

## Ôn tập khái niệm

### Mảng và danh sách liên kết tìm phần tử như thế nào

Một mảng và một danh sách liên kết đơn cùng lưu trữ `[A, B, C, D, E]` theo thứ tự. Bây giờ bạn cần truy cập phần tử thứ tư, `D`:

<!-- numbered-subquestions -->

1. Mảng có thể truy cập trực tiếp bằng chỉ số nào?
2. Bắt đầu từ nút đầu `A`, những nút nào được ghé thăm lần lượt khi đi theo `next`?
3. Khi phần tử cần truy cập càng xa về phía cuối, số bước cần thiết của mỗi cấu trúc thay đổi ra sao? Cấu trúc nào tốt hơn khi phải truy cập nhiều lần theo vị trí, và vì sao?

??? success "Đáp án"

    1. Với cách đánh chỉ số bắt đầu từ 0, phần tử thứ tư có chỉ số 3, nên mảng có thể truy cập trực tiếp `arr[3]`.

    2. Danh sách liên kết đơn phải bắt đầu từ nút đầu. Đường đi truy cập là `A → B → C → D`, cần ba lần di chuyển qua `next`.

    3. Mảng có thể xác định vị trí một phần tử trực tiếp từ địa chỉ bắt đầu và chỉ số, nên việc truy cập theo vị trí có độ phức tạp thời gian $O(1)$.
        Để truy cập nút thứ $k$, danh sách liên kết đơn phải bắt đầu từ nút đầu và đi theo `next` $k-1$ lần,
        điều này tốn thời gian $O(n)$ trong trường hợp xấu nhất.

        So sánh này chỉ liên quan đến việc truy cập theo vị trí; nó không có nghĩa là danh sách liên kết chậm hơn ở mọi thao tác.

### Mảng và danh sách liên kết chèn một phần tử như thế nào

Một mảng và một danh sách liên kết đơn cùng lưu trữ `A, B, C, D`. Bây giờ bạn cần chèn `X` vào sau `B`:

- Mảng có sức chứa 5 và hiện đang là `[A, B, C, D, _]`.
- Danh sách liên kết là `A → B → C → D`, và bạn đã có sẵn tham chiếu đến nút `B`.

<!-- numbered-subquestions -->

1. Những phần tử nào trong mảng cần phải dịch chuyển? Viết lại mảng sau khi chèn.
2. Danh sách liên kết nên cập nhật `X.next` và `B.next` theo thứ tự nào? Viết lại danh sách liên kết sau khi chèn.
3. Khi so sánh hiệu quả chèn phần tử, tại sao việc nêu rõ "bạn đã có sẵn tham chiếu đến nút B" lại quan trọng?

??? success "Đáp án"

    1. Mảng trước tiên dịch chuyển `D` sang phải một vị trí, sau đó dịch chuyển `C` sang phải một vị trí, rồi cuối cùng đặt `X` vào chỉ số 2,
        tạo ra `[A, B, X, C, D]`.

    2. `B.next` ban đầu trỏ đến `C`. Trước tiên đặt `X.next = B.next`, khiến `X` trỏ đến `C`;
        sau đó đặt `B.next = X`. Kết quả là `A → B → X → C → D`.
        Nếu `B.next` bị ghi đè trước mà không lưu liên kết ban đầu, `C` có thể trở nên không thể truy cập được nữa.

    3. Một khi vị trí của `B` đã biết, việc chèn vào danh sách liên kết chỉ thay đổi hai liên kết và tốn thời gian $O(1)$.
        Nếu phải tìm `B` từ nút đầu trước, riêng việc tìm kiếm đó đã có thể tốn $O(n)$ thời gian.

### Sức chứa của một danh sách (list) tăng lên như thế nào

Một danh sách dựa trên mảng hiện đang chứa `[A, B, C]`, với độ dài `size = 3` và sức chứa `capacity = 4`.
Khi không còn đủ sức chứa, một mảng mới với sức chứa gấp đôi mảng cũ sẽ được tạo ra.

<!-- numbered-subquestions -->

1. Sau khi thêm `D`, độ dài và sức chứa của danh sách là bao nhiêu? Có cần mở rộng sức chứa không?
2. Khi thêm tiếp `E`, sức chứa trở thành bao nhiêu? Có bao nhiêu phần tử hiện có cần được sao chép?
3. Độ dài của mảng bên dưới không thể thay đổi. Vậy tại sao sức chứa của danh sách vẫn có vẻ như tăng lên được?

??? success "Đáp án"

    1. `D` vừa khít vào vị trí trống cuối cùng. Nội dung bây giờ là `[A, B, C, D]`,
        với `size = 4` và `capacity = 4`, nên không cần mở rộng sức chứa.

    2. Không còn vị trí trống nào khi thêm `E`, nên một mảng mới với sức chứa 8 phải được tạo ra.
        Bốn phần tử hiện có `A, B, C, D` được sao chép vào đó trước khi thêm `E`.
        Kết quả là `size = 5` và `capacity = 8`.

    3. Bản thân mảng ban đầu không tự lớn lên. Danh sách tạo ra một mảng mới lớn hơn, sao chép các phần tử hiện có sang đó,
        rồi dùng mảng mới này làm bộ lưu trữ bên dưới. Từ góc nhìn của người dùng, sức chứa đã tăng lên.

## Bài tập lập trình

### Cộng thêm 1 vào một số nguyên lớn được lưu dưới dạng mảng

Mảng `digits` lưu các chữ số thập phân của một số nguyên không âm theo thứ tự từ trái sang phải. Ví dụ, `[3, 0, 8]` biểu diễn số 308.
Số 0 được biểu diễn bằng `[0]`; với mọi đầu vào khác, chữ số đầu tiên không phải là 0.

Hãy mô phỏng phép cộng theo cột trong hệ thập phân để cộng thêm 1 vào số này, và trả về kết quả theo cùng định dạng mảng.
Bạn có thể chỉnh sửa `digits` trực tiếp. Nếu xuất hiện số nhớ mới ở đầu, bạn có thể trả về một mảng dài hơn.

??? tip "Gợi ý"

    1. Bắt đầu từ chữ số cuối cùng của mảng, giống như phép cộng theo cột thông thường
    2. Nếu chữ số hiện tại nhỏ hơn 9, cộng thêm một rồi trả về kết quả ngay
    3. Nếu chữ số hiện tại là 9, đổi nó thành 0; nếu mọi chữ số đều là 9, đặt thêm một chữ số 1 vào đầu

[LeetCode](https://leetcode.com/problems/plus-one/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Đảo ngược một danh sách liên kết đơn

Cho nút đầu `head` của một danh sách liên kết đơn. Mỗi nút chứa một giá trị và một tham chiếu `next` trỏ đến nút tiếp theo.

Hãy sử dụng cách tiếp cận lặp để đảo ngược mọi liên kết giữa các nút, và trả về nút đầu mới.
Không được tạo bất kỳ nút danh sách liên kết mới nào.

??? tip "Gợi ý"

    1. Trước tiên hãy vẽ ba nút nối tiếp nhau cùng hai con trỏ prev và cur ra giấy
    2. Trước khi thay đổi cur.next, hãy lưu lại nút next ban đầu vào nxt
    3. Sau khi đảo ngược cur.next, đặt prev = cur rồi cur = nxt để tiếp tục với nút kế tiếp trong danh sách gốc

[LeetCode](https://leetcode.com/problems/reverse-linked-list/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
