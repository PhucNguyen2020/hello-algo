# Tổng kết

### Điểm cần ghi nhớ

- Ngăn xếp là một cấu trúc dữ liệu tuân theo nguyên tắc LIFO, có thể được triển khai bằng mảng hoặc danh sách liên kết.
- Về hiệu suất thời gian, cách triển khai ngăn xếp bằng mảng có hiệu suất trung bình cao hơn, nhưng trong quá trình mở rộng, độ phức tạp thời gian của một lần đẩy vào đơn lẻ sẽ giảm xuống thành $O(n)$. Ngược lại, cách triển khai ngăn xếp bằng danh sách liên kết mang lại hiệu suất ổn định hơn.
- Về hiệu suất không gian, cách triển khai ngăn xếp bằng mảng có thể dẫn đến lãng phí không gian ở một mức độ nào đó. Tuy nhiên, cần lưu ý rằng dung lượng bộ nhớ mà mỗi nút danh sách liên kết chiếm dụng lớn hơn so với mỗi phần tử mảng.
- Hàng đợi là một cấu trúc dữ liệu tuân theo nguyên tắc FIFO, cũng có thể được triển khai bằng mảng hoặc danh sách liên kết. Các kết luận về so sánh hiệu suất thời gian và không gian đối với hàng đợi tương tự như đối với ngăn xếp đã đề cập ở trên.
- Hàng đợi hai đầu là một loại hàng đợi có tính linh hoạt cao hơn, cho phép thêm và xóa phần tử ở cả hai đầu.

### Hỏi & Đáp

**Hỏi**: Chức năng lùi/tiến của trình duyệt có được triển khai bằng danh sách liên kết đôi không?

Hành vi lùi/tiến của trình duyệt về bản chất là một ứng dụng của "ngăn xếp." Khi người dùng truy cập một trang mới, trang đó được thêm vào đỉnh ngăn xếp; khi người dùng nhấn nút lùi, trang đó được lấy ra khỏi đỉnh ngăn xếp. Hàng đợi hai đầu có thể hỗ trợ thuận tiện một số thao tác bổ sung, như đã đề cập trong phần "Hàng đợi hai đầu."

**Hỏi**: Sau khi lấy ra khỏi ngăn xếp, ta có cần giải phóng bộ nhớ của nút vừa lấy ra không?

Nếu nút vừa lấy ra vẫn còn được cần đến về sau, thì không cần giải phóng bộ nhớ. Nếu nó sẽ không được sử dụng nữa, các ngôn ngữ như Java và Python có cơ chế thu gom rác tự động nên không cần giải phóng bộ nhớ thủ công; còn trong C và C++, cần phải giải phóng bộ nhớ thủ công.

**Hỏi**: Hàng đợi hai đầu trông giống như hai ngăn xếp ghép lại với nhau. Mục đích của nó là gì?

Hàng đợi hai đầu giống như sự kết hợp giữa ngăn xếp và hàng đợi, hay hai ngăn xếp ghép lại với nhau. Nó kết hợp logic của cả hai, nên có thể hỗ trợ tất cả các ứng dụng của ngăn xếp và hàng đợi, đồng thời mang lại sự linh hoạt cao hơn.

**Hỏi**: Chức năng hoàn tác và làm lại được triển khai cụ thể như thế nào?

Sử dụng hai ngăn xếp: ngăn xếp `A` dùng cho hoàn tác và ngăn xếp `B` dùng cho làm lại.

1. Mỗi khi người dùng thực hiện một thao tác, đẩy thao tác này vào ngăn xếp `A` và xóa sạch ngăn xếp `B`.
2. Khi người dùng thực hiện "hoàn tác," lấy thao tác gần nhất ra khỏi ngăn xếp `A` và đẩy nó vào ngăn xếp `B`.
3. Khi người dùng thực hiện "làm lại," lấy thao tác gần nhất ra khỏi ngăn xếp `B` và đẩy nó vào ngăn xếp `A`.
