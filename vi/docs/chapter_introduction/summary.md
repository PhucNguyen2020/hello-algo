# Tổng kết

### Điểm lại nội dung chính

- Giải thuật hiện diện khắp nơi trong đời sống hàng ngày, chứ không phải là một mảng kiến thức xa vời, khó tiếp cận. Trên thực tế, chúng ta đã vô tình học được nhiều giải thuật và sử dụng chúng để giải quyết các vấn đề lớn nhỏ trong cuộc sống.
- Nguyên lý tra từ điển tương đồng với giải thuật tìm kiếm nhị phân. Tìm kiếm nhị phân thể hiện tư tưởng giải thuật quan trọng là chia để trị.
- Quá trình sắp xếp các quân bài rất giống với giải thuật sắp xếp chèn. Sắp xếp chèn phù hợp để sắp xếp các tập dữ liệu nhỏ.
- Các bước thối tiền về cơ bản chính là một giải thuật tham lam, trong đó lựa chọn tốt nhất được đưa ra ở mỗi bước dựa trên tình huống hiện tại.
- Giải thuật là một tập hợp các chỉ dẫn hoặc các bước thao tác nhằm giải quyết một vấn đề cụ thể trong một khoảng thời gian hữu hạn, trong khi cấu trúc dữ liệu là cách tổ chức và lưu trữ dữ liệu trong máy tính.
- Cấu trúc dữ liệu và giải thuật có mối liên hệ chặt chẽ với nhau. Cấu trúc dữ liệu là nền tảng của giải thuật, còn giải thuật thổi hồn vào cấu trúc dữ liệu.
- Chúng ta có thể ví cấu trúc dữ liệu và giải thuật như việc lắp ráp các khối đồ chơi. Các khối đồ chơi tượng trưng cho dữ liệu, cách chúng được tạo hình và liên kết với nhau tượng trưng cho cấu trúc dữ liệu, còn các bước dùng để lắp ráp chúng tương ứng với giải thuật.

### Hỏi & Đáp

**Hỏi**: Là một lập trình viên, tôi chưa bao giờ sử dụng giải thuật để giải quyết vấn đề trong công việc hàng ngày. Các giải thuật thông dụng đã được đóng gói sẵn trong các ngôn ngữ lập trình và có thể sử dụng trực tiếp. Điều này có nghĩa là các vấn đề trong công việc của chúng ta chưa đạt đến mức cần dùng đến giải thuật hay không?

Nếu ví các kỹ năng công việc cụ thể như "chiêu thức" trong võ thuật, thì các môn học nền tảng nên được xem như "nội công".

Tôi tin rằng ý nghĩa của việc học giải thuật (và các môn học nền tảng khác) không nằm ở chỗ bạn sẽ phải tự cài đặt lại chúng từ đầu trong công việc, mà ở chỗ kiến thức bạn thu nhận được sẽ giúp bạn đưa ra những phán đoán chuyên môn đúng đắn khi giải quyết vấn đề, từ đó nâng cao chất lượng tổng thể công việc của bạn. Dưới đây là một ví dụ đơn giản. Mọi ngôn ngữ lập trình đều có sẵn hàm sắp xếp:

- Nếu chưa từng học cấu trúc dữ liệu và giải thuật, chúng ta có thể chỉ đơn giản đưa bất kỳ dữ liệu nào vào hàm sắp xếp này. Nó chạy trơn tru với hiệu năng tốt, và dường như không có vấn đề gì.
- Nhưng nếu đã học giải thuật, chúng ta sẽ biết rằng độ phức tạp thời gian của hàm sắp xếp có sẵn là $O(n \log n)$. Tuy nhiên, nếu dữ liệu đầu vào là các số nguyên có số chữ số cố định (chẳng hạn như mã số sinh viên), chúng ta có thể sử dụng giải thuật "sắp xếp cơ số" hiệu quả hơn, giúp giảm độ phức tạp thời gian xuống còn $O(nk)$, trong đó $k$ là số chữ số. Khi khối lượng dữ liệu rất lớn, thời gian chạy tiết kiệm được có thể tạo ra giá trị đáng kể (giảm chi phí, cải thiện trải nghiệm, v.v.).

Trong thực tế kỹ thuật, nhiều vấn đề rất khó để giải quyết một cách tối ưu, và không ít vấn đề khác chỉ được giải quyết ở mức "đủ tốt". Độ khó của một vấn đề, một mặt phụ thuộc vào bản chất của chính vấn đề đó, mặt khác phụ thuộc vào kiến thức của người xem xét nó. Kiến thức của một người càng đầy đủ và kinh nghiệm càng dày dặn, thì phân tích của họ sẽ càng sâu sắc, và vấn đề sẽ càng được giải quyết một cách tinh tế hơn.
