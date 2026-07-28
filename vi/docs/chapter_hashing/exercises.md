# Bài tập

## Ôn tập khái niệm

### Tìm kiếm sau khi xảy ra xung đột băm

Một bảng băm có 5 ngăn (bucket) và dùng hàm băm $h(x)=x \bmod 5$. Khi xảy ra xung đột, các phần tử được đặt nối tiếp nhau trong một danh sách bên trong ngăn đó.
Chèn `[1, 6, 11, 7]` theo thứ tự:

<!-- numbered-subquestions -->

1. Viết nội dung của các ngăn 0–4.
2. Khi tìm kiếm 6, ngăn nào được kiểm tra trước, và các phần tử nào được xem xét theo thứ tự?
3. Dựa trên nội dung các ngăn ở Câu 1, các lần chèn sau có ghi đè lên các lần chèn trước không? Hãy giải thích bằng phương pháp giải quyết xung đột này.

??? success "Đáp án"

    1. Vì $1\bmod5=6\bmod5=11\bmod5=1$, trong khi $7\bmod5=2$, các ngăn là:

        ```text
        0: []
        1: [1, 6, 11]
        2: [7]
        3: []
        4: []
        ```

    2. Việc tìm kiếm 6 trước tiên đến ngăn 1, sau đó so sánh lần lượt 1 và 6. Mục tiêu được tìm thấy ở lần so sánh thứ hai.

    3. Các giá trị băm bằng nhau chỉ có nghĩa là các phần tử đi vào cùng một ngăn, không có nghĩa là các phần tử bằng nhau. Phương pháp nối chuỗi (separate chaining) giữ mọi phần tử xung đột trong ngăn
        và so sánh chúng lần lượt khi tìm kiếm, nên 1, 6 và 11 không ghi đè lên nhau.

### Các phần tử đi đâu sau khi bảng băm mở rộng?

Một bảng băm dùng phương pháp nối chuỗi ban đầu có 5 ngăn và hàm băm $h(x)=x\bmod5$.
Các khóa `[1, 6, 11]` đều nằm trong ngăn 1.

Bây giờ bảng được mở rộng lên 7 ngăn, và hàm băm trở thành $h(x)=x\bmod7$:

<!-- numbered-subquestions -->

1. Tính số hiệu ngăn mới cho 1, 6, và 11.
2. Những ngăn nào chứa phần tử sau khi mở rộng?
3. Trong quá trình mở rộng, danh sách từ ngăn 1 cũ có thể đơn giản được sao chép sang ngăn 1 mới không? Hãy giải thích bằng kết quả từ Câu 1 và Câu 2.

??? success "Đáp án"

    1. Các số hiệu ngăn mới là:

        - $1\bmod7=1$;
        - $6\bmod7=6$;
        - $11\bmod7=4$.

    2. Ngăn 1 lưu 1, ngăn 4 lưu 11, và ngăn 6 lưu 6. Ba khóa này không còn dồn vào cùng một ngăn nữa.

    3. Danh sách không thể sao chép nguyên trạng. Số hiệu ngăn được tính bằng cách lấy khóa modulo số lượng ngăn. Khi số ngăn thay đổi từ 5 sang 7, số hiệu ngăn của một khóa có thể thay đổi,
        nên vị trí của mọi khóa phải được tính lại. Nếu ngăn 1 cũ được sao chép nguyên trạng, các lần tìm kiếm sau đó dùng công thức mới sẽ tìm 6 ở ngăn 6 và 11 ở ngăn 4
        và sẽ không tìm thấy chúng.

### 11 còn tìm thấy được sau khi xóa 6 không?

Một bảng băm có 5 vị trí với chỉ số `0–4` và dùng hàm băm $h(x)=x\bmod5$.
Khi xảy ra xung đột, nó tìm sang phải từ chỉ số được hàm băm tạo ra cho đến vị trí trống đầu tiên.

Chèn `[1, 6, 11]` theo thứ tự:

<!-- numbered-subquestions -->

1. Mỗi số cuối cùng được lưu ở chỉ số nào?
2. Khi tìm kiếm 11, những chỉ số nào được xem xét theo thứ tự?
3. Giả sử việc xóa 6 chuyển trực tiếp vị trí của nó thành "vị trí trống chưa từng dùng," và việc tìm kiếm dừng lại bất cứ khi nào gặp một vị trí trống.
    Điều gì xảy ra khi tìm kiếm 11 sau đó? Kết quả tìm kiếm này có đúng không? Nếu có vấn đề, làm sao để tránh?

??? success "Đáp án"

    1. Số 1 được lưu ở chỉ số 1. Số 6 cũng ánh xạ tới chỉ số 1, nên sau khi xung đột nó được lưu ở chỉ số 2.
        Số 11 cũng bắt đầu ở chỉ số 1, bỏ qua các chỉ số 1 và 2 đã bị chiếm, và cuối cùng được lưu ở chỉ số 3.

    2. Việc tìm kiếm 11 xem xét các chỉ số `1, 2, 3` theo thứ tự và tìm thấy nó ở chỉ số 3.

    3. Nếu chỉ số 2 bị đổi thành nghĩa "chưa từng dùng," việc tìm kiếm 11 sẽ kiểm tra chỉ số 1 rồi dừng lại ở chỉ số 2,
        kết luận sai rằng 11 không tồn tại. Việc xóa nên để lại một dấu "đã xóa."
        Khi tìm kiếm gặp dấu này, nó nên tiếp tục sang chỉ số kế tiếp (quay vòng từ chỉ số 4 về chỉ số 0), trong khi một lần chèn sau đó vẫn có thể tái sử dụng vị trí này.

## Bài tập lập trình

### So sánh số lượng ký tự của hai chuỗi

Cho hai chuỗi `s` và `t` chỉ chứa các chữ cái tiếng Anh viết thường,
bạn có thể sắp xếp lại các ký tự trong `s` theo bất kỳ thứ tự nào, nhưng không được thêm, xóa, hoặc thay thế ký tự.

Xác định xem chuỗi sau khi sắp xếp lại có thể tạo thành `t` hay không. Trả về `true` nếu có thể và `false` nếu không.
Hãy dùng một bảng băm để ghi lại số lần xuất hiện của mỗi chữ cái. Không sắp xếp các ký tự trong chuỗi.

??? tip "Gợi ý"

    1. Nếu hai chuỗi có độ dài khác nhau, chúng không thể chứa mỗi ký tự với số lần bằng nhau
    2. Dùng một bảng băm để ghi lại số lần của mỗi chữ cái; tăng số đếm tương ứng khi duyệt s
    3. Giảm số đếm tương ứng khi duyệt t; hai chuỗi chứa mỗi ký tự với số lần bằng nhau chỉ khi mọi số đếm đều bằng 0 ở cuối

[LeetCode](https://leetcode.com/problems/valid-anagram/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
