# Bộ nhớ truy cập ngẫu nhiên và bộ nhớ đệm *

Trong hai phần đầu của chương này, chúng ta đã tìm hiểu về mảng và danh sách liên kết, hai cấu trúc dữ liệu cơ bản và quan trọng, đại diện cho hai cách bố trí vật lý: "lưu trữ liên tục" và "lưu trữ phân tán".

Trên thực tế, **cấu trúc vật lý phần lớn quyết định hiệu quả mà chương trình sử dụng bộ nhớ và bộ nhớ đệm**, từ đó ảnh hưởng đến hiệu năng tổng thể của chương trình thuật toán.

## Các thiết bị lưu trữ của máy tính

Máy tính bao gồm ba loại thiết bị lưu trữ: <u>ổ đĩa cứng</u>, <u>bộ nhớ truy cập ngẫu nhiên (RAM)</u>, và <u>bộ nhớ đệm (cache)</u>. Bảng dưới đây cho thấy vai trò và đặc điểm hiệu năng khác nhau của chúng trong một hệ thống máy tính.

<p align="center"> Bảng <id> &nbsp; Các thiết bị lưu trữ của máy tính </p>

|                | Ổ đĩa cứng                                                     | RAM                                              | Bộ nhớ đệm                                                      |
| -------------- | ------------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------- |
| Mục đích       | Lưu trữ dữ liệu lâu dài, bao gồm hệ điều hành, chương trình và tệp tin | Lưu trữ tạm thời chương trình đang chạy và dữ liệu đang xử lý | Lưu trữ dữ liệu và lệnh được truy cập thường xuyên để giảm số lần CPU truy cập bộ nhớ |
| Tính bền vững  | Dữ liệu không mất khi mất điện                                | Dữ liệu mất khi mất điện                         | Dữ liệu mất khi mất điện                                        |
| Dung lượng     | Lớn, cỡ terabyte (TB)                                          | Nhỏ, cỡ gigabyte (GB)                            | Rất nhỏ, cỡ megabyte (MB)                                       |
| Tốc độ         | Chậm, hàng trăm đến hàng nghìn MB/s                            | Nhanh, hàng chục GB/s                            | Rất nhanh, hàng chục đến hàng trăm GB/s                         |
| Chi phí (NDT/GB) | Rẻ, từ vài hào đến vài nhân dân tệ mỗi GB                     | Đắt, từ vài chục đến vài trăm nhân dân tệ mỗi GB | Rất đắt, chi phí gắn liền với gói CPU                          |

Ta có thể hình dung hệ thống lưu trữ của máy tính như một kim tự tháp, như hình dưới đây. Các thiết bị lưu trữ càng gần đỉnh thì càng nhanh, dung lượng càng nhỏ và càng đắt đỏ. Thiết kế nhiều tầng này là có chủ đích, là kết quả của sự cân nhắc kỹ lưỡng từ các nhà khoa học và kỹ sư máy tính.

- **Ổ đĩa cứng không thể dễ dàng được thay thế bằng RAM**. Thứ nhất, dữ liệu trong bộ nhớ sẽ mất khi mất điện, khiến nó không phù hợp để lưu trữ dữ liệu lâu dài. Thứ hai, bộ nhớ đắt hơn ổ đĩa cứng hàng chục lần, khiến nó khó phổ biến trên thị trường tiêu dùng.
- **Bộ nhớ đệm không thể đồng thời đạt được dung lượng lớn và tốc độ cao**. Khi dung lượng của bộ nhớ đệm L1, L2 và L3 tăng lên, kích thước vật lý của chúng cũng lớn hơn, và khoảng cách vật lý giữa chúng với lõi CPU cũng tăng lên, dẫn đến thời gian truyền dữ liệu lâu hơn và độ trễ truy cập phần tử cao hơn. Với công nghệ hiện tại, cấu trúc bộ nhớ đệm nhiều tầng đại diện cho điểm cân bằng tốt nhất giữa dung lượng, tốc độ và chi phí.

![Hệ thống lưu trữ của máy tính](ram_and_cache.assets/storage_pyramid.png)

!!! tip

    Cấu trúc phân tầng lưu trữ của máy tính thể hiện sự cân bằng tinh tế giữa tốc độ, dung lượng và chi phí. Trên thực tế, những sự đánh đổi như vậy rất phổ biến trong mọi lĩnh vực công nghiệp, đòi hỏi chúng ta phải tìm ra điểm cân bằng tối ưu giữa các lợi ích và ràng buộc khác nhau.

Tóm lại, **ổ đĩa cứng được dùng để lưu trữ lâu dài lượng lớn dữ liệu, RAM được dùng để lưu trữ tạm thời dữ liệu đang được xử lý trong quá trình chạy chương trình, và bộ nhớ đệm được dùng để lưu trữ dữ liệu và lệnh được truy cập thường xuyên**, nhờ đó nâng cao hiệu quả thực thi chương trình. Cả ba cùng phối hợp để giữ cho hệ thống máy tính vận hành hiệu quả.

Như hình dưới đây, trong quá trình chạy chương trình, dữ liệu được đọc từ ổ đĩa cứng vào RAM để CPU tính toán. Bộ nhớ đệm có thể được xem là một phần của CPU. **Bằng cách nạp dữ liệu từ RAM một cách thông minh**, nó cung cấp cho CPU khả năng truy cập dữ liệu tốc độ cao, giúp cải thiện đáng kể hiệu quả thực thi chương trình và giảm sự phụ thuộc vào RAM vốn chậm hơn.

![Luồng dữ liệu giữa ổ đĩa cứng, RAM và bộ nhớ đệm](ram_and_cache.assets/computer_storage_devices.png)

## Hiệu quả sử dụng bộ nhớ của các cấu trúc dữ liệu

Xét về hiệu quả sử dụng không gian bộ nhớ, mảng và danh sách liên kết đều có những ưu điểm và hạn chế riêng.

Một mặt, **bộ nhớ là có hạn, và cùng một vùng nhớ không thể được chia sẻ bởi nhiều chương trình cùng lúc**, vì vậy chúng ta mong muốn các cấu trúc dữ liệu sử dụng không gian một cách hiệu quả nhất có thể. Các phần tử của mảng được xếp sát nhau và không cần thêm không gian để lưu tham chiếu (con trỏ) giữa các nút như danh sách liên kết, nên có hiệu quả sử dụng không gian cao hơn. Tuy nhiên, mảng cần cấp phát đủ vùng nhớ liên tục ngay một lần, điều này có thể dẫn đến lãng phí bộ nhớ, và việc mở rộng mảng đòi hỏi thêm chi phí thời gian và không gian. So với đó, danh sách liên kết thực hiện việc cấp phát và giải phóng bộ nhớ động theo từng "nút", mang lại sự linh hoạt lớn hơn.

Mặt khác, trong quá trình chạy chương trình, **khi bộ nhớ liên tục được cấp phát và giải phóng, mức độ phân mảnh của bộ nhớ trống ngày càng nghiêm trọng hơn**, dẫn đến hiệu quả sử dụng bộ nhớ giảm sút. Mảng, nhờ cách lưu trữ liên tục, ít gặp phải tình trạng phân mảnh bộ nhớ hơn. Ngược lại, các phần tử của danh sách liên kết được phân bố rải rác trong bộ nhớ, và các thao tác chèn, xóa thường xuyên dễ gây ra phân mảnh bộ nhớ hơn.

## Hiệu quả sử dụng bộ nhớ đệm của các cấu trúc dữ liệu

Mặc dù dung lượng của bộ nhớ đệm nhỏ hơn nhiều so với bộ nhớ chính, nó lại nhanh hơn bộ nhớ chính rất nhiều và đóng vai trò quan trọng đối với tốc độ thực thi chương trình. Vì dung lượng bộ nhớ đệm có hạn và chỉ có thể lưu trữ một phần nhỏ dữ liệu được truy cập thường xuyên, khi CPU cố truy cập dữ liệu không có trong bộ nhớ đệm, hiện tượng <u>trượt bộ nhớ đệm (cache miss)</u> sẽ xảy ra, và CPU phải nạp dữ liệu cần thiết từ bộ nhớ chậm hơn.

Rõ ràng, **số lần "trượt bộ nhớ đệm" càng ít, hiệu quả đọc ghi dữ liệu của CPU càng cao**, và hiệu năng chương trình càng tốt. Ta gọi tỷ lệ dữ liệu mà CPU lấy thành công từ bộ nhớ đệm là <u>tỷ lệ trúng bộ nhớ đệm (cache hit rate)</u>, một chỉ số thường được dùng để đo hiệu quả của bộ nhớ đệm.

Để đạt hiệu quả cao nhất có thể, bộ nhớ đệm sử dụng các cơ chế nạp dữ liệu sau đây.

- **Dòng bộ nhớ đệm (cache line)**: Bộ nhớ đệm không lưu và nạp dữ liệu theo từng byte, mà theo từng dòng bộ nhớ đệm. So với truyền theo từng byte, truyền theo dòng bộ nhớ đệm hiệu quả hơn.
- **Cơ chế nạp trước (prefetching)**: Bộ xử lý cố gắng dự đoán các mẫu truy cập dữ liệu (ví dụ: truy cập tuần tự, truy cập nhảy theo bước cố định, v.v.) và nạp dữ liệu vào bộ nhớ đệm theo các mẫu cụ thể, nhờ đó cải thiện tỷ lệ trúng.
- **Tính cục bộ không gian (spatial locality)**: Nếu một phần dữ liệu được truy cập, dữ liệu lân cận cũng có thể được truy cập trong tương lai gần. Vì vậy, khi bộ nhớ đệm nạp một phần dữ liệu cụ thể, nó cũng nạp cả dữ liệu lân cận để cải thiện tỷ lệ trúng.
- **Tính cục bộ thời gian (temporal locality)**: Nếu một phần dữ liệu được truy cập, nó có khả năng sẽ được truy cập lại trong tương lai gần. Bộ nhớ đệm tận dụng nguyên lý này bằng cách giữ lại dữ liệu vừa được truy cập để cải thiện tỷ lệ trúng.

Trên thực tế, **mảng và danh sách liên kết khác nhau về mức độ hiệu quả khi sử dụng bộ nhớ đệm**, chủ yếu ở các khía cạnh sau.

- **Không gian chiếm dụng**: Các phần tử của danh sách liên kết chiếm nhiều không gian hơn phần tử của mảng, nên lượng dữ liệu hữu ích có thể chứa vừa trong bộ nhớ đệm sẽ ít hơn.
- **Dòng bộ nhớ đệm**: Dữ liệu của danh sách liên kết nằm rải rác trong bộ nhớ, trong khi bộ nhớ đệm nạp dữ liệu "theo dòng", nên tỷ lệ dữ liệu vô ích được nạp vào sẽ cao hơn.
- **Cơ chế nạp trước**: Mảng có các mẫu truy cập dữ liệu "dễ dự đoán" hơn so với danh sách liên kết, giúp hệ thống dễ dàng đoán được dữ liệu nào sẽ được nạp tiếp theo.
- **Tính cục bộ không gian**: Mảng được lưu trong một vùng nhớ tập trung, nên dữ liệu gần với dữ liệu vừa được nạp có khả năng cao sẽ sớm được truy cập.

Nhìn chung, **mảng có tỷ lệ trúng bộ nhớ đệm cao hơn, do đó chúng thường vượt trội hơn danh sách liên kết về hiệu quả thao tác**. Điều này khiến các cấu trúc dữ liệu được cài đặt dựa trên mảng trở nên phổ biến hơn khi giải quyết các bài toán thuật toán.

Cần lưu ý rằng **hiệu quả bộ nhớ đệm cao không có nghĩa là mảng luôn tốt hơn danh sách liên kết trong mọi trường hợp**. Trong các ứng dụng thực tế, việc chọn cấu trúc dữ liệu nào nên dựa trên yêu cầu cụ thể. Ví dụ, cả mảng lẫn danh sách liên kết đều có thể cài đặt cấu trúc dữ liệu "ngăn xếp" (sẽ được trình bày chi tiết ở chương tiếp theo), nhưng chúng phù hợp với các tình huống khác nhau.

- Khi giải các bài toán thuật toán, ta thường có xu hướng ưu tiên cài đặt ngăn xếp dựa trên mảng, vì chúng cung cấp hiệu quả thao tác cao hơn và khả năng truy cập ngẫu nhiên, đổi lại là cần cấp phát trước một lượng bộ nhớ nhất định cho mảng.
- Nếu khối lượng dữ liệu rất lớn, tính biến động cao, và kích thước dự kiến của ngăn xếp khó ước lượng, thì cài đặt ngăn xếp dựa trên danh sách liên kết sẽ phù hợp hơn. Danh sách liên kết có thể phân bố lượng lớn dữ liệu vào các vị trí khác nhau trong bộ nhớ và tránh được chi phí phát sinh thêm do việc mở rộng mảng.
