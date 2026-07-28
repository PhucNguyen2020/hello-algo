# Tóm tắt

### Tổng kết trọng tâm

- Mảng và danh sách liên kết là hai cấu trúc dữ liệu cơ bản, đại diện cho hai cách khác nhau để lưu trữ dữ liệu trong bộ nhớ máy tính: lưu trữ liền kề và lưu trữ phân tán. Điểm mạnh và điểm yếu của chúng bổ sung cho nhau.
- Mảng hỗ trợ truy cập ngẫu nhiên và sử dụng ít bộ nhớ hơn; tuy nhiên, việc chèn và xóa phần tử kém hiệu quả, và độ dài không thể thay đổi sau khi khởi tạo.
- Danh sách liên kết đạt được việc chèn và xóa nút hiệu quả bằng cách thay đổi các tham chiếu (con trỏ), và có thể linh hoạt điều chỉnh độ dài; tuy nhiên, việc truy cập nút kém hiệu quả và tiêu tốn bộ nhớ nhiều hơn. Các loại danh sách liên kết phổ biến gồm danh sách liên kết đơn, danh sách liên kết vòng và danh sách liên kết đôi.
- Danh sách (list) là một tập hợp có thứ tự các phần tử, hỗ trợ chèn, xóa, tìm kiếm và sửa đổi, thường được cài đặt dựa trên mảng động. Nó giữ lại ưu điểm của mảng trong khi vẫn cho phép điều chỉnh độ dài linh hoạt.
- Sự ra đời của danh sách đã cải thiện đáng kể tính thực dụng của mảng, nhưng cũng có thể lãng phí một phần bộ nhớ.
- Trong quá trình chương trình chạy, dữ liệu chủ yếu được lưu trong bộ nhớ. Mảng cung cấp hiệu quả sử dụng không gian bộ nhớ cao hơn, trong khi danh sách liên kết mang lại sự linh hoạt lớn hơn trong việc sử dụng bộ nhớ.
- Bộ nhớ đệm (cache) cung cấp khả năng truy cập dữ liệu nhanh cho CPU thông qua các cơ chế như dòng đệm (cache line), tìm nạp trước (prefetch), cùng tính cục bộ về không gian và thời gian, giúp cải thiện đáng kể hiệu suất thực thi chương trình.
- Vì mảng có tỷ lệ trúng bộ nhớ đệm (cache hit) cao hơn, nên nhìn chung mảng hiệu quả hơn danh sách liên kết. Khi lựa chọn cấu trúc dữ liệu, cần cân nhắc phù hợp dựa trên yêu cầu và tình huống cụ thể.

### Hỏi & Đáp

**Hỏi**: Việc lưu một mảng trên ngăn xếp (stack) so với trên vùng nhớ heap có ảnh hưởng đến hiệu quả thời gian và không gian không?

Mảng lưu trên ngăn xếp và trên heap đều được lưu trong không gian bộ nhớ liền kề, nên hiệu quả thao tác dữ liệu về cơ bản là như nhau. Tuy nhiên, ngăn xếp và heap có những đặc điểm riêng, dẫn đến các khác biệt sau.

1. Hiệu quả cấp phát và giải phóng: Ngăn xếp là một vùng bộ nhớ tương đối nhỏ, việc cấp phát được trình biên dịch xử lý tự động; heap tương đối lớn hơn và có thể được cấp phát động trong mã nguồn, dễ bị phân mảnh hơn. Do đó, các thao tác cấp phát và giải phóng trên heap thường chậm hơn so với trên ngăn xếp.
2. Giới hạn kích thước: Bộ nhớ ngăn xếp tương đối nhỏ, còn kích thước heap thường chỉ bị giới hạn bởi bộ nhớ khả dụng. Do đó, heap phù hợp hơn để lưu các mảng lớn.
3. Tính linh hoạt: Kích thước của một mảng trên ngăn xếp phải được xác định lúc biên dịch, trong khi kích thước của một mảng trên heap có thể được xác định linh hoạt lúc chạy.

**Hỏi**: Tại sao mảng yêu cầu các phần tử phải cùng kiểu, trong khi danh sách liên kết không nhấn mạnh yêu cầu này?

Danh sách liên kết được cấu tạo từ các nút, các nút được nối với nhau thông qua tham chiếu (con trỏ), và mỗi nút có thể lưu các kiểu dữ liệu khác nhau, chẳng hạn `int`, `double`, `string`, `object`, v.v.

Ngược lại, các phần tử của mảng phải cùng kiểu để có thể xác định vị trí của chúng bằng cách tính độ lệch (offset). Ví dụ, nếu một mảng chứa cả kiểu `int` và `long`, với mỗi phần tử chiếm lần lượt 4 byte và 8 byte, thì công thức sau không thể dùng để tính độ lệch, vì mảng chứa hai "kích thước phần tử" khác nhau.

```shell
# địa chỉ phần tử = địa chỉ gốc của mảng (địa chỉ phần tử đầu tiên) + kích thước phần tử * chỉ số phần tử
```

**Hỏi**: Sau khi xóa nút `P`, có cần đặt `P.next` thành `None` không?

Không cần thiết phải sửa `P.next`. Xét từ góc nhìn của danh sách liên kết, việc duyệt từ nút đầu đến nút cuối sẽ không còn gặp `P` nữa. Điều này có nghĩa là nút `P` đã bị loại khỏi danh sách liên kết, và việc `P` đang trỏ tới đâu vào lúc này không còn quan trọng—nó sẽ không ảnh hưởng đến danh sách liên kết.

Xét từ góc độ thuật toán và giải quyết bài toán, việc để nguyên con trỏ nối vẫn ổn miễn là logic chương trình đúng. Xét từ góc độ cài đặt thư viện chuẩn, việc chủ động ngắt kết nối sẽ an toàn và rõ ràng hơn. Nếu không ngắt kết nối và nút bị xóa không được thu hồi đúng cách, điều đó có thể ảnh hưởng đến việc thu hồi các nút phía sau.

**Hỏi**: Trong danh sách liên kết, độ phức tạp thời gian của thao tác chèn và xóa là $O(1)$. Tuy nhiên, cả chèn lẫn xóa đều cần $O(n)$ thời gian để tìm phần tử; tại sao độ phức tạp thời gian lại không phải là $O(n)$?

Nếu trước tiên tìm phần tử rồi mới xóa, độ phức tạp thời gian quả thực là $O(n)$. Tuy nhiên, ưu điểm chèn và xóa $O(1)$ của danh sách liên kết có thể được thể hiện trong các ứng dụng khác. Ví dụ, deque (hàng đợi hai đầu) rất phù hợp để cài đặt bằng danh sách liên kết, trong đó ta duy trì các biến con trỏ luôn trỏ đến nút đầu và nút cuối, mỗi thao tác chèn và xóa đều là $O(1)$.

**Hỏi**: Trong hình "Định nghĩa và cách lưu trữ danh sách liên kết", nút con trỏ màu xanh nhạt chiếm một địa chỉ bộ nhớ riêng, hay chia sẻ dung lượng ngang bằng với giá trị nút?

Hình này chỉ mang tính minh họa định tính; biểu diễn định lượng cần phân tích dựa trên tình huống cụ thể.

- Các kiểu giá trị nút khác nhau chiếm dung lượng khác nhau, chẳng hạn `int`, `long`, `double`, và các đối tượng thực thể, v.v.
- Dung lượng bộ nhớ mà các biến con trỏ chiếm dụng phụ thuộc vào hệ điều hành và môi trường biên dịch được sử dụng, thường là 8 byte hoặc 4 byte.

**Hỏi**: Việc thêm một phần tử vào cuối danh sách (list) có luôn là $O(1)$ không?

Nếu việc thêm phần tử vượt quá độ dài của danh sách, danh sách phải được mở rộng trước khi thêm. Hệ thống cấp phát một khối bộ nhớ mới và di chuyển tất cả phần tử từ danh sách gốc sang đó, trong trường hợp này độ phức tạp thời gian trở thành $O(n)$.

**Hỏi**: "Sự ra đời của danh sách đã cải thiện đáng kể tính thực dụng của mảng, nhưng có thể dẫn đến một phần bộ nhớ bị lãng phí"—sự lãng phí không gian này có phải đề cập đến bộ nhớ chiếm bởi các biến bổ sung như sức chứa, độ dài và hệ số mở rộng không?

Sự lãng phí không gian này chủ yếu đến từ hai khía cạnh: một mặt, danh sách thường đặt một độ dài khởi tạo mà ta có thể không dùng hết; mặt khác, để tránh việc mở rộng diễn ra quá thường xuyên, việc mở rộng thường nhân với một hệ số, chẳng hạn $\times 1.5$. Kết quả là sẽ có nhiều vị trí trống mà thông thường ta không thể lấp đầy hoàn toàn.

**Hỏi**: Trong Python, sau khi khởi tạo `n = [1, 2, 3]`, địa chỉ của 3 phần tử này là liền kề nhau, nhưng khi khởi tạo `m = [2, 1, 3]` thì id của mỗi phần tử lại không liền kề nhau; thay vào đó, chúng trùng với id trong `n`. Vì địa chỉ của các phần tử này không liền kề, vậy `m` có còn là một mảng không?

Nếu ta thay các phần tử của danh sách bằng các nút danh sách liên kết `n = [n1, n2, n3, n4, n5]`, thông thường 5 đối tượng nút này cũng nằm rải rác trong bộ nhớ. Tuy nhiên, cho trước một chỉ số danh sách, ta vẫn có thể lấy được địa chỉ bộ nhớ của nút trong thời gian $O(1)$, nhờ đó truy cập được nút tương ứng. Đó là vì mảng lưu các tham chiếu đến nút, chứ không phải bản thân các nút.

Khác với nhiều ngôn ngữ khác, các số trong Python được bọc thành đối tượng, và danh sách không lưu bản thân các số mà lưu tham chiếu đến các số đó. Do đó, ta thấy các số giống nhau trong hai mảng có cùng id, và địa chỉ bộ nhớ của các số này không cần phải liền kề.

**Hỏi**: Thư viện C++ STL có `std::list` đã cài đặt sẵn danh sách liên kết đôi, nhưng dường như một số sách thuật toán không dùng nó trực tiếp. Có hạn chế nào không?

Một mặt, ta thường ưu tiên dùng mảng để cài đặt thuật toán và chỉ dùng danh sách liên kết khi cần thiết, chủ yếu vì hai lý do.

- Chi phí không gian: Vì mỗi phần tử cần thêm hai con trỏ (một trỏ đến phần tử trước và một trỏ đến phần tử sau), `std::list` thường tốn nhiều không gian hơn `std::vector`.
- Không thân thiện với bộ nhớ đệm: Vì dữ liệu không được lưu liền kề, `std::list` có tỷ lệ sử dụng bộ nhớ đệm thấp hơn. Nhìn chung, `std::vector` có hiệu năng tốt hơn.

Mặt khác, các trường hợp cần thiết phải dùng danh sách liên kết chủ yếu liên quan đến cây nhị phân và đồ thị. Ngăn xếp và hàng đợi thường dùng `stack` và `queue` do ngôn ngữ lập trình cung cấp sẵn, thay vì danh sách liên kết.

**Hỏi**: Thao tác `res = [[0]] * n` có tạo ra một danh sách 2 chiều mà mỗi `[0]` là độc lập không?

Không, chúng không độc lập. Trong danh sách 2 chiều này, tất cả các `[0]` thực chất đều là tham chiếu đến cùng một đối tượng. Nếu ta sửa một phần tử, ta sẽ thấy tất cả các phần tử tương ứng đều thay đổi theo.

Nếu muốn mỗi `[0]` trong danh sách 2 chiều là độc lập, ta có thể dùng `res = [[0] for _ in range(n)]` để làm điều đó. Nguyên lý của cách này là khởi tạo $n$ đối tượng danh sách `[0]` độc lập với nhau.

**Hỏi**: Thao tác `res = [0] * n` có tạo ra một danh sách mà mỗi số nguyên 0 là độc lập không?

Trong danh sách này, tất cả các số nguyên 0 đều tham chiếu đến cùng một đối tượng. Đó là vì Python dùng cơ chế bộ nhớ đệm (caching) cho các số nguyên nhỏ (thường từ -5 đến 256) để tối đa hóa việc tái sử dụng đối tượng và cải thiện hiệu năng.

Mặc dù chúng đều tham chiếu đến cùng một đối tượng, ta vẫn có thể sửa từng phần tử trong danh sách một cách độc lập. Đó là vì các số nguyên trong Python là "đối tượng bất biến" (immutable). Khi ta sửa một phần tử, thực chất ta chỉ chuyển phần tử đó sang tham chiếu một đối tượng khác, chứ không thay đổi đối tượng gốc.

Tuy nhiên, khi các phần tử trong danh sách là "đối tượng khả biến" (mutable, chẳng hạn danh sách, từ điển, hoặc thực thể của lớp), việc sửa một phần tử sẽ trực tiếp thay đổi chính đối tượng đó, và mọi phần tử khác đang tham chiếu đến đối tượng này cũng sẽ chịu cùng thay đổi.
