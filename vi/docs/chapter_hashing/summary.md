# Tổng kết

### Điểm lại kiến thức trọng tâm

- Với một `key` đầu vào cho trước, bảng băm có thể lấy được `value` tương ứng trong thời gian $O(1)$, hiệu quả rất cao.
- Các thao tác thường dùng với bảng băm bao gồm tra cứu, thêm cặp khóa-giá trị, xóa cặp khóa-giá trị và duyệt bảng băm.
- Hàm băm ánh xạ một `key` sang một chỉ số mảng, cho phép truy cập bucket tương ứng và lấy `value`.
- Hai khóa khác nhau có thể cho ra cùng một chỉ số mảng sau khi băm, dẫn đến kết quả tra cứu sai. Hiện tượng này được gọi là xung đột băm.
- Dung lượng bảng băm càng lớn thì xác suất xảy ra xung đột băm càng thấp. Do đó, việc mở rộng bảng băm có thể giảm bớt xung đột băm. Tương tự như việc mở rộng mảng, mở rộng bảng băm là một thao tác tốn kém.
- Hệ số tải, được định nghĩa là số phần tử chia cho số lượng bucket, phản ánh mức độ nghiêm trọng của xung đột băm và thường được dùng làm điều kiện để kích hoạt việc mở rộng bảng băm.
- Nối dây chuyền giải quyết xung đột băm bằng cách lưu tất cả các phần tử xung đột trong cùng một danh sách liên kết. Tuy nhiên, danh sách liên kết quá dài có thể làm giảm hiệu quả tra cứu, và điều này có thể được cải thiện bằng cách chuyển đổi thêm các danh sách liên kết thành cây đỏ-đen.
- Dò địa chỉ mở xử lý xung đột băm thông qua việc dò nhiều lần. Dò tuyến tính sử dụng một bước nhảy cố định nhưng không thể xóa phần tử và dễ gây ra hiện tượng dồn cụm. Băm kép (double hashing) sử dụng nhiều hàm băm để dò, giúp giảm hiện tượng dồn cụm so với dò tuyến tính nhưng lại làm tăng chi phí tính toán.
- Các ngôn ngữ lập trình khác nhau áp dụng nhiều cách cài đặt bảng băm khác nhau. Ví dụ, `HashMap` của Java dùng nối dây chuyền, trong khi `dict` của Python dùng dò địa chỉ mở.
- Đối với bảng băm, ta mong muốn giải thuật băm có tính xác định, hiệu suất cao và phân bố đều. Trong mật mã học, giải thuật băm còn cần có khả năng chống xung đột và hiệu ứng lan truyền.
- Giải thuật băm thường dùng các số nguyên tố lớn làm modulo để tối đa hóa tính phân bố đều của giá trị băm và giảm xung đột băm.
- Các giải thuật băm phổ biến bao gồm MD5, SHA-1, SHA-2 và SHA-3. MD5 thường được dùng để kiểm tra tính toàn vẹn của tệp, trong khi SHA-2 thường được dùng trong các ứng dụng và giao thức bảo mật.
- Các ngôn ngữ lập trình thường cung cấp sẵn giải thuật băm cho các kiểu dữ liệu để tính chỉ số bucket trong bảng băm. Nhìn chung, chỉ những đối tượng bất biến mới có thể băm được.

### Hỏi đáp

**Hỏi**: Khi nào thì độ phức tạp thời gian của bảng băm suy giảm xuống $O(n)$?

Độ phức tạp thời gian của bảng băm có thể suy giảm xuống $O(n)$ khi xung đột băm trở nên nghiêm trọng. Khi hàm băm được thiết kế tốt, dung lượng được thiết lập phù hợp và xung đột được phân bố đều, độ phức tạp thời gian là $O(1)$. Ta thường coi độ phức tạp thời gian là $O(1)$ khi sử dụng các bảng băm dựng sẵn trong ngôn ngữ lập trình.

**Hỏi**: Tại sao không dùng hàm băm $f(x) = x$? Như vậy sẽ loại bỏ được xung đột.

Với hàm băm $f(x) = x$, mỗi phần tử tương ứng với một chỉ số bucket duy nhất, điều này tương đương với một mảng. Tuy nhiên, không gian đầu vào thường lớn hơn nhiều so với không gian đầu ra (độ dài mảng), do đó bước cuối cùng của hàm băm thường là lấy modulo với độ dài mảng. Nói cách khác, mục tiêu của bảng băm là ánh xạ một không gian trạng thái lớn hơn sang một không gian nhỏ hơn, đồng thời vẫn đảm bảo hiệu quả tra cứu $O(1)$.

**Hỏi**: Tại sao bảng băm có thể hiệu quả hơn mảng, danh sách liên kết hay cây nhị phân, mặc dù bảng băm được cài đặt bằng chính các cấu trúc này?

Trước hết, bảng băm có hiệu quả thời gian cao hơn nhưng hiệu quả không gian thấp hơn. Một phần đáng kể bộ nhớ trong bảng băm vẫn không được sử dụng.

Thứ hai, bảng băm chỉ hiệu quả về thời gian hơn trong những trường hợp sử dụng cụ thể. Nếu một chức năng có thể được cài đặt với cùng độ phức tạp thời gian bằng mảng hoặc danh sách liên kết, thì cách đó thường nhanh hơn so với dùng bảng băm. Đó là vì việc tính toán hàm băm phát sinh chi phí, khiến hằng số trong độ phức tạp thời gian lớn hơn.

Cuối cùng, độ phức tạp thời gian của bảng băm có thể bị suy giảm. Ví dụ, trong nối dây chuyền, ta thực hiện thao tác tìm kiếm trong một danh sách liên kết hoặc cây đỏ-đen, điều này vẫn có nguy cơ suy giảm xuống thời gian $O(n)$.

**Hỏi**: Băm kép có gặp phải nhược điểm không thể xóa trực tiếp phần tử không? Không gian được đánh dấu là đã xóa có thể được tái sử dụng không?

Băm kép là một dạng của dò địa chỉ mở, và mọi phương pháp dò địa chỉ mở đều có nhược điểm là không thể xóa trực tiếp phần tử; chúng đòi hỏi phải đánh dấu phần tử là đã xóa. Các không gian đã đánh dấu có thể được tái sử dụng. Khi chèn phần tử mới vào bảng băm, nếu hàm băm trỏ đến một vị trí đã được đánh dấu là đã xóa, vị trí đó có thể được dùng cho phần tử mới. Điều này vẫn duy trì được chuỗi dò của bảng băm đồng thời đảm bảo sử dụng không gian hiệu quả.

**Hỏi**: Tại sao xung đột băm lại xảy ra trong quá trình tìm kiếm khi dùng dò tuyến tính?

Trong quá trình tìm kiếm, hàm băm trỏ đến bucket và cặp khóa-giá trị tương ứng. Nếu `key` không khớp, điều đó cho thấy đã xảy ra xung đột băm. Do đó, dò tuyến tính sẽ tiếp tục tìm kiếm theo một bước nhảy định trước cho đến khi tìm được đúng cặp khóa-giá trị hoặc việc tìm kiếm thất bại.

**Hỏi**: Tại sao việc mở rộng bảng băm có thể giảm bớt xung đột băm?

Bước cuối cùng của hàm băm thường là lấy modulo với độ dài mảng $n$, để giữ giá trị đầu ra nằm trong phạm vi chỉ số mảng. Khi mở rộng, độ dài mảng $n$ thay đổi, và các chỉ số tương ứng với các khóa cũng có thể thay đổi theo. Những khóa trước đây được ánh xạ về cùng một bucket có thể được phân tán ra nhiều bucket khác nhau sau khi mở rộng, nhờ đó giảm bớt xung đột băm.

**Hỏi**: Nếu mục tiêu là truy cập hiệu quả, tại sao không dùng trực tiếp một mảng?

Khi các giá trị `key` là các số nguyên liên tiếp trong một phạm vi nhỏ, mảng quả thực là một lựa chọn đơn giản và hiệu quả. Nhưng khi `key` thuộc kiểu dữ liệu khác, chẳng hạn như chuỗi, ta cần một hàm băm để ánh xạ `key` sang một chỉ số mảng rồi lưu phần tử vào mảng bucket. Cấu trúc đó chính xác là bảng băm.
