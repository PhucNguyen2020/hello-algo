# Tóm tắt

### Tổng kết trọng tâm

- Sắp xếp nổi bọt đạt được việc sắp xếp bằng cách hoán đổi các phần tử liền kề. Bằng cách thêm một cờ (flag) để cho phép thoát sớm, ta có thể tối ưu độ phức tạp thời gian trường hợp tốt nhất của sắp xếp nổi bọt xuống $O(n)$.
- Trong mỗi vòng, sắp xếp chèn chèn một phần tử từ phần chưa sắp xếp vào đúng vị trí của nó trong phần đã sắp xếp. Mặc dù sắp xếp chèn có độ phức tạp thời gian $O(n^2)$, nó vẫn rất phổ biến cho các tác vụ sắp xếp nhỏ vì mỗi thao tác tương đối nhẹ.
- Sắp xếp nhanh dựa trên phân hoạch có phần tử canh gác (sentinel partitioning). Trong phân hoạch có phần tử canh gác, việc liên tục chọn phải phần tử chốt (pivot) tệ nhất có thể khiến độ phức tạp thời gian suy giảm xuống $O(n^2)$. Chọn phần tử chốt theo trung vị hoặc chọn ngẫu nhiên có thể giảm khả năng xảy ra sự suy giảm này. Bằng cách đệ quy trên mảng con ngắn hơn trước, ta có thể giảm hiệu quả độ sâu đệ quy và tối ưu độ phức tạp không gian xuống $O(\log n)$.
- Sắp xếp trộn gồm hai giai đoạn: chia và trộn, thường thể hiện chiến lược chia để trị. Trong sắp xếp trộn, việc sắp xếp một mảng đòi hỏi tạo các mảng phụ trợ, với độ phức tạp không gian $O(n)$; tuy nhiên, độ phức tạp không gian khi sắp xếp một danh sách liên kết có thể được tối ưu xuống $O(1)$.
- Sắp xếp theo giỏ (bucket sort) gồm ba bước: phân phối dữ liệu vào các giỏ, sắp xếp bên trong từng giỏ, và gộp kết quả. Nó cũng thể hiện chiến lược chia để trị và phù hợp với khối lượng dữ liệu rất lớn. Chìa khóa của sắp xếp theo giỏ là phân phối dữ liệu đồng đều.
- Sắp xếp đếm là một trường hợp đặc biệt của sắp xếp theo giỏ, đạt được việc sắp xếp bằng cách đếm số lần xuất hiện của dữ liệu. Sắp xếp đếm phù hợp với các tình huống có khối lượng dữ liệu lớn nhưng phạm vi dữ liệu bị giới hạn, và yêu cầu dữ liệu có thể chuyển đổi thành số nguyên dương.
- Sắp xếp cơ số đạt được việc sắp xếp dữ liệu bằng cách sắp xếp lần lượt theo từng chữ số, yêu cầu dữ liệu có thể biểu diễn dưới dạng các số có số chữ số cố định.
- Nhìn chung, ta mong muốn tìm được một giải thuật sắp xếp vừa hiệu quả, vừa ổn định, vừa tại chỗ (in-place), vừa thích ứng (adaptive). Tuy nhiên, cũng như các cấu trúc dữ liệu và giải thuật khác, không giải thuật sắp xếp nào có thể thỏa mãn tất cả các tiêu chí này cùng lúc. Trong thực tế, ta cần chọn giải thuật sắp xếp phù hợp dựa trên đặc điểm của dữ liệu.
- Hình dưới đây so sánh các giải thuật sắp xếp phổ biến về hiệu quả, tính ổn định, tính tại chỗ, và tính thích ứng.

![So sánh các giải thuật sắp xếp](summary.assets/sorting_algorithms_comparison.png)

### Hỏi & Đáp

**Hỏi**: Trong những tình huống nào thì tính ổn định của giải thuật sắp xếp là cần thiết?

Trong thực tế, ta có thể sắp xếp dựa trên một thuộc tính nào đó của đối tượng. Ví dụ, học sinh có hai thuộc tính: tên và chiều cao. Ta muốn thực hiện sắp xếp nhiều cấp: trước tiên sắp xếp theo tên để được `(A, 180) (B, 185) (C, 170) (D, 170)`; sau đó sắp xếp theo chiều cao. Vì giải thuật sắp xếp không ổn định, ta có thể nhận được `(D, 170) (C, 170) (A, 180) (B, 185)`.

Ta có thể thấy học sinh D và C đã đổi vị trí cho nhau, phá vỡ thứ tự theo tên, điều này không phải điều ta mong muốn.

**Hỏi**: Thứ tự "tìm kiếm từ phải sang trái" và "tìm kiếm từ trái sang phải" trong phân hoạch có phần tử canh gác có thể hoán đổi cho nhau không?

Không. Khi ta dùng phần tử ngoài cùng bên trái làm phần tử chốt, ta phải "tìm kiếm từ phải sang trái" trước rồi mới "tìm kiếm từ trái sang phải". Kết luận này có phần trái với trực giác; hãy cùng phân tích lý do.

Bước cuối cùng của phân hoạch có phần tử canh gác `partition()` là hoán đổi `nums[left]` và `nums[i]`. Sau khi hoán đổi xong, các phần tử bên trái phần tử chốt đều phải `<=` phần tử chốt, **điều này đòi hỏi `nums[left] >= nums[i]` phải đúng trước lần hoán đổi cuối cùng**. Giả sử ta "tìm kiếm từ trái sang phải" trước, nếu không tìm được phần tử nào lớn hơn phần tử chốt, **ta sẽ thoát vòng lặp khi `i == j`, lúc này có thể `nums[j] == nums[i] > nums[left]`**. Nói cách khác, thao tác hoán đổi cuối cùng sẽ đưa một phần tử lớn hơn phần tử chốt về đầu mảng, khiến phân hoạch có phần tử canh gác thất bại.

Ví dụ, cho mảng `[0, 0, 0, 0, 1]`, nếu ta "tìm kiếm từ trái sang phải" trước, mảng sau khi phân hoạch có phần tử canh gác sẽ là `[1, 0, 0, 0, 0]`, điều này không đúng.

Với cùng lý luận đó, nếu ta chọn `nums[right]` làm phần tử chốt, thứ tự sẽ đảo ngược lại: ta phải "tìm kiếm từ trái sang phải" trước.

**Hỏi**: Về việc tối ưu độ sâu đệ quy trong sắp xếp nhanh, tại sao việc chọn mảng ngắn hơn lại có thể đảm bảo độ sâu đệ quy không vượt quá $\log n$?

Độ sâu đệ quy là số lệnh gọi đệ quy chưa trả về. Mỗi vòng phân hoạch có phần tử canh gác chia mảng gốc thành hai mảng con. Sau khi tối ưu, mảng con được chọn để tiếp tục đệ quy có độ dài tối đa bằng một nửa mảng gốc. Trong trường hợp xấu nhất, nếu luôn bằng một nửa, độ sâu đệ quy cuối cùng là $\log n$.

Xem lại sắp xếp nhanh nguyên bản, ta có thể liên tục đệ quy trên mảng dài hơn. Trong trường hợp xấu nhất, độ dài sẽ là $n$, $n - 1$, $\dots$, $2$, $1$, với độ sâu đệ quy là $n$. Việc tối ưu độ sâu đệ quy có thể tránh được tình huống này.

**Hỏi**: Khi tất cả các phần tử trong mảng bằng nhau, độ phức tạp thời gian của sắp xếp nhanh có phải $O(n^2)$ không? Trường hợp suy biến này nên được xử lý ra sao?

Đúng vậy. Trong trường hợp này, mảng có thể được phân hoạch thành ba phần thông qua phân hoạch có phần tử canh gác: nhỏ hơn, bằng, và lớn hơn phần tử chốt. Sau đó ta chỉ đệ quy trên phần nhỏ hơn và phần lớn hơn. Với cách tiếp cận này, một mảng có tất cả các phần tử bằng nhau có thể được sắp xếp chỉ trong một vòng phân hoạch có phần tử canh gác.

**Hỏi**: Tại sao độ phức tạp thời gian trường hợp xấu nhất của sắp xếp theo giỏ lại là $O(n^2)$?

Trong trường hợp xấu nhất, tất cả các phần tử đều được phân phối vào cùng một giỏ. Nếu ta dùng một giải thuật $O(n^2)$ để sắp xếp các phần tử này, độ phức tạp thời gian sẽ là $O(n^2)$.
