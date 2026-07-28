# Tổng kết

### Ôn tập trọng tâm

- Giải thuật tham lam thường được dùng để giải các bài toán tối ưu hóa. Nguyên lý của nó là đưa ra các quyết định tối ưu cục bộ ở mỗi bước ra quyết định với hy vọng thu được lời giải tối ưu toàn cục.
- Giải thuật tham lam đưa ra từng lựa chọn tham lam một cách lặp đi lặp lại, biến bài toán thành một bài toán con nhỏ hơn trong mỗi vòng, cho đến khi bài toán được giải quyết.
- Giải thuật tham lam không chỉ đơn giản để triển khai, mà còn có hiệu quả giải quyết bài toán cao. So với quy hoạch động, giải thuật tham lam thường có độ phức tạp thời gian thấp hơn.
- Trong bài toán đổi tiền, với một số tổ hợp mệnh giá xu nhất định, giải thuật tham lam có thể đảm bảo tìm ra lời giải tối ưu; tuy nhiên với các tổ hợp mệnh giá xu khác, giải thuật tham lam có thể tìm ra lời giải rất tệ.
- Các bài toán phù hợp để giải bằng giải thuật tham lam có hai tính chất lớn: tính chất lựa chọn tham lam và cấu trúc con tối ưu. Tính chất lựa chọn tham lam thể hiện tính hiệu quả của chiến lược tham lam.
- Với một số bài toán phức tạp, việc chứng minh tính chất lựa chọn tham lam không đơn giản. Tương đối mà nói, việc bác bỏ nó lại dễ hơn, chẳng hạn như trong bài toán đổi tiền.
- Giải các bài toán tham lam chủ yếu gồm ba bước: phân tích bài toán, xác định chiến lược tham lam, và chứng minh tính đúng đắn. Trong đó, xác định chiến lược tham lam là bước cốt lõi, còn chứng minh tính đúng đắn thường là khó khăn chính.
- Bài toán cái túi phân số, dựa trên bài toán cái túi 0-1, cho phép chọn các phần vật phẩm, và do đó có thể được giải bằng giải thuật tham lam. Tính đúng đắn của chiến lược tham lam có thể được chứng minh bằng phương pháp phản chứng.
- Bài toán dung tích lớn nhất có thể được giải bằng cách liệt kê toàn bộ với độ phức tạp thời gian $O(n^2)$. Bằng cách thiết kế chiến lược tham lam di chuyển cạnh ngắn hơn vào trong ở mỗi vòng, độ phức tạp thời gian có thể được tối ưu xuống $O(n)$.
- Trong bài toán cắt tối ưu tích, ta lần lượt suy ra hai chiến lược tham lam: các số nguyên $\geq 4$ đều nên tiếp tục được chia, và thừa số chia tối ưu là $3$. Đoạn mã bao gồm các phép toán lũy thừa, và độ phức tạp thời gian phụ thuộc vào cách triển khai phép lũy thừa, thường là $O(1)$ hoặc $O(\log n)$.
