# Xung đột băm

Phần trước đã đề cập rằng, **trong hầu hết các trường hợp, không gian đầu vào của một hàm băm lớn hơn nhiều so với không gian đầu ra**, do đó về mặt lý thuyết, xung đột băm là không thể tránh khỏi. Ví dụ, nếu không gian đầu vào là tất cả các số nguyên và không gian đầu ra là kích thước dung lượng mảng, thì chắc chắn sẽ có nhiều số nguyên bị ánh xạ về cùng một chỉ số bucket.

Xung đột băm có thể dẫn đến kết quả tra cứu sai, ảnh hưởng nghiêm trọng đến khả năng sử dụng của bảng băm. Để giải quyết vấn đề này, mỗi khi xảy ra xung đột băm, ta có thể mở rộng bảng băm cho đến khi xung đột biến mất. Cách tiếp cận này đơn giản, trực quan và hiệu quả, nhưng lại rất kém hiệu suất vì việc mở rộng bảng băm đòi hỏi phải di chuyển một lượng lớn dữ liệu và tính lại giá trị băm. Để nâng cao hiệu suất, ta có thể áp dụng các chiến lược sau:

1. Cải tiến cấu trúc dữ liệu của bảng băm sao cho **bảng băm vẫn hoạt động bình thường khi xảy ra xung đột băm**.
2. Chỉ mở rộng khi cần thiết, tức là chỉ khi xung đột băm trở nên nghiêm trọng.

Hai cách tiếp cận chính để cải tiến cấu trúc bảng băm là nối dây chuyền và dò địa chỉ mở.

## Nối dây chuyền

Trong bảng băm nguyên bản, mỗi bucket chỉ có thể lưu một cặp khóa-giá trị. <u>Nối dây chuyền</u> (separate chaining) thay thế phần tử đơn lẻ trong mỗi bucket bằng một danh sách liên kết, coi mỗi cặp khóa-giá trị là một nút và lưu tất cả các cặp khóa-giá trị xung đột trong cùng một danh sách. Hình dưới đây minh họa một ví dụ về bảng băm dùng nối dây chuyền.

![Bảng băm nối dây chuyền](hash_collision.assets/hash_table_chaining.png)

Trong bảng băm cài đặt bằng nối dây chuyền, các thao tác cơ bản hoạt động như sau:

- **Tra cứu phần tử**: Nhập `key`, tính chỉ số bucket bằng hàm băm, truy cập vào đầu danh sách liên kết tương ứng, rồi duyệt danh sách và so sánh khóa cho đến khi tìm thấy cặp khóa-giá trị mục tiêu.
- **Thêm phần tử**: Trước tiên dùng hàm băm để xác định danh sách liên kết tương ứng, sau đó chèn nút (cặp khóa-giá trị) vào danh sách đó.
- **Xóa phần tử**: Dùng hàm băm để xác định danh sách liên kết tương ứng, sau đó duyệt danh sách để tìm và xóa nút mục tiêu.

Nối dây chuyền có những hạn chế sau:

- **Tăng dung lượng bộ nhớ sử dụng**: Danh sách liên kết chứa con trỏ nút, tiêu tốn nhiều bộ nhớ hơn so với mảng.
- **Giảm hiệu quả tra cứu**: Vì cần phải duyệt tuyến tính qua danh sách liên kết để tìm phần tử tương ứng.

Đoạn mã dưới đây cung cấp một cách cài đặt đơn giản cho bảng băm nối dây chuyền, với hai điều cần lưu ý:

- Danh sách (mảng động) được dùng thay cho danh sách liên kết để đơn giản hóa mã nguồn. Trong cách cài đặt này, bảng băm (mảng) chứa nhiều bucket, mỗi bucket là một danh sách.
- Cách cài đặt này bao gồm phương thức mở rộng bảng băm. Khi hệ số tải vượt quá $\frac{2}{3}$, ta mở rộng bảng băm lên $2$ lần kích thước ban đầu.

```src
[file]{hash_map_chaining}-[class]{hash_map_chaining}-[func]{}
```

Đáng chú ý là khi danh sách liên kết trở nên rất dài, thời gian tra cứu $O(n)$ sẽ kém hiệu quả. **Trong trường hợp này, danh sách liên kết có thể được chuyển đổi thành cây AVL hoặc cây đỏ-đen**, giúp giảm độ phức tạp thời gian tra cứu xuống $O(\log n)$.

## Dò địa chỉ mở

<u>Dò địa chỉ mở</u> (open addressing) không đưa thêm cấu trúc dữ liệu mới nào vào. Thay vào đó, nó xử lý xung đột băm thông qua việc dò lặp lại. Các chiến lược dò phổ biến bao gồm dò tuyến tính, dò bậc hai và băm nhiều lần (multiple hashing).

Hãy dùng dò tuyến tính làm ví dụ để giới thiệu cơ chế hoạt động của bảng băm dò địa chỉ mở.

### Dò tuyến tính

Dò tuyến tính sử dụng một bước nhảy cố định để dò tuần tự, do đó các thao tác của nó có phần khác so với bảng băm thông thường.

- **Chèn phần tử**: Tính chỉ số bucket bằng hàm băm. Nếu bucket đó đã bị chiếm, tiếp tục dò về phía trước từ vị trí xung đột với một bước nhảy cố định (thường là $1$) cho đến khi tìm thấy một bucket trống, sau đó chèn phần tử vào đó.
- **Tìm phần tử**: Nếu xảy ra xung đột, tiếp tục dò về phía trước với cùng bước nhảy cho đến khi tìm thấy phần tử tương ứng và trả về `value` của nó; nếu gặp một bucket trống, phần tử mục tiêu không có trong bảng băm, khi đó trả về `None`.

Hình dưới đây minh họa sự phân bố của các cặp khóa-giá trị trong một bảng băm dò địa chỉ mở sử dụng dò tuyến tính. Với hàm băm này, các khóa có cùng hai chữ số cuối được ánh xạ về cùng một bucket. Dò tuyến tính sau đó sẽ đặt chúng vào bucket đó và các bucket kế tiếp.

![Phân bố cặp khóa-giá trị trong bảng băm dò địa chỉ mở (dò tuyến tính)](hash_collision.assets/hash_table_linear_probing.png)

Tuy nhiên, **dò tuyến tính dễ gây ra hiện tượng dồn cụm**. Cụ thể, vùng liên tục bị chiếm dụng trong mảng càng dài thì càng dễ xảy ra xung đột mới trong chính vùng đó. Điều này lại khiến cụm đó tiếp tục phình to hơn, tạo ra một vòng luẩn quẩn khiến hiệu quả của các thao tác chèn, xóa, tra cứu và cập nhật dần suy giảm.

Cần lưu ý rằng **ta không thể xóa trực tiếp phần tử khỏi bảng băm dò địa chỉ mở**. Việc xóa một phần tử sẽ tạo ra một bucket trống `None` trong mảng. Trong quá trình tra cứu, một khi dò tuyến tính chạm đến bucket trống đó, nó sẽ dừng lại, nghĩa là mọi phần tử được lưu xa hơn trong chuỗi dò sẽ trở nên không thể truy cập được. Kết quả là, chương trình có thể kết luận sai rằng các phần tử đó không tồn tại, như minh họa trong hình dưới đây.

![Vấn đề tra cứu do việc xóa gây ra trong dò địa chỉ mở](hash_collision.assets/hash_table_open_addressing_deletion.png)

Để giải quyết vấn đề này, ta có thể áp dụng <u>xóa trì hoãn</u> (lazy deletion): thay vì xóa trực tiếp một phần tử khỏi bảng băm, **dùng một hằng số `TOMBSTONE` để đánh dấu bucket đó**. Theo cơ chế này, cả `None` và `TOMBSTONE` đều biểu thị các bucket có thể chấp nhận cặp khóa-giá trị mới. Điểm khác biệt là khi dò tuyến tính gặp `TOMBSTONE`, nó phải tiếp tục dò, vì vẫn có thể còn cặp khóa-giá trị nằm xa hơn trong chuỗi.

Tuy nhiên, **xóa trì hoãn có thể làm tăng tốc độ suy giảm hiệu năng của bảng băm**. Mỗi lần xóa sẽ để lại một dấu hiệu, và khi số lượng mục `TOMBSTONE` tăng lên, thời gian tìm kiếm cũng tăng theo, vì dò tuyến tính có thể phải bỏ qua nhiều tombstone trước khi tìm được phần tử mục tiêu.

Để khắc phục điều này, ta có thể ghi lại chỉ số của `TOMBSTONE` đầu tiên gặp phải trong quá trình dò tuyến tính và hoán đổi phần tử mục tiêu tìm được vào vị trí đó. Lợi ích là mỗi lần tra cứu hoặc chèn đều có thể đưa các phần tử đến gần vị trí lý tưởng của chúng hơn, tức là gần điểm bắt đầu dò hơn, nhờ đó cải thiện hiệu quả tra cứu.

Đoạn mã dưới đây cài đặt một bảng băm dò địa chỉ mở (dò tuyến tính) có sử dụng xóa trì hoãn. Để tận dụng tốt hơn không gian của bảng băm, ta xem bảng băm như một "mảng vòng tròn". Khi vượt quá cuối mảng, ta quay lại đầu mảng và tiếp tục duyệt.

```src
[file]{hash_map_open_addressing}-[class]{hash_map_open_addressing}-[func]{}
```

### Dò bậc hai

Dò bậc hai (quadratic probing) tương tự dò tuyến tính và là một trong những chiến lược phổ biến của dò địa chỉ mở. Khi xảy ra xung đột, dò bậc hai không đơn giản là nhảy qua một số bước cố định mà nhảy qua một số bước bằng "bình phương của số lần dò", tức là $1, 4, 9, \dots$ bước.

Dò bậc hai có những ưu điểm sau:

- Dò bậc hai cố gắng giảm bớt hiệu ứng dồn cụm của dò tuyến tính bằng cách nhảy qua các khoảng cách bằng bình phương số lần dò.
- Dò bậc hai nhảy qua các khoảng cách lớn hơn để tìm vị trí trống, giúp phân bố dữ liệu đồng đều hơn.

Tuy nhiên, dò bậc hai không hoàn hảo:

- Hiện tượng dồn cụm vẫn tồn tại, tức là một số vị trí vẫn có khả năng bị chiếm dụng cao hơn các vị trí khác.
- Do sự tăng trưởng theo bình phương, dò bậc hai có thể không dò được hết toàn bộ bảng băm, nghĩa là ngay cả khi bảng băm còn bucket trống, dò bậc hai có thể không truy cập được đến chúng.

### Băm nhiều lần

Đúng như tên gọi, băm nhiều lần (multiple hashing) sử dụng nhiều hàm băm $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$ để dò.

- **Chèn phần tử**: Nếu hàm băm $f_1(x)$ gặp xung đột, thử $f_2(x)$, và cứ tiếp tục như vậy, cho đến khi tìm được vị trí trống và chèn phần tử vào.
- **Tìm phần tử**: Tìm kiếm theo cùng thứ tự các hàm băm cho đến khi tìm thấy phần tử mục tiêu và trả về nó; nếu gặp một vị trí trống hoặc đã thử hết tất cả các hàm băm, điều đó cho thấy phần tử không có trong bảng băm, khi đó trả về `None`.

So với dò tuyến tính, băm nhiều lần ít gây ra hiện tượng dồn cụm hơn, nhưng việc sử dụng nhiều hàm băm lại phát sinh thêm chi phí tính toán.

!!! tip

    Lưu ý rằng các bảng băm dựa trên dò địa chỉ mở, bao gồm dò tuyến tính, dò bậc hai và băm nhiều lần, đều có chung vấn đề là không thể xóa trực tiếp phần tử.

## Lựa chọn của các ngôn ngữ lập trình

Các ngôn ngữ lập trình khác nhau áp dụng các chiến lược cài đặt bảng băm khác nhau. Dưới đây là một vài ví dụ:

- Python dùng dò địa chỉ mở. Từ điển `dict` sử dụng các số giả ngẫu nhiên để dò.
- Java dùng nối dây chuyền. Kể từ JDK 1.8, khi độ dài mảng trong `HashMap` đạt 64 và độ dài một danh sách liên kết đạt 8, danh sách liên kết đó sẽ được chuyển đổi thành cây đỏ-đen để cải thiện hiệu suất tra cứu.
- Go dùng nối dây chuyền. Go quy định mỗi bucket có thể lưu tối đa 8 cặp khóa-giá trị, nếu vượt quá dung lượng thì một bucket tràn (overflow bucket) sẽ được liên kết thêm vào; khi có quá nhiều bucket tràn, một thao tác mở rộng đặc biệt với cùng dung lượng sẽ được thực hiện để đảm bảo hiệu năng.
