# Tổng kết

### Ôn tập trọng tâm

- Giải thuật quay lui về bản chất là một phương pháp tìm kiếm vét cạn. Nó tìm ra các lời giải thỏa mãn điều kiện đã cho bằng cách thực hiện duyệt theo chiều sâu trên không gian lời giải. Trong quá trình tìm kiếm, khi tìm được một lời giải thỏa mãn điều kiện, nó sẽ được ghi lại. Quá trình tìm kiếm kết thúc khi đã tìm được tất cả các lời giải hoặc khi việc duyệt hoàn tất.
- Quá trình tìm kiếm của giải thuật quay lui gồm hai phần: thử và quay lui. Nó thử các lựa chọn khác nhau thông qua tìm kiếm theo chiều sâu. Khi gặp tình huống vi phạm ràng buộc, nó hoàn tác lựa chọn trước đó, quay về trạng thái trước đó, và tiếp tục khám phá các lựa chọn khác. Thử và quay lui là hai thao tác ngược chiều nhau.
- Các bài toán quay lui thường chứa nhiều ràng buộc, và các ràng buộc này có thể được tận dụng để cài đặt các thao tác cắt tỉa. Cắt tỉa có thể chấm dứt sớm các nhánh tìm kiếm không cần thiết, nâng cao đáng kể hiệu quả tìm kiếm.
- Giải thuật quay lui chủ yếu được dùng để giải các bài toán tìm kiếm và bài toán thỏa mãn ràng buộc. Mặc dù các bài toán tối ưu hóa tổ hợp cũng có thể được giải bằng quay lui, nhưng thường có những lời giải hiệu quả hơn hoặc có hiệu năng tốt hơn.
- Bài toán hoán vị nhằm tìm tất cả các hoán vị khả dĩ của các phần tử trong một tập hợp cho trước. Chúng ta dùng một mảng để ghi lại xem mỗi phần tử đã được chọn hay chưa, từ đó cắt tỉa các nhánh tìm kiếm cố chọn lại cùng một phần tử, đảm bảo mỗi phần tử chỉ được chọn đúng một lần.
- Trong bài toán hoán vị, nếu tập hợp chứa các phần tử trùng lặp, kết quả cuối cùng sẽ chứa các hoán vị trùng lặp. Chúng ta cần áp đặt một ràng buộc để các phần tử bằng nhau chỉ được chọn một lần trong mỗi vòng, điều này thường được thực hiện bằng cách dùng một tập băm.
- Bài toán tổng tập con nhằm tìm tất cả các tập con của một tập hợp cho trước có tổng bằng một giá trị đích. Vì tập hợp không có thứ tự nhưng quá trình tìm kiếm lại xuất ra kết quả theo mọi thứ tự, nên các tập con trùng lặp sẽ được tạo ra. Chúng ta sắp xếp dữ liệu trước khi quay lui và dùng một biến để chỉ điểm bắt đầu duyệt của mỗi vòng, từ đó cắt tỉa các nhánh tìm kiếm tạo ra tập con trùng lặp.
- Đối với bài toán tổng tập con, các phần tử bằng nhau trong mảng sẽ tạo ra các tập con trùng lặp. Chúng ta tận dụng tiền đề mảng đã được sắp xếp bằng cách kiểm tra xem các phần tử liền kề có bằng nhau hay không để cài đặt cắt tỉa, đảm bảo các phần tử bằng nhau chỉ được chọn một lần trong mỗi vòng.
- Bài toán $n$ quân hậu nhằm tìm các cách sắp xếp $n$ quân hậu trên bàn cờ $n \times n$ sao cho không có hai quân hậu nào tấn công lẫn nhau. Các ràng buộc của bài toán này bao gồm ràng buộc hàng, ràng buộc cột, và ràng buộc đường chéo chính và phụ. Để thỏa mãn ràng buộc hàng, chúng ta áp dụng chiến lược đặt quân theo từng hàng, đảm bảo mỗi hàng chỉ đặt đúng một quân hậu.
- Cách xử lý ràng buộc cột và ràng buộc đường chéo tương tự nhau. Đối với ràng buộc cột, chúng ta dùng một mảng để ghi lại xem mỗi cột đã có quân hậu hay chưa, từ đó cho biết một ô được chọn có hợp lệ hay không. Đối với ràng buộc đường chéo, chúng ta dùng hai mảng riêng biệt để ghi lại xem có quân hậu tồn tại trên mỗi đường chéo chính hoặc phụ hay không. Điểm khó nằm ở việc tìm ra quy luật chỉ số hàng-cột đặc trưng cho các ô nằm trên cùng một đường chéo chính (phụ).

### Hỏi & Đáp

**Hỏi**: Làm thế nào để hiểu mối quan hệ giữa quay lui và đệ quy?

Nhìn chung, quay lui là một chiến lược giải thuật, còn đệ quy nên được xem như một công cụ.

- Quay lui thường được cài đặt bằng đệ quy. Tuy nhiên, quay lui chỉ là một trong những ứng dụng của đệ quy, cụ thể là ứng dụng của nó trong các bài toán tìm kiếm.
- Cấu trúc của đệ quy phản ánh một mô hình giải quyết vấn đề dựa trên việc phân rã một bài toán thành các bài toán con, và nó thường được dùng trong chia để trị, quay lui, và quy hoạch động (đệ quy có nhớ).
