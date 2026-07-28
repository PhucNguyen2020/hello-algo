# Giải thuật tham lam

<u>Giải thuật tham lam</u> là một phương pháp phổ biến để giải các bài toán tối ưu hóa. Ý tưởng cơ bản của nó là chọn lựa chọn có vẻ tốt nhất ở mỗi bước ra quyết định, tức là tham lam đưa ra các quyết định tối ưu cục bộ với hy vọng đạt được lời giải tối ưu toàn cục. Giải thuật tham lam đơn giản và hiệu quả, được ứng dụng rộng rãi trong nhiều bài toán thực tế.

Giải thuật tham lam và quy hoạch động đều thường được dùng để giải các bài toán tối ưu hóa. Chúng có một số điểm tương đồng, chẳng hạn cả hai đều dựa vào tính chất cấu trúc con tối ưu, nhưng cách hoạt động lại khác nhau.

- Quy hoạch động xem xét tất cả các quyết định trước đó khi đưa ra quyết định hiện tại, và sử dụng lời giải của các bài toán con trong quá khứ để xây dựng lời giải cho bài toán con hiện tại.
- Giải thuật tham lam không xem xét các quyết định trong quá khứ, mà thay vào đó đưa ra các lựa chọn tham lam khi tiến về phía trước, liên tục thu nhỏ kích thước bài toán cho đến khi bài toán được giải quyết.

Trước tiên, chúng ta sẽ tìm hiểu cách giải thuật tham lam hoạt động thông qua bài toán ví dụ "đổi tiền". Bài toán này đã được giới thiệu trong chương "Bài toán cái túi hoàn chỉnh", nên bạn hẳn đã quen thuộc với nó.

!!! question

    Cho $n$ loại tiền xu, trong đó mệnh giá của loại thứ $i$ là $coins[i - 1]$, một số tiền mục tiêu $amt$, và số lượng xu mỗi loại là không giới hạn, hỏi cần ít nhất bao nhiêu đồng xu để tạo thành số tiền mục tiêu? Nếu không thể tạo thành số tiền mục tiêu, trả về $-1$.

Chiến lược tham lam cho bài toán này được thể hiện trong hình dưới đây. Với một số tiền mục tiêu cho trước, **ta tham lam chọn đồng xu không vượt quá số tiền đó và gần với nó nhất**, lặp lại bước này cho đến khi tạo thành số tiền mục tiêu.

![Chiến lược tham lam cho bài toán đổi tiền](greedy_algorithm.assets/coin_change_greedy_strategy.png)

Mã triển khai như sau:

```src
[file]{coin_change_greedy}-[class]{}-[func]{coin_change_greedy}
```

Bạn có thể sẽ thốt lên: "Thật gọn gàng!" Giải thuật tham lam giải bài toán đổi tiền chỉ trong khoảng mười dòng mã.

## Ưu điểm và hạn chế của giải thuật tham lam

**Giải thuật tham lam không chỉ dễ áp dụng và dễ triển khai, mà thường còn rất hiệu quả**. Trong đoạn mã trên, nếu mệnh giá xu nhỏ nhất là $\min(coins)$, thì vòng lặp chọn tham lam chạy tối đa $amt / \min(coins)$ lần, cho độ phức tạp thời gian là $O(amt / \min(coins))$. Đây là mức thấp hơn một bậc so với độ phức tạp thời gian của lời giải quy hoạch động, $O(n \times amt)$.

Tuy nhiên, **với một số tập mệnh giá xu, giải thuật tham lam không thể tìm ra lời giải tối ưu**. Hình dưới đây cho thấy hai ví dụ.

- **Ví dụ đúng $coins = [1, 5, 10, 20, 50, 100]$**: Với tập xu này, giải thuật tham lam có thể tìm ra lời giải tối ưu cho bất kỳ $amt$ nào.
- **Phản ví dụ $coins = [1, 20, 50]$**: Giả sử $amt = 60$. Giải thuật tham lam chỉ có thể tìm ra tổ hợp $50 + 1 \times 10$, sử dụng tổng cộng $11$ đồng xu, trong khi quy hoạch động có thể tìm ra lời giải tối ưu $20 + 20 + 20$ chỉ với $3$ đồng xu.
- **Phản ví dụ $coins = [1, 49, 50]$**: Giả sử $amt = 98$. Giải thuật tham lam chỉ có thể tìm ra tổ hợp $50 + 1 \times 48$, sử dụng tổng cộng $49$ đồng xu, trong khi quy hoạch động có thể tìm ra lời giải tối ưu $49 + 49$ chỉ với $2$ đồng xu.

![Các ví dụ mà giải thuật tham lam không thể tìm ra lời giải tối ưu](greedy_algorithm.assets/coin_change_greedy_vs_dp.png)

Nói cách khác, với bài toán đổi tiền, giải thuật tham lam không thể đảm bảo lời giải tối ưu toàn cục và thậm chí có thể cho ra kết quả rất tệ. Bài toán này nên được giải bằng quy hoạch động thì tốt hơn.

Nhìn chung, giải thuật tham lam thường được áp dụng trong hai trường hợp sau.

1. **Có thể đảm bảo lời giải tối ưu**: Trong trường hợp này, giải thuật tham lam thường là lựa chọn tốt nhất vì chúng có xu hướng hiệu quả hơn quay lui và quy hoạch động.
2. **Có thể tìm ra lời giải gần tối ưu**: Giải thuật tham lam cũng hữu ích trong trường hợp này. Với nhiều bài toán phức tạp, việc tìm ra lời giải tối ưu toàn cục là rất khó, nên việc tìm hiệu quả một lời giải chưa tối ưu đã là một kết quả rất tốt.

## Đặc điểm của giải thuật tham lam

Vậy câu hỏi đặt ra là: loại bài toán nào phù hợp để giải bằng giải thuật tham lam? Hay nói cách khác, trong điều kiện nào thì giải thuật tham lam có thể đảm bảo tìm ra lời giải tối ưu?

So với quy hoạch động, điều kiện để sử dụng giải thuật tham lam khắt khe hơn, chủ yếu tập trung vào hai tính chất của bài toán.

- **Tính chất lựa chọn tham lam**: Chỉ khi các lựa chọn tối ưu cục bộ luôn dẫn đến lời giải tối ưu toàn cục thì giải thuật tham lam mới có thể đảm bảo thu được lời giải tối ưu.
- **Cấu trúc con tối ưu**: Lời giải tối ưu của bài toán gốc chứa các lời giải tối ưu của các bài toán con.

Cấu trúc con tối ưu đã được giới thiệu trong chương "Quy hoạch động", nên chúng ta sẽ không nhắc lại ở đây. Cần lưu ý rằng cấu trúc con tối ưu của một số bài toán không rõ ràng, nhưng chúng vẫn có thể được giải bằng giải thuật tham lam.

Chúng ta chủ yếu khám phá các phương pháp để xác định tính chất lựa chọn tham lam. Mặc dù mô tả của nó có vẻ tương đối đơn giản, nhưng **trên thực tế, với nhiều bài toán, việc chứng minh tính chất lựa chọn tham lam không hề dễ dàng**.

Ví dụ, trong bài toán đổi tiền, mặc dù ta có thể dễ dàng đưa ra phản ví dụ để bác bỏ tính chất lựa chọn tham lam, nhưng việc chứng minh nó đúng lại khó hơn nhiều. Nếu được hỏi, **trong điều kiện nào thì một tập mệnh giá xu có thể được giải bằng giải thuật tham lam**? Chúng ta thường chỉ có thể dựa vào trực giác hoặc ví dụ để đưa ra câu trả lời mơ hồ, và rất khó để đưa ra một chứng minh toán học chặt chẽ.

!!! quote

    Có một bài báo trình bày một giải thuật $O(n^3)$ để xác định xem một tập mệnh giá xu có thể được giải tối ưu bằng giải thuật tham lam cho mọi số tiền hay không.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## Các bước giải bài toán bằng giải thuật tham lam

Quy trình chung để giải các bài toán tham lam có thể chia thành ba bước sau.

1. **Phân tích bài toán**: Sắp xếp và hiểu rõ các đặc điểm của bài toán, bao gồm định nghĩa trạng thái, mục tiêu tối ưu hóa và các ràng buộc. Bước này cũng xuất hiện trong quay lui và quy hoạch động.
2. **Xác định chiến lược tham lam**: Quyết định cách đưa ra lựa chọn tham lam ở mỗi bước. Chiến lược này cần thu nhỏ dần kích thước bài toán và cuối cùng giải quyết toàn bộ bài toán.
3. **Chứng minh tính đúng đắn**: Thường cần chứng minh bài toán có cả tính chất lựa chọn tham lam lẫn cấu trúc con tối ưu. Bước này có thể cần đến các công cụ toán học như quy nạp hoặc phản chứng.

Việc xác định chiến lược tham lam là bước cốt lõi để giải các bài toán loại này, nhưng trên thực tế nó có thể không hề dễ dàng, chủ yếu vì các lý do sau.

- **Chiến lược tham lam khác nhau rất nhiều giữa các bài toán**. Với nhiều bài toán, chiến lược tham lam khá trực quan và có thể suy ra thông qua lập luận sơ bộ và thử nghiệm. Tuy nhiên với một số bài toán phức tạp, chiến lược tham lam có thể được giấu rất sâu, điều này thử thách mạnh mẽ kinh nghiệm giải quyết vấn đề và khả năng thuật toán của mỗi người.
- **Một số chiến lược tham lam có tính đánh lừa cao**. Ta có thể tự tin thiết kế một chiến lược tham lam, viết mã lời giải, và nộp bài, chỉ để phát hiện ra một số trường hợp kiểm thử bị sai. Đó là vì chiến lược tham lam được thiết kế chỉ "đúng một phần", giống như ví dụ về bài toán đổi tiền đã thảo luận ở trên.

Để đảm bảo tính đúng đắn, chúng ta nên đưa ra một chứng minh toán học chặt chẽ cho chiến lược tham lam, **thường sử dụng phản chứng hoặc quy nạp toán học**.

Tuy nhiên, việc chứng minh tính đúng đắn cũng có thể khó khăn. Nếu không có hướng đi rõ ràng, chúng ta thường phải gỡ lỗi dựa trên các trường hợp kiểm thử, chỉnh sửa và xác thực chiến lược tham lam từng bước.

## Các bài toán điển hình giải bằng giải thuật tham lam

Giải thuật tham lam thường được áp dụng cho các bài toán tối ưu hóa thỏa mãn tính chất lựa chọn tham lam và cấu trúc con tối ưu. Dưới đây là một số bài toán tham lam điển hình.

- **Bài toán đổi tiền**: Với một số tổ hợp mệnh giá xu nhất định, giải thuật tham lam luôn có thể thu được lời giải tối ưu.
- **Bài toán lập lịch khoảng thời gian**: Giả sử bạn có một số công việc, mỗi công việc diễn ra trong một khoảng thời gian, và mục tiêu của bạn là hoàn thành càng nhiều công việc càng tốt. Nếu bạn luôn chọn công việc kết thúc sớm nhất, thì giải thuật tham lam có thể thu được lời giải tối ưu.
- **Bài toán cái túi phân số**: Cho một tập vật phẩm và một dung tích mang theo, mục tiêu của bạn là chọn một tập vật phẩm sao cho tổng trọng lượng không vượt quá dung tích mang theo và tổng giá trị được tối đa hóa. Nếu bạn luôn chọn vật phẩm có tỷ lệ giá trị trên trọng lượng (giá trị / trọng lượng) cao nhất, thì giải thuật tham lam có thể thu được lời giải tối ưu trong một số trường hợp.
- **Bài toán giao dịch cổ phiếu**: Cho một tập giá cổ phiếu lịch sử, bạn có thể thực hiện nhiều giao dịch, nhưng nếu bạn đã nắm giữ cổ phiếu, bạn không thể mua thêm trước khi bán, và mục tiêu là thu được lợi nhuận tối đa.
- **Mã hóa Huffman**: Mã hóa Huffman là một giải thuật tham lam được dùng để nén dữ liệu không mất mát. Bằng cách xây dựng cây Huffman và luôn hợp nhất hai nút có tần suất thấp nhất, cây Huffman thu được có độ dài đường đi có trọng số nhỏ nhất (độ dài mã hóa).
- **Giải thuật Dijkstra**: Đây là một giải thuật tham lam để giải bài toán đường đi ngắn nhất từ một đỉnh nguồn cho trước đến tất cả các đỉnh khác.
