# Tổng kết

### Ôn tập trọng tâm

**Đánh giá hiệu suất giải thuật**

- Hiệu suất thời gian và hiệu suất không gian là hai tiêu chí đánh giá chính để đo lường hiệu năng của giải thuật.
- Chúng ta có thể đánh giá hiệu suất giải thuật thông qua kiểm thử thực tế, nhưng rất khó loại bỏ ảnh hưởng của môi trường kiểm thử, và cách này tiêu tốn nhiều tài nguyên tính toán.
- Phân tích độ phức tạp có thể khắc phục những hạn chế của phương pháp kiểm thử thực tế. Kết quả của nó áp dụng được trên mọi nền tảng chạy, và có thể tiết lộ hiệu suất giải thuật ở các quy mô dữ liệu khác nhau.

**Độ phức tạp thời gian**

- Độ phức tạp thời gian được dùng để đo xu hướng thay đổi của thời gian chạy giải thuật khi khối lượng dữ liệu tăng lên. Nó có thể đánh giá hiệu quả hiệu suất giải thuật, nhưng trong một số trường hợp có thể kém tin cậy, chẳng hạn khi khối lượng dữ liệu đầu vào nhỏ hoặc khi độ phức tạp thời gian giống nhau, khiến việc so sánh chính xác hiệu suất giải thuật trở nên bất khả thi.
- Độ phức tạp thời gian trường hợp xấu nhất được biểu diễn bằng ký hiệu Big $O$, tương ứng với cận trên tiệm cận của một hàm số, phản ánh mức độ tăng trưởng của số lượng thao tác $T(n)$ khi $n$ tiến đến dương vô cùng.
- Việc suy ra độ phức tạp thời gian gồm hai bước: đầu tiên đếm số lượng thao tác, sau đó xác định cận trên tiệm cận.
- Các độ phức tạp thời gian phổ biến, sắp xếp từ thấp đến cao, gồm $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, và $O(n!)$.
- Độ phức tạp thời gian của một số giải thuật không cố định, mà phụ thuộc vào sự phân bố của dữ liệu đầu vào. Độ phức tạp thời gian được chia thành độ phức tạp thời gian trường hợp xấu nhất, tốt nhất và trung bình. Độ phức tạp thời gian trường hợp tốt nhất hiếm khi được sử dụng, vì dữ liệu đầu vào thường phải thỏa mãn những điều kiện rất ngặt nghèo mới đạt được trường hợp tốt nhất.
- Độ phức tạp thời gian trung bình phản ánh hiệu suất chạy của giải thuật với dữ liệu đầu vào ngẫu nhiên, và gần sát nhất với hiệu năng thực tế của giải thuật trong ứng dụng thực tiễn. Việc tính độ phức tạp thời gian trung bình đòi hỏi phải phân tích phân bố dữ liệu đầu vào cùng kỳ vọng toán học tương ứng.

**Độ phức tạp không gian**

- Độ phức tạp không gian có vai trò tương tự độ phức tạp thời gian, được dùng để đo xu hướng thay đổi mức sử dụng bộ nhớ của giải thuật khi khối lượng dữ liệu tăng lên.
- Bộ nhớ liên quan đến việc thực thi giải thuật có thể chia thành không gian đầu vào, không gian tạm thời và không gian đầu ra. Thông thường, không gian đầu vào không được tính vào độ phức tạp không gian. Không gian tạm thời có thể chia thành dữ liệu tạm thời, không gian khung ngăn xếp và không gian lệnh, trong đó không gian khung ngăn xếp thường chỉ ảnh hưởng đến độ phức tạp không gian trong các hàm đệ quy.
- Chúng ta thường chỉ quan tâm đến độ phức tạp không gian trường hợp xấu nhất, tức là độ phức tạp không gian của một giải thuật với dữ liệu đầu vào xấu nhất và thời điểm chạy tệ nhất.
- Các độ phức tạp không gian phổ biến, sắp xếp từ thấp đến cao, gồm $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$, và $O(2^n)$.

### Hỏi & Đáp

**Hỏi**: Độ phức tạp không gian của đệ quy đuôi có phải là $O(1)$ không?

Về mặt lý thuyết, độ phức tạp không gian của các hàm đệ quy đuôi có thể được tối ưu xuống $O(1)$. Tuy nhiên, phần lớn các ngôn ngữ lập trình (như Java, Python, C++, Go, C#, v.v.) không hỗ trợ tối ưu hóa đệ quy đuôi tự động, nên độ phức tạp không gian thường được xem là $O(n)$.

**Hỏi**: Sự khác biệt giữa thuật ngữ hàm (function) và phương thức (method) là gì?

Một <u>hàm</u> có thể được thực thi độc lập, với tất cả tham số được truyền vào một cách tường minh. Một <u>phương thức</u> gắn liền với một đối tượng, được liên kết ngầm định với đối tượng đã gọi nó, và có thể thao tác trên dữ liệu chứa trong các thực thể (instance) của lớp.

Các ví dụ dưới đây sử dụng một số ngôn ngữ lập trình phổ biến để minh họa.

- C là một ngôn ngữ lập trình thủ tục không có khái niệm hướng đối tượng, nên nó chỉ có hàm. Tuy nhiên, ta có thể mô phỏng lập trình hướng đối tượng bằng cách tạo các cấu trúc (struct), và các hàm gắn liền với cấu trúc tương đương với phương thức trong các ngôn ngữ lập trình khác.
- Java và C# là các ngôn ngữ lập trình hướng đối tượng, trong đó các khối mã (phương thức) thường là một phần của lớp. Các phương thức tĩnh hoạt động giống như hàm vì chúng gắn với lớp và không thể truy cập các biến thực thể cụ thể.
- C++ và Python hỗ trợ cả lập trình thủ tục (hàm) lẫn lập trình hướng đối tượng (phương thức).

**Hỏi**: Biểu đồ về "các loại độ phức tạp không gian phổ biến" có phản ánh kích thước tuyệt đối của không gian chiếm dụng không?

Không, biểu đồ thể hiện độ phức tạp không gian, phản ánh xu hướng tăng trưởng chứ không phải kích thước tuyệt đối của không gian chiếm dụng.

Giả sử $n = 8$, bạn có thể thấy rằng giá trị của mỗi đường cong không khớp với các hàm tương ứng. Điều này là do mỗi đường cong chứa một hằng số dùng để nén phạm vi giá trị vào một khoảng dễ nhìn hơn.

Trong thực tế, vì ta thường không biết được chi phí "hằng số" của từng phương pháp, nên ta thường không thể chỉ dựa vào độ phức tạp để chọn ra giải pháp tối ưu cho các trường hợp như $n = 8$. Nhưng với $n = 8^5$, việc lựa chọn lại trở nên rõ ràng, vì lúc này xu hướng tăng trưởng đã chiếm ưu thế.

**Hỏi**: Có trường hợp nào mà giải thuật được thiết kế để hy sinh thời gian (hoặc không gian) tùy theo tình huống sử dụng thực tế không?

Trong các ứng dụng thực tiễn, phần lớn trường hợp lựa chọn hy sinh không gian để đổi lấy thời gian. Ví dụ, với chỉ mục cơ sở dữ liệu, ta thường chọn xây dựng cây B+ hoặc chỉ mục băm (hash index), chiếm dụng lượng lớn bộ nhớ để đổi lấy truy vấn hiệu quả với độ phức tạp $O(\log n)$ hoặc thậm chí $O(1)$.

Trong các tình huống mà tài nguyên không gian quý giá, thời gian có thể bị hy sinh để đổi lấy không gian. Ví dụ, trong phát triển hệ thống nhúng, bộ nhớ thiết bị rất quý giá, kỹ sư có thể từ bỏ việc sử dụng bảng băm và chọn tìm kiếm tuần tự trên mảng để tiết kiệm bộ nhớ, đánh đổi bằng tốc độ tìm kiếm chậm hơn.
