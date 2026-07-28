# Tổng kết

### Ôn tập trọng tâm

- Đồ thị bao gồm các đỉnh và cạnh, có thể được biểu diễn dưới dạng một tập đỉnh và một tập cạnh.
- So với mối quan hệ tuyến tính được mô hình hóa bởi danh sách liên kết và mối quan hệ chia để trị được mô hình hóa bởi cây, mối quan hệ dạng mạng lưới được mô hình hóa bởi đồ thị mang lại sự linh hoạt lớn hơn nhiều nên cũng phức tạp hơn.
- Trong đồ thị có hướng, các cạnh có hướng; trong đồ thị liên thông, mọi đỉnh đều có thể đến được từ bất kỳ đỉnh nào khác; và trong đồ thị có trọng số, mỗi cạnh mang một trọng số.
- Ma trận kề sử dụng ma trận để biểu diễn đồ thị, trong đó mỗi hàng (cột) đại diện cho một đỉnh, và các phần tử của ma trận đại diện cho các cạnh, dùng $1$ hoặc $0$ để biểu thị hai đỉnh có cạnh nối hay không. Ma trận kề có hiệu suất rất cao cho các thao tác thêm, xóa, tra cứu và sửa đổi, nhưng tiêu tốn nhiều không gian.
- Danh sách kề sử dụng nhiều danh sách liên kết để biểu diễn đồ thị: danh sách liên kết thứ $i$ tương ứng với đỉnh $i$ và lưu trữ tất cả các đỉnh kề với nó. So với ma trận kề, danh sách kề sử dụng ít không gian hơn, nhưng việc tra cứu cạnh kém hiệu quả hơn vì phải duyệt qua danh sách liên kết.
- Khi các danh sách liên kết trong danh sách kề trở nên quá dài, chúng có thể được chuyển đổi thành cây đỏ đen hoặc bảng băm, từ đó cải thiện hiệu suất tra cứu.
- Xét từ góc độ thuật toán, ma trận kề thể hiện nguyên tắc "đánh đổi không gian lấy thời gian", trong khi danh sách kề thể hiện nguyên tắc "đánh đổi thời gian lấy không gian".
- Đồ thị có thể được dùng để mô hình hóa nhiều hệ thống trong thực tế, chẳng hạn như mạng xã hội và tuyến tàu điện ngầm.
- Cây là một trường hợp đặc biệt của đồ thị, và việc duyệt cây là một trường hợp đặc biệt của việc duyệt đồ thị.
- Tìm kiếm theo chiều rộng trên đồ thị khám phá từ gần đến xa, mở rộng theo từng lớp, và thường được triển khai bằng hàng đợi.
- Tìm kiếm theo chiều sâu trên đồ thị đi theo một đường càng sâu càng tốt và quay lui khi không thể đi xa hơn, thường được triển khai bằng đệ quy.

### Hỏi & Đáp

**Hỏi**: Đường đi được định nghĩa là một dãy các đỉnh hay một dãy các cạnh?

Định nghĩa trong các phiên bản ngôn ngữ khác nhau của Wikipedia không nhất quán: phiên bản tiếng Anh nói rằng "đường đi là một dãy các cạnh", trong khi phiên bản tiếng Trung nói rằng "đường đi là một dãy các đỉnh". Nguyên văn tiếng Anh như sau: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

Trong tài liệu này, đường đi được xem là một dãy các cạnh, không phải một dãy các đỉnh. Điều này là vì có thể có nhiều cạnh nối giữa hai đỉnh, trong trường hợp đó mỗi cạnh tương ứng với một đường đi.

**Hỏi**: Trong đồ thị không liên thông, liệu có tồn tại các đỉnh không thể đến được không?

Trong đồ thị không liên thông, nếu xuất phát từ một đỉnh, sẽ có ít nhất một đỉnh khác không thể đến được. Để duyệt một đồ thị không liên thông, ta cần nhiều điểm xuất phát sao cho tất cả các thành phần liên thông đều được bao phủ.

**Hỏi**: Trong danh sách kề, có yêu cầu thứ tự nào đối với các đỉnh kề của một đỉnh cho trước không?

Chúng có thể xuất hiện theo bất kỳ thứ tự nào. Tuy nhiên, trong thực tế, chúng có thể cần được sắp xếp theo các quy tắc cụ thể, chẳng hạn như thứ tự các đỉnh được thêm vào hoặc thứ tự giá trị của đỉnh, điều này giúp ích khi cần nhanh chóng tìm ra đỉnh có giá trị cực trị nào đó.
