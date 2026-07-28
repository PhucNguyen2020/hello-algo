# Giải thuật sắp xếp

<u>Giải thuật sắp xếp</u> sắp xếp một tập dữ liệu theo một trật tự nhất định. Giải thuật sắp xếp có ứng dụng rất rộng rãi vì dữ liệu đã được sắp xếp thường có thể tìm kiếm, phân tích và xử lý hiệu quả hơn.

Như hình dưới đây cho thấy, dữ liệu cần sắp xếp có thể là số nguyên, số thực, ký tự, chuỗi ký tự,... Quy tắc sắp xếp có thể được định nghĩa tùy theo nhu cầu, chẳng hạn thứ tự số học, thứ tự ASCII hoặc một quy tắc tùy chỉnh.

![Ví dụ về kiểu dữ liệu và tiêu chí sắp xếp](sorting_algorithm.assets/sorting_examples.png)

## Các khía cạnh đánh giá

**Hiệu suất thực thi**: Chúng ta mong muốn độ phức tạp thời gian của giải thuật sắp xếp càng thấp càng tốt, với tổng số phép toán càng nhỏ càng tốt (giảm hệ số hằng số trong độ phức tạp thời gian). Đối với lượng dữ liệu lớn, hiệu suất thực thi đặc biệt quan trọng.

**Tính tại chỗ**: Đúng như tên gọi, <u>sắp xếp tại chỗ</u> đạt được việc sắp xếp bằng cách thao tác trực tiếp trên mảng gốc mà không cần mảng phụ trợ bổ sung, nhờ đó tiết kiệm bộ nhớ. Thông thường, sắp xếp tại chỗ có ít thao tác di chuyển dữ liệu hơn và chạy nhanh hơn.

**Tính ổn định**: <u>Sắp xếp ổn định</u> đảm bảo rằng thứ tự tương đối của các phần tử bằng nhau trong mảng không thay đổi sau khi sắp xếp hoàn tất.

Sắp xếp ổn định là điều kiện cần thiết cho các tình huống sắp xếp nhiều cấp. Giả sử chúng ta có một bảng lưu thông tin sinh viên, trong đó cột 1 và cột 2 lần lượt là tên và tuổi. Trong trường hợp này, <u>sắp xếp không ổn định</u> có thể khiến tính có thứ tự của dữ liệu đầu vào bị mất đi:

```shell
# Dữ liệu đầu vào được sắp xếp theo tên
# (tên, tuổi)
  ('A', 19)
  ('B', 18)
  ('C', 21)
  ('D', 19)
  ('E', 23)

# Giả sử ta dùng một giải thuật sắp xếp không ổn định để sắp xếp danh sách theo tuổi.
# Trong kết quả, vị trí tương đối của ('D', 19) và ('A', 19) bị thay đổi,
# do đó tính chất dữ liệu đầu vào được sắp xếp theo tên đã bị mất.
  ('B', 18)
  ('D', 19)
  ('A', 19)
  ('C', 21)
  ('E', 23)
```

**Tính thích nghi**: <u>Sắp xếp thích nghi</u> có thể tận dụng thông tin trật tự sẵn có trong dữ liệu đầu vào để giảm khối lượng tính toán, từ đó đạt hiệu suất thời gian tốt hơn. Độ phức tạp thời gian trong trường hợp tốt nhất của giải thuật sắp xếp thích nghi thường tốt hơn độ phức tạp thời gian trung bình.

**Dựa trên so sánh hay không so sánh**: <u>Sắp xếp dựa trên so sánh</u> dựa vào các toán tử so sánh ($<$, $=$, $>$) để xác định thứ tự tương đối giữa các phần tử, từ đó sắp xếp toàn bộ mảng, với độ phức tạp thời gian tối ưu về mặt lý thuyết là $O(n \log n)$. <u>Sắp xếp không so sánh</u> không sử dụng toán tử so sánh và có thể đạt độ phức tạp thời gian $O(n)$, nhưng tính linh hoạt của nó tương đối hạn chế.

## Giải thuật sắp xếp lý tưởng

**Nhanh, tại chỗ, ổn định, thích nghi và có tính ứng dụng rộng rãi**. Rõ ràng, cho đến nay chưa phát hiện được giải thuật sắp xếp nào hội tụ đầy đủ tất cả các đặc tính này. Do đó, khi lựa chọn giải thuật sắp xếp, cần phải cân nhắc dựa trên đặc điểm cụ thể của dữ liệu và yêu cầu của bài toán.

Tiếp theo, chúng ta sẽ tìm hiểu các giải thuật sắp xếp khác nhau và phân tích ưu, nhược điểm của chúng dựa trên các khía cạnh đánh giá nêu trên.
