# Tổng kết

### Ôn tập trọng tâm

- Đống là một cây nhị phân hoàn chỉnh. Tùy theo tính chất mà nó thỏa mãn, đống có thể được phân thành đống lớn nhất (max-heap) hoặc đống nhỏ nhất (min-heap). Phần tử ở đỉnh của đống lớn nhất (đống nhỏ nhất) là phần tử lớn nhất (nhỏ nhất).
- Hàng đợi ưu tiên là hàng đợi trong đó các phần tử được lấy ra theo thứ tự ưu tiên, và thường được cài đặt bằng đống.
- Các thao tác phổ biến trên đống cùng độ phức tạp thời gian tương ứng bao gồm: chèn một phần tử $O(\log n)$, xóa phần tử ở đỉnh $O(\log n)$, và truy cập phần tử ở đỉnh $O(1)$.
- Cây nhị phân hoàn chỉnh rất phù hợp để biểu diễn bằng mảng, do đó ta thường dùng mảng để lưu trữ đống.
- Thao tác vun đống được dùng để duy trì tính chất của đống, và được sử dụng trong cả thao tác chèn lẫn thao tác xóa phần tử.
- Việc xây dựng đống từ $n$ phần tử đầu vào có thể được tối ưu xuống $O(n)$, hiệu quả rất cao.
- Bài toán Top-k là một bài toán giải thuật kinh điển, có thể được giải hiệu quả bằng đống, với độ phức tạp thời gian $O(n \log k)$.

### Hỏi & Đáp

**Hỏi**: Thuật ngữ "đống" (heap) trong cấu trúc dữ liệu có phải cùng một khái niệm với "heap" trong quản lý bộ nhớ không?

Đây không phải là cùng một khái niệm; chúng chỉ trùng tên gọi mà thôi. Trong hệ thống máy tính, heap là một phần của việc cấp phát bộ nhớ động, chương trình có thể sử dụng nó để lưu trữ dữ liệu khi đang chạy. Một chương trình có thể yêu cầu một lượng bộ nhớ heap nhất định để lưu trữ các cấu trúc phức tạp như đối tượng và mảng. Khi dữ liệu không còn cần thiết nữa, chương trình phải giải phóng vùng nhớ đó để tránh rò rỉ bộ nhớ. So với bộ nhớ ngăn xếp (stack), bộ nhớ heap đòi hỏi được quản lý và sử dụng cẩn thận hơn; nếu xử lý không đúng cách có thể dẫn đến các vấn đề như rò rỉ bộ nhớ hay con trỏ treo (dangling pointer).
