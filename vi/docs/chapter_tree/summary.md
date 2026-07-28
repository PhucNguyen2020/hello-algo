# Tổng kết

### Điểm cần ghi nhớ

- Cây nhị phân là một cấu trúc dữ liệu phi tuyến tính thể hiện logic chia để trị theo hướng phân đôi. Mỗi nút của cây nhị phân chứa một giá trị và hai con trỏ, trỏ đến nút con trái và nút con phải của nó.
- Đối với một nút nhất định trong cây nhị phân, cây được hình thành bởi nút con trái (phải) của nó và tất cả các nút bên dưới được gọi là cây con trái (phải) của nút đó.
- Các thuật ngữ liên quan đến cây nhị phân bao gồm nút gốc, nút lá, tầng, bậc, cạnh, chiều cao và độ sâu.
- Các thao tác khởi tạo, chèn nút và xóa nút của cây nhị phân tương tự như các thao tác của danh sách liên kết.
- Các loại cây nhị phân phổ biến bao gồm cây nhị phân hoàn hảo, cây nhị phân hoàn chỉnh, cây nhị phân đầy đủ và cây nhị phân cân bằng. Cây nhị phân hoàn hảo là dạng lý tưởng, trong khi danh sách liên kết đại diện cho trường hợp suy biến xấu nhất.
- Cây nhị phân có thể được biểu diễn bằng mảng bằng cách sắp xếp các giá trị nút và các ô trống theo thứ tự duyệt theo tầng, và triển khai con trỏ dựa trên mối quan hệ ánh xạ chỉ số giữa nút cha và nút con.
- Duyệt theo tầng của cây nhị phân là một phương pháp tìm kiếm theo chiều rộng, tiến hành theo từng tầng, thường được triển khai bằng hàng đợi.
- Duyệt trước, duyệt giữa và duyệt sau đều thuộc loại tìm kiếm theo chiều sâu, tiến hành bằng cách đi càng sâu càng tốt trước khi quay lui, thường sử dụng đệ quy.
- Cây tìm kiếm nhị phân là một cấu trúc dữ liệu hiệu quả để tìm kiếm phần tử, với các thao tác tìm kiếm, chèn và xóa đều có độ phức tạp thời gian $O(\log n)$. Khi cây tìm kiếm nhị phân suy biến thành danh sách liên kết, tất cả các độ phức tạp thời gian suy giảm thành $O(n)$.
- Cây AVL, còn được gọi là cây tìm kiếm nhị phân cân bằng, đảm bảo cây luôn duy trì trạng thái cân bằng sau các lần chèn và xóa nút liên tục thông qua các thao tác xoay.
- Các thao tác xoay trong cây AVL bao gồm xoay phải, xoay trái, xoay phải sau đó xoay trái, và xoay trái sau đó xoay phải. Sau khi chèn hoặc xóa nút, cây AVL thực hiện các thao tác xoay từ dưới lên trên để khôi phục trạng thái cân bằng.

### Hỏi & Đáp

**Hỏi**: Đối với cây nhị phân chỉ có một nút, chiều cao của cây và độ sâu của nút gốc có đều bằng $0$ không?

Đúng vậy, vì chiều cao và độ sâu thường được định nghĩa là số lượng cạnh trên đường đi.

**Hỏi**: Việc chèn và xóa trong cây nhị phân thường được hoàn thành bởi "một nhóm thao tác". "Một nhóm thao tác" ở đây đề cập đến điều gì? Nó có ngụ ý việc giải phóng tài nguyên của các nút con không?

Lấy cây tìm kiếm nhị phân làm ví dụ, thao tác xóa một nút cần được xử lý trong ba tình huống khác nhau, mỗi tình huống yêu cầu nhiều bước thao tác nút.

**Hỏi**: Tại sao việc duyệt DFS của cây nhị phân có ba thứ tự: duyệt trước, duyệt giữa và duyệt sau, và công dụng của chúng là gì?

Tương tự như duyệt xuôi và duyệt ngược của mảng, duyệt trước, duyệt giữa và duyệt sau là ba phương pháp duyệt cây nhị phân cho phép ta thu được kết quả duyệt theo một thứ tự cụ thể. Ví dụ, trong cây tìm kiếm nhị phân, vì các nút thỏa mãn quan hệ `giá trị nút con trái < giá trị nút gốc < giá trị nút con phải`, ta chỉ cần duyệt cây theo thứ tự ưu tiên "trái $\rightarrow$ gốc $\rightarrow$ phải" để thu được một dãy nút có thứ tự.

**Hỏi**: Trong thao tác xoay phải xử lý mối quan hệ giữa các nút mất cân bằng `node`, `child` và `grand_child`, liệu kết nối giữa `node` và nút cha của nó có bị mất sau khi xoay phải không?

Ta cần nhìn nhận vấn đề này từ góc độ đệ quy. Thao tác xoay phải `right_rotate(root)` nhận vào nút gốc của cây con và cuối cùng trả về nút gốc của cây con sau khi xoay bằng `return child`. Việc kết nối nút gốc của cây con với nút cha của nó được hoàn thành sau khi hàm trả về, việc này không nằm trong phạm vi duy trì của thao tác xoay phải.

**Hỏi**: Trong C++, các hàm được chia thành các phần `private` và `public`. Có những cân nhắc nào cho việc này? Tại sao hàm `height()` và hàm `updateHeight()` lần lượt được đặt trong `public` và `private`?

Điều này chủ yếu phụ thuộc vào phạm vi sử dụng của phương thức. Nếu một phương thức chỉ được sử dụng trong nội bộ lớp, thì nó được thiết kế là `private`. Ví dụ, việc người dùng tự gọi `updateHeight()` một mình là vô nghĩa, vì nó chỉ là một bước trong thao tác chèn hoặc xóa. Tuy nhiên, `height()` được dùng để truy cập chiều cao nút, tương tự như `vector.size()`, nên nó được đặt là `public` để tiện sử dụng.

**Hỏi**: Làm thế nào để xây dựng một cây tìm kiếm nhị phân từ một tập dữ liệu đầu vào? Việc lựa chọn nút gốc có quan trọng không?

Có, phương pháp xây dựng cây được cung cấp trong hàm `build_tree()` trong mã nguồn cây tìm kiếm nhị phân. Còn về việc lựa chọn nút gốc, ta thường sắp xếp dữ liệu đầu vào, sau đó chọn phần tử ở giữa làm nút gốc, và đệ quy xây dựng cây con trái và cây con phải. Cách tiếp cận này giúp tối đa hóa tính cân bằng của cây.

**Hỏi**: Trong Java, ta có luôn phải sử dụng phương thức `equals()` để so sánh chuỗi không?

Trong Java, đối với các kiểu dữ liệu nguyên thủy, `==` được dùng để so sánh xem giá trị của hai biến có bằng nhau không. Đối với các kiểu tham chiếu, nguyên lý hoạt động của hai ký hiệu này khác nhau.

- `==`: Dùng để so sánh xem hai biến có trỏ đến cùng một đối tượng hay không, tức là vị trí của chúng trong bộ nhớ có giống nhau không.
- `equals()`: Dùng để so sánh xem giá trị của hai đối tượng có bằng nhau không.

Do đó, nếu ta muốn so sánh giá trị, ta nên dùng `equals()`. Tuy nhiên, các chuỗi được khởi tạo qua `String a = "hi"; String b = "hi";` được lưu trong vùng hằng chuỗi (string constant pool) và trỏ đến cùng một đối tượng, nên `a == b` cũng có thể được dùng để so sánh nội dung của hai chuỗi.

**Hỏi**: Trước khi đạt đến tầng cuối cùng, số lượng nút trong hàng đợi có phải là $2^h$ trong duyệt theo chiều rộng không?

Đúng vậy, ví dụ, một cây nhị phân hoàn hảo có chiều cao $h = 2$ có tổng cộng $n = 7$ nút, thì tầng cuối cùng có $4 = 2^h = (n + 1) / 2$ nút.
