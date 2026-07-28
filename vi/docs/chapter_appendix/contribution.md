# Cùng nhau đóng góp

Do năng lực còn hạn chế, cuốn sách này khó tránh khỏi những thiếu sót và sai lầm. Chúng tôi rất mong nhận được sự thông cảm và biết ơn sự giúp đỡ của bạn trong việc sửa chữa chúng. Nếu bạn phát hiện lỗi chính tả, liên kết hỏng, nội dung còn thiếu, câu chữ mơ hồ, giải thích chưa rõ ràng hoặc vấn đề về cấu trúc, xin hãy giúp chúng tôi sửa chữa để mang lại nguồn tài liệu học tập chất lượng cao hơn cho độc giả.

GitHub ID của tất cả [người đóng góp](https://github.com/krahets/hello-algo/graphs/contributors) sẽ được hiển thị trên trang chủ của kho mã nguồn sách, phiên bản web và phiên bản PDF nhằm ghi nhận những đóng góp vô tư của họ cho cộng đồng mã nguồn mở.

!!! success "Sức hấp dẫn của mã nguồn mở"

    Khoảng thời gian giữa hai lần tái bản của một cuốn sách giấy thường khá dài, khiến việc cập nhật nội dung trở nên rất bất tiện.

    Trong cuốn sách mã nguồn mở này, thời gian cập nhật nội dung đã được rút ngắn xuống chỉ còn vài ngày, thậm chí vài giờ.

### Điều chỉnh nội dung nhỏ

Như hình dưới đây, ở góc trên bên phải mỗi trang có một "biểu tượng chỉnh sửa". Bạn có thể sửa văn bản hoặc mã nguồn bằng cách làm theo các bước sau.

1. Nhấp vào "biểu tượng chỉnh sửa". Nếu gặp thông báo yêu cầu "Fork this repository", vui lòng đồng ý thực hiện thao tác đó.
2. Chỉnh sửa nội dung của tệp nguồn Markdown, kiểm tra tính chính xác của nội dung, và cố gắng giữ định dạng nhất quán nhất có thể.
3. Điền mô tả về các thay đổi của bạn ở cuối trang, sau đó nhấp vào nút "Propose file change". Sau khi trang mới tải xong, nhấp vào nút "Create pull request" để gửi pull request của bạn.

![Nút chỉnh sửa trang](contribution.assets/edit_markdown.png)

Hình ảnh không thể chỉnh sửa trực tiếp. Vui lòng mô tả vấn đề bằng cách tạo một [Issue](https://github.com/krahets/hello-algo/issues) mới hoặc để lại bình luận. Chúng tôi sẽ nhanh chóng vẽ lại và thay thế hình ảnh.

### Sáng tạo nội dung

Nếu bạn quan tâm đến việc đóng góp cho dự án mã nguồn mở này, bao gồm việc dịch mã nguồn sang các ngôn ngữ lập trình khác hoặc mở rộng nội dung bài viết, bạn sẽ cần tuân theo quy trình Pull Request dưới đây.

1. Đăng nhập vào GitHub và Fork [kho mã nguồn](https://github.com/krahets/hello-algo) của cuốn sách về tài khoản cá nhân của bạn.
2. Truy cập trang kho mã nguồn đã fork của bạn và dùng lệnh `git clone` để sao chép kho mã về máy tính của bạn.
3. Tạo nội dung ở máy cục bộ và thực hiện kiểm thử toàn diện để xác nhận tính đúng đắn của mã nguồn.
4. Commit các thay đổi cục bộ và đẩy chúng lên kho mã từ xa.
5. Làm mới trang web của kho mã và nhấp vào nút "Create pull request" để gửi pull request của bạn.

### Triển khai bằng Docker

Từ thư mục gốc của `hello-algo`, chạy lệnh Docker dưới đây để truy cập dự án tại `http://localhost:8000`:

```shell
docker-compose up -d
```

Sử dụng lệnh dưới đây để gỡ bỏ việc triển khai:

```shell
docker-compose down
```
