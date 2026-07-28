# Giải thuật là gì

## Định nghĩa giải thuật

<u>Giải thuật</u> là một tập hợp các chỉ dẫn hoặc các bước thao tác nhằm giải quyết một vấn đề cụ thể trong một khoảng thời gian hữu hạn. Nó có các đặc điểm sau.

- Vấn đề được định nghĩa rõ ràng, với đầu vào và đầu ra được xác định cụ thể.
- Có tính khả thi, có thể hoàn thành với số bước, thời gian và bộ nhớ hữu hạn.
- Mỗi bước đều có ý nghĩa xác định, và với cùng điều kiện đầu vào và vận hành, đầu ra luôn giống nhau.

## Định nghĩa cấu trúc dữ liệu

<u>Cấu trúc dữ liệu</u> là cách tổ chức và lưu trữ dữ liệu, bao gồm bản thân dữ liệu, mối quan hệ giữa các phần tử dữ liệu, và các phương thức được dùng để thao tác trên chúng. Nó có các mục tiêu thiết kế sau.

- Chiếm không gian càng ít càng tốt để tiết kiệm bộ nhớ máy tính.
- Các thao tác trên dữ liệu cần diễn ra càng nhanh càng tốt, bao gồm truy cập, thêm, xóa, cập nhật dữ liệu, v.v.
- Cung cấp cách biểu diễn dữ liệu ngắn gọn cùng thông tin logic để giải thuật có thể chạy hiệu quả.

**Thiết kế cấu trúc dữ liệu là một quá trình đầy sự đánh đổi**. Nếu muốn cải thiện một khía cạnh nào đó, chúng ta thường phải chấp nhận hy sinh ở một khía cạnh khác. Dưới đây là hai ví dụ.

- So với mảng, danh sách liên kết thuận tiện hơn cho các thao tác thêm và xóa dữ liệu nhưng lại đánh đổi tốc độ truy cập dữ liệu.
- So với danh sách liên kết, đồ thị cung cấp thông tin logic phong phú hơn nhưng lại đòi hỏi không gian bộ nhớ lớn hơn.

## Mối quan hệ giữa cấu trúc dữ liệu và giải thuật

Như hình dưới đây cho thấy, cấu trúc dữ liệu và giải thuật có mối liên hệ chặt chẽ và gắn bó mật thiết với nhau, cụ thể thể hiện qua ba khía cạnh sau.

- Cấu trúc dữ liệu là nền tảng của giải thuật. Cấu trúc dữ liệu cung cấp cho giải thuật cách lưu trữ dữ liệu có cấu trúc và các phương thức để thao tác trên dữ liệu.
- Giải thuật thổi hồn vào cấu trúc dữ liệu. Bản thân cấu trúc dữ liệu chỉ lưu trữ thông tin dữ liệu; khi kết hợp với giải thuật, chúng mới có thể giải quyết được các vấn đề cụ thể.
- Giải thuật thường có thể được cài đặt dựa trên nhiều cấu trúc dữ liệu khác nhau, nhưng hiệu năng thực thi có thể chênh lệch rất lớn. Việc chọn đúng cấu trúc dữ liệu là yếu tố then chốt.

![Mối quan hệ giữa cấu trúc dữ liệu và giải thuật](what_is_dsa.assets/relationship_between_data_structure_and_algorithm.png)

Cấu trúc dữ liệu và giải thuật giống như việc lắp ráp các khối đồ chơi, như hình dưới đây minh họa. Một bộ đồ chơi lắp ráp, ngoài việc chứa nhiều bộ phận, còn đi kèm với hướng dẫn lắp ráp chi tiết. Bằng cách làm theo hướng dẫn từng bước, chúng ta có thể lắp ráp nên một mô hình đồ chơi tinh xảo.

![Lắp ráp các khối đồ chơi](what_is_dsa.assets/assembling_blocks.png)

Sự tương ứng chi tiết giữa hai khái niệm này được thể hiện trong bảng dưới đây.

<p align="center"> Bảng <id> &nbsp; So sánh cấu trúc dữ liệu và giải thuật với việc lắp ráp các khối đồ chơi </p>

| Cấu trúc dữ liệu và giải thuật | Lắp ráp khối đồ chơi                                        |
| ------------------------------ | ------------------------------------------------------------------ |
| Dữ liệu đầu vào                     | Các khối đồ chơi chưa lắp ráp                                        |
| Cấu trúc dữ liệu                 | Hình thức tổ chức của các khối đồ chơi, bao gồm hình dạng, kích thước, cách liên kết, v.v. |
| Giải thuật                      | Một chuỗi các bước thao tác để lắp ráp các khối thành hình dạng mục tiêu |
| Dữ liệu đầu ra                    | Mô hình đồ chơi                                               |

Đáng chú ý là cấu trúc dữ liệu và giải thuật độc lập với ngôn ngữ lập trình. Đó là lý do vì sao cuốn sách này có thể cung cấp cách cài đặt bằng nhiều ngôn ngữ lập trình khác nhau.

!!! tip "Cách viết tắt thông dụng"

    Trong các cuộc thảo luận thực tế, chúng ta thường viết tắt "cấu trúc dữ liệu và giải thuật" thành "giải thuật". Ví dụ, các bài toán giải thuật nổi tiếng trên LeetCode thực chất kiểm tra kiến thức về cả cấu trúc dữ liệu lẫn giải thuật.
