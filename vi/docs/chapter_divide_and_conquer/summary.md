# Tổng kết

### Điểm cần ghi nhớ

- Chia để trị là một chiến lược thiết kế thuật toán phổ biến, gồm hai giai đoạn chia (phân tách) và trị (hợp nhất), thường được triển khai bằng đệ quy.
- Tiêu chí để xác định một bài toán có phải là bài toán chia để trị hay không bao gồm: bài toán có thể phân rã được không, các bài toán con có độc lập với nhau không, và các bài toán con có thể hợp nhất được không.
- Sắp xếp trộn là một ứng dụng điển hình của chiến lược chia để trị. Nó chia đệ quy một mảng thành hai mảng con có độ dài bằng nhau cho đến khi chỉ còn một phần tử, sau đó hợp nhất chúng theo từng tầng để hoàn thành việc sắp xếp.
- Việc áp dụng chiến lược chia để trị thường có thể cải thiện hiệu quả thuật toán. Một mặt, nó giảm số lượng thao tác; mặt khác, nó giúp việc tối ưu hóa song song của hệ thống trở nên dễ dàng hơn.
- Chia để trị có thể giải quyết nhiều bài toán thuật toán và cũng được sử dụng rộng rãi trong thiết kế cấu trúc dữ liệu và thuật toán, khiến nó trở nên phổ biến khắp nơi.
- So với tìm kiếm vét cạn, tìm kiếm thích ứng hiệu quả hơn. Các thuật toán tìm kiếm có độ phức tạp thời gian $O(\log n)$ thường được triển khai dựa trên chiến lược chia để trị.
- Tìm kiếm nhị phân là một ứng dụng điển hình khác của chia để trị. Nó không bao gồm bước hợp nhất lời giải của các bài toán con. Ta có thể triển khai tìm kiếm nhị phân thông qua chia để trị đệ quy.
- Trong bài toán xây dựng cây nhị phân, việc xây dựng cây (bài toán gốc) có thể được chia thành xây dựng cây con trái và cây con phải (các bài toán con), điều này có thể đạt được bằng cách chia khoảng chỉ số của dãy duyệt trước và duyệt giữa.
- Trong bài toán tháp Hà Nội, một bài toán có kích thước $n$ có thể được chia thành hai bài toán con kích thước $n-1$ và một bài toán con kích thước $1$. Sau khi giải ba bài toán con này theo đúng thứ tự, bài toán gốc được giải quyết.
