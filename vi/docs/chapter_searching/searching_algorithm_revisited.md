# Nhìn lại các thuật toán tìm kiếm

<u>Thuật toán tìm kiếm</u> được dùng để tìm một hoặc một nhóm phần tử thỏa mãn điều kiện cụ thể trong các cấu trúc dữ liệu (như mảng, danh sách liên kết, cây hoặc đồ thị).

Thuật toán tìm kiếm có thể được chia thành hai loại dựa trên cách tiếp cận triển khai:

- **Xác định vị trí phần tử mục tiêu bằng cách duyệt qua cấu trúc dữ liệu**, chẳng hạn như duyệt mảng, danh sách liên kết, cây và đồ thị.
- **Đạt được khả năng tra cứu phần tử hiệu quả bằng cách tận dụng cách dữ liệu được tổ chức hoặc thông tin đã biết trước về dữ liệu**, chẳng hạn như tìm kiếm nhị phân, tìm kiếm dựa trên bảng băm và tìm kiếm trên cây tìm kiếm nhị phân.

Vì những chủ đề này đã được giới thiệu ở các chương trước, các thuật toán tìm kiếm hẳn đã trở nên quen thuộc với chúng ta. Trong mục này, chúng ta sẽ nhìn lại chúng từ một góc độ hệ thống hơn.

## Tìm kiếm vét cạn

Tìm kiếm vét cạn xác định vị trí phần tử mục tiêu bằng cách duyệt qua từng phần tử của cấu trúc dữ liệu.

- "Tìm kiếm tuyến tính" áp dụng cho các cấu trúc dữ liệu tuyến tính như mảng và danh sách liên kết. Nó bắt đầu từ một đầu của cấu trúc dữ liệu và truy cập lần lượt từng phần tử cho đến khi tìm thấy phần tử mục tiêu hoặc đến đầu còn lại mà không tìm thấy.
- "Tìm kiếm theo chiều rộng" và "tìm kiếm theo chiều sâu" là hai chiến lược duyệt cho đồ thị và cây. Tìm kiếm theo chiều rộng bắt đầu từ nút khởi đầu và tìm kiếm theo từng lớp, thăm các nút từ gần đến xa. Tìm kiếm theo chiều sâu bắt đầu từ nút khởi đầu, đi theo một đường dẫn đến cuối, rồi quay lui và thử các đường khác cho đến khi duyệt hết toàn bộ cấu trúc dữ liệu.

Ưu điểm của tìm kiếm vét cạn là đơn giản và có tính tổng quát cao, **không đòi hỏi tiền xử lý dữ liệu hay cấu trúc dữ liệu bổ sung**.

Tuy nhiên, **độ phức tạp thời gian của các thuật toán này là $O(n)$**, với $n$ là số lượng phần tử, nên hiệu suất kém khi xử lý lượng dữ liệu lớn.

## Tìm kiếm thích ứng

Tìm kiếm thích ứng tận dụng các đặc tính vốn có của dữ liệu (như thứ tự đã sắp xếp) để tối ưu hóa quá trình tìm kiếm và xác định vị trí phần tử mục tiêu hiệu quả hơn.

- "Tìm kiếm nhị phân" sử dụng tính có thứ tự của dữ liệu để đạt được khả năng tìm kiếm hiệu quả, chỉ áp dụng cho mảng.
- "Tìm kiếm dựa trên bảng băm" sử dụng bảng băm để lưu trữ dữ liệu có thể tìm kiếm dưới dạng cặp khóa-giá trị, từ đó cho phép truy vấn hiệu quả.
- "Tìm kiếm trên cây" hoạt động trên các cấu trúc cây cụ thể (như cây tìm kiếm nhị phân), nhanh chóng loại bỏ các nút bằng cách so sánh giá trị nút để xác định vị trí phần tử mục tiêu.

Ưu điểm của các thuật toán này là hiệu suất cao, **với độ phức tạp thời gian đạt $O(\log n)$ hoặc thậm chí $O(1)$**.

Tuy nhiên, **việc sử dụng các thuật toán này thường đòi hỏi tiền xử lý dữ liệu**. Ví dụ, tìm kiếm nhị phân yêu cầu sắp xếp trước mảng, trong khi tìm kiếm dựa trên bảng băm và tìm kiếm trên cây đều cần thêm cấu trúc dữ liệu, và việc duy trì các cấu trúc dữ liệu này cũng đòi hỏi thêm chi phí thời gian và không gian.

!!! tip

    Các thuật toán tìm kiếm thích ứng thường được gọi là thuật toán tra cứu, **chủ yếu được dùng để nhanh chóng truy xuất phần tử mục tiêu trong các cấu trúc dữ liệu cụ thể**.

## Lựa chọn phương pháp tìm kiếm

Với một tập dữ liệu có kích thước $n$, chúng ta có thể sử dụng tìm kiếm tuyến tính, tìm kiếm nhị phân, tìm kiếm trên cây, tìm kiếm dựa trên bảng băm và các phương pháp khác để tìm phần tử mục tiêu. Nguyên lý hoạt động của mỗi phương pháp được minh họa trong hình dưới đây.

![Nhiều chiến lược tìm kiếm khác nhau](searching_algorithm_revisited.assets/searching_algorithms.png)

Hiệu suất và đặc điểm của các phương pháp này được tóm tắt trong bảng dưới đây.

<p align="center"> Bảng <id> &nbsp; So sánh hiệu suất các thuật toán tìm kiếm </p>

|                       | Tìm kiếm tuyến tính | Tìm kiếm nhị phân      | Tìm kiếm trên cây             | Tìm kiếm bảng băm             |
| --------------------- | -------------------- | ----------------------- | ------------------------------ | ------------------------------- |
| Tìm phần tử           | $O(n)$                | $O(\log n)$              | $O(\log n)$                     | $O(1)$                          |
| Chèn phần tử          | $O(1)$                | $O(n)$                   | $O(\log n)$                     | $O(1)$                          |
| Xóa phần tử           | $O(n)$                | $O(n)$                   | $O(\log n)$                     | $O(1)$                          |
| Không gian phụ trội   | $O(1)$                | $O(1)$                   | $O(n)$                          | $O(n)$                          |
| Tiền xử lý dữ liệu    | /                     | Sắp xếp $O(n \log n)$    | Xây dựng cây $O(n \log n)$      | Xây dựng bảng băm $O(n)$        |
| Dữ liệu có thứ tự     | Không có thứ tự       | Có thứ tự                | Có thứ tự                       | Không có thứ tự                 |

Việc lựa chọn thuật toán tìm kiếm còn phụ thuộc vào khối lượng dữ liệu, yêu cầu về hiệu suất tìm kiếm, tần suất truy vấn và cập nhật dữ liệu, v.v.

**Tìm kiếm tuyến tính**

- Tính tổng quát tốt, không đòi hỏi thao tác tiền xử lý dữ liệu. Nếu chúng ta chỉ cần truy vấn dữ liệu một lần, việc tiền xử lý cần thiết cho ba phương pháp còn lại có thể tốn nhiều thời gian hơn cả bản thân tìm kiếm tuyến tính.
- Phù hợp với khối lượng dữ liệu nhỏ, nơi độ phức tạp thời gian ít ảnh hưởng đến hiệu suất.
- Phù hợp với các tình huống có tần suất cập nhật dữ liệu cao, vì phương pháp này không đòi hỏi bảo trì thêm dữ liệu nào.

**Tìm kiếm nhị phân**

- Phù hợp với tập dữ liệu lớn, hiệu suất ổn định với độ phức tạp thời gian trong trường hợp xấu nhất là $O(\log n)$.
- Khối lượng dữ liệu không thể quá lớn, vì việc lưu trữ mảng đòi hỏi không gian bộ nhớ liên tục.
- Không phù hợp với các tình huống chèn và xóa dữ liệu thường xuyên, vì việc duy trì một mảng có thứ tự có chi phí cao.

**Tìm kiếm dựa trên bảng băm**

- Phù hợp với các tình huống yêu cầu hiệu suất truy vấn cao, với độ phức tạp thời gian trung bình là $O(1)$.
- Không phù hợp với các tình huống cần dữ liệu có thứ tự hoặc tìm kiếm theo khoảng, vì bảng băm không thể duy trì dữ liệu theo thứ tự sắp xếp.
- Phụ thuộc nhiều vào hàm băm và chiến lược xử lý va chạm băm, với nguy cơ suy giảm hiệu suất đáng kể.
- Không phù hợp với khối lượng dữ liệu quá lớn, vì bảng băm cần thêm không gian để giảm thiểu va chạm và từ đó đảm bảo hiệu suất truy vấn tốt.

**Tìm kiếm trên cây**

- Phù hợp với các tập dữ liệu khổng lồ, vì các nút cây được lưu trữ không liên tục trong bộ nhớ.
- Phù hợp với các tình huống cần duy trì dữ liệu có thứ tự hoặc thực hiện tìm kiếm theo khoảng.
- Trong quá trình liên tục chèn và xóa nút, cây tìm kiếm nhị phân có thể trở nên lệch, khiến độ phức tạp thời gian suy giảm xuống $O(n)$.
- Nếu sử dụng cây AVL hoặc cây đỏ-đen, mọi thao tác đều có thể chạy ổn định trong thời gian $O(\log n)$, mặc dù việc duy trì sự cân bằng của cây phát sinh thêm chi phí.
