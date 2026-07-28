# Đánh giá hiệu suất giải thuật

Trong thiết kế giải thuật, chúng ta theo đuổi hai cấp độ mục tiêu sau theo thứ tự.

1. **Tìm ra lời giải cho bài toán**: Giải thuật phải luôn thu được lời giải đúng trong phạm vi đầu vào đã quy định.
2. **Tìm kiếm lời giải tối ưu**: Một bài toán có thể có nhiều lời giải khác nhau, và chúng ta mong muốn tìm được một giải thuật hiệu quả nhất có thể.

Nói cách khác, với tiền đề là có thể giải quyết được bài toán, hiệu suất giải thuật đã trở thành tiêu chí đánh giá hàng đầu để đo lường chất lượng của một giải thuật. Nó bao gồm hai khía cạnh sau.

- **Hiệu suất thời gian**: Thời gian mà giải thuật cần để chạy.
- **Hiệu suất không gian**: Dung lượng bộ nhớ mà giải thuật chiếm dụng.

Nói ngắn gọn, **mục tiêu của chúng ta là thiết kế các cấu trúc dữ liệu và giải thuật vừa "nhanh" vừa "tiết kiệm bộ nhớ"**. Việc đánh giá hiệu suất giải thuật một cách hiệu quả là vô cùng quan trọng, vì chỉ có như vậy chúng ta mới có thể so sánh các giải thuật khác nhau và định hướng cho quá trình thiết kế, tối ưu giải thuật.

Các phương pháp đánh giá hiệu suất chủ yếu được chia thành hai loại: kiểm thử thực tế và ước lượng lý thuyết.

## Kiểm thử thực tế

Giả sử hiện tại ta có giải thuật `A` và giải thuật `B`, cả hai đều có thể giải quyết cùng một bài toán, và ta cần so sánh hiệu suất của chúng. Cách trực tiếp nhất là chạy chúng trên máy tính và đo thời gian chạy cũng như lượng bộ nhớ sử dụng. Cách đánh giá này phản ánh được hành vi thực tế, nhưng cũng có những hạn chế đáng kể.

Một mặt, **rất khó để loại bỏ các yếu tố nhiễu từ môi trường kiểm thử**. Cấu hình phần cứng ảnh hưởng đến hiệu suất của giải thuật. Ví dụ, nếu một giải thuật có mức độ song song hóa cao, nó sẽ phù hợp hơn khi chạy trên CPU đa nhân; nếu một giải thuật thực hiện các thao tác thâm dụng bộ nhớ, nó sẽ được hưởng lợi nhiều hơn từ bộ nhớ hiệu năng cao. Nói cách khác, kết quả kiểm thử của cùng một giải thuật trên các máy khác nhau có thể không nhất quán. Điều này có nghĩa là chúng ta cần kiểm thử trên nhiều máy khác nhau rồi tính hiệu suất trung bình, điều này không thực tế.

Mặt khác, **việc tiến hành kiểm thử đầy đủ tiêu tốn rất nhiều tài nguyên**. Khi khối lượng dữ liệu đầu vào thay đổi, giải thuật sẽ thể hiện hiệu suất khác nhau. Ví dụ, khi khối lượng dữ liệu đầu vào nhỏ, thời gian chạy của giải thuật `A` ngắn hơn giải thuật `B`; nhưng khi khối lượng dữ liệu đầu vào lớn, kết quả kiểm thử có thể hoàn toàn ngược lại. Do đó, để có được kết luận thuyết phục, chúng ta cần kiểm thử với dữ liệu đầu vào ở nhiều quy mô khác nhau, điều này đòi hỏi một lượng lớn tài nguyên tính toán.

## Ước lượng lý thuyết

Vì kiểm thử thực tế có những hạn chế đáng kể, chúng ta có thể xem xét đánh giá hiệu suất giải thuật thông qua tính toán lý thuyết. Phương pháp ước lượng này được gọi là <u>phân tích độ phức tạp tiệm cận</u>, hay gọi tắt là <u>phân tích độ phức tạp</u>.

Phân tích độ phức tạp có thể phản ánh mối quan hệ giữa tài nguyên thời gian và không gian cần thiết để thực thi giải thuật với quy mô dữ liệu đầu vào. **Nó mô tả xu hướng tăng trưởng của thời gian và không gian cần thiết để thực thi giải thuật khi quy mô dữ liệu đầu vào tăng lên**. Định nghĩa này hơi rườm rà, nên ta có thể tách nó thành ba điểm mấu chốt để dễ hiểu hơn.

- "Tài nguyên thời gian và không gian" tương ứng lần lượt với <u>độ phức tạp thời gian</u> và <u>độ phức tạp không gian</u>.
- "Khi quy mô dữ liệu đầu vào tăng lên" có nghĩa là độ phức tạp phản ánh mối quan hệ giữa hiệu suất chạy của giải thuật và kích thước dữ liệu đầu vào.
- "Xu hướng tăng trưởng của thời gian và không gian" cho thấy phân tích độ phức tạp không tập trung vào giá trị cụ thể của thời gian chạy hay không gian chiếm dụng, mà tập trung vào tốc độ "tăng nhanh" như thế nào của thời gian hoặc không gian đó.

**Phân tích độ phức tạp khắc phục được những nhược điểm của phương pháp kiểm thử thực tế**, thể hiện ở các khía cạnh sau.

- Nó không cần phải thực sự chạy mã nguồn, do đó thân thiện với môi trường và tiết kiệm năng lượng hơn.
- Nó độc lập với môi trường kiểm thử, kết quả phân tích áp dụng được cho mọi nền tảng chạy.
- Nó có thể phản ánh hiệu suất giải thuật ở các khối lượng dữ liệu khác nhau, đặc biệt là hiệu suất giải thuật khi khối lượng dữ liệu lớn.

!!! tip

    Nếu bạn vẫn còn thấy mơ hồ về khái niệm độ phức tạp, đừng lo lắng — chúng ta sẽ giới thiệu chi tiết hơn trong các chương tiếp theo.

Phân tích độ phức tạp cung cấp cho chúng ta một "cây thước" để đánh giá hiệu suất giải thuật, cho phép chúng ta đo lường tài nguyên thời gian và không gian cần thiết để thực thi một giải thuật nhất định, và so sánh hiệu suất giữa các giải thuật khác nhau.

Độ phức tạp là một khái niệm toán học, có thể khiến người mới bắt đầu cảm thấy trừu tượng và khó tiếp cận. Từ góc độ này, phân tích độ phức tạp có lẽ không phải là chủ đề phù hợp nhất để giới thiệu đầu tiên. Tuy nhiên, khi bàn về đặc điểm của một cấu trúc dữ liệu hay giải thuật nào đó, ta khó có thể tránh khỏi việc phân tích tốc độ chạy và mức sử dụng không gian của nó.

Tóm lại, trước khi đi sâu vào cấu trúc dữ liệu và giải thuật, bạn nên **xây dựng trước một sự hiểu biết sơ bộ về phân tích độ phức tạp, để có thể phân tích được độ phức tạp của các giải thuật đơn giản**.
