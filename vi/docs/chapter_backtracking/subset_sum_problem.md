# Bài toán tổng tập con

## Không có phần tử trùng lặp

!!! question

    Cho một mảng số nguyên dương `nums` và một số nguyên dương đích `target`, tìm tất cả các tổ hợp khả dĩ sao cho tổng các phần tử trong tổ hợp bằng `target`. Mảng đã cho không có phần tử trùng lặp, và mỗi phần tử có thể được chọn nhiều lần. Trả về các tổ hợp này dưới dạng danh sách, trong đó danh sách không được chứa các tổ hợp trùng lặp.

Ví dụ, cho tập hợp $\{3, 4, 5\}$ và số nguyên đích $9$, các lời giải là $\{3, 3, 3\}, \{4, 5\}$. Lưu ý hai điểm sau:

- Các phần tử trong tập hợp đầu vào có thể được chọn lặp lại không giới hạn.
- Các tập con không phân biệt thứ tự phần tử; ví dụ, $\{4, 5\}$ và $\{5, 4\}$ là cùng một tập con.

### Tham khảo lời giải của bài toán hoán vị

Tương tự bài toán hoán vị, chúng ta có thể xem quá trình tạo ra các tập con như kết quả của một chuỗi các lựa chọn, và cập nhật tổng chạy trong quá trình chọn. Khi tổng bằng `target`, chúng ta ghi lại tập con đó vào danh sách kết quả.

Khác với bài toán hoán vị, **các phần tử trong bài toán này có thể được chọn bất kỳ số lần nào**, vì vậy chúng ta không cần dùng danh sách boolean `selected` để theo dõi xem một phần tử đã được chọn hay chưa. Với một vài thay đổi nhỏ trên mã nguồn của bài toán hoán vị, ta thu được một lời giải ban đầu:

```src
[file]{subset_sum_i_naive}-[class]{}-[func]{subset_sum_i_naive}
```

Chạy đoạn mã trên với mảng $[3, 4, 5]$ và giá trị đích $9$ cho ra kết quả $[3, 3, 3], [4, 5], [5, 4]$. **Mặc dù đã tìm được thành công tất cả các tập con có tổng bằng $9$, nhưng lại xuất hiện các tập con trùng lặp $[4, 5]$ và $[5, 4]$**.

Điều này xảy ra vì quá trình tìm kiếm phân biệt thứ tự các lựa chọn, trong khi các tập con thì không phân biệt thứ tự chọn. Như hình dưới đây, việc chọn 4 trước rồi chọn 5 sau và việc chọn 5 trước rồi chọn 4 sau là hai nhánh khác nhau, nhưng chúng lại tương ứng với cùng một tập con.

![Tìm kiếm tập con và cắt tỉa biên](subset_sum_problem.assets/subset_sum_i_naive.png)

Để loại bỏ các tập con trùng lặp, **một ý tưởng đơn giản là khử trùng lặp trên danh sách kết quả**. Tuy nhiên, cách này rất kém hiệu quả vì hai lý do:

- Khi có nhiều phần tử trong mảng, đặc biệt là khi `target` lớn, quá trình tìm kiếm sẽ tạo ra rất nhiều tập con trùng lặp.
- Việc so sánh các tập con (mảng) rất tốn thời gian, đòi hỏi phải sắp xếp các mảng trước, sau đó so sánh từng phần tử trong chúng.

### Cắt tỉa các tập con trùng lặp

**Chúng ta xem xét việc khử trùng lặp thông qua cắt tỉa ngay trong quá trình tìm kiếm**. Quan sát hình dưới đây, các tập con trùng lặp xảy ra khi các phần tử của mảng được chọn theo thứ tự khác nhau, như trong các trường hợp sau:

1. Khi vòng đầu tiên và vòng thứ hai lần lượt chọn $3$ và $4$, tất cả các tập con chứa hai phần tử này sẽ được tạo ra, ký hiệu là $[3, 4, \dots]$.
2. Sau đó, khi vòng đầu tiên chọn $4$, **vòng thứ hai nên bỏ qua $3$**, vì tập con $[4, 3, \dots]$ được tạo ra bởi lựa chọn này hoàn toàn trùng với tập con được tạo ra ở bước `1.`

Trong quá trình tìm kiếm, các lựa chọn ở mỗi tầng được thử từ trái sang phải, vì vậy các nhánh nằm phía bên phải càng bị cắt tỉa nhiều hơn.

1. Hai vòng đầu tiên chọn $3$ và $5$, tạo ra tập con $[3, 5, \dots]$.
2. Hai vòng đầu tiên chọn $4$ và $5$, tạo ra tập con $[4, 5, \dots]$.
3. Nếu vòng đầu tiên chọn $5$, **vòng thứ hai nên bỏ qua $3$ và $4$**, vì các tập con $[5, 3, \dots]$ và $[5, 4, \dots]$ hoàn toàn trùng với các tập con đã mô tả ở bước `1.` và `2.`

![Các thứ tự chọn khác nhau dẫn đến tập con trùng lặp](subset_sum_problem.assets/subset_sum_i_pruning.png)

Tóm lại, với một mảng đầu vào $[x_1, x_2, \dots, x_n]$, gọi chuỗi lựa chọn trong quá trình tìm kiếm là $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$. Chuỗi lựa chọn này phải thỏa mãn $i_1 \leq i_2 \leq \dots \leq i_m$; **bất kỳ chuỗi lựa chọn nào không thỏa mãn điều kiện này sẽ gây ra trùng lặp và cần được cắt tỉa**.

### Cài đặt mã nguồn

Để cài đặt việc cắt tỉa này, chúng ta khởi tạo một biến `start` để chỉ điểm bắt đầu duyệt. **Sau khi thực hiện lựa chọn $x_{i}$, đặt vòng tiếp theo bắt đầu duyệt từ chỉ số $i$**. Điều này đảm bảo chuỗi lựa chọn thỏa mãn $i_1 \leq i_2 \leq \dots \leq i_m$, đảm bảo tính duy nhất của tập con.

Ngoài ra, chúng ta thực hiện hai tối ưu sau đối với đoạn mã:

- Trước khi bắt đầu tìm kiếm, hãy sắp xếp mảng `nums` trước. Khi duyệt qua tất cả các lựa chọn, **kết thúc vòng lặp ngay khi tổng của tập con vượt quá `target`**, vì các phần tử phía sau lớn hơn, tổng tập con của chúng chắc chắn sẽ vượt quá `target`.
- Bỏ đi biến tổng phần tử `total` và **dùng phép trừ trên `target` để theo dõi tổng các phần tử**. Ghi lại lời giải khi `target` bằng $0$.

```src
[file]{subset_sum_i}-[class]{}-[func]{subset_sum_i}
```

Hình dưới đây thể hiện toàn bộ quá trình quay lui khi chạy đoạn mã trên với mảng $[3, 4, 5]$ và giá trị đích $9$.

![Quá trình quay lui của bài toán tổng tập con I](subset_sum_problem.assets/subset_sum_i.png)

## Mảng có chứa phần tử trùng lặp

!!! question

    Cho một mảng số nguyên dương `nums` và một số nguyên dương đích `target`, tìm tất cả các tổ hợp khả dĩ sao cho tổng các phần tử trong tổ hợp bằng `target`. **Mảng đã cho có thể chứa các phần tử trùng lặp, và mỗi phần tử có thể được chọn nhiều nhất một lần**. Trả về các tổ hợp này dưới dạng danh sách, trong đó danh sách không được chứa các tổ hợp trùng lặp.

So với bài toán trước, **mảng đầu vào trong bài toán này có thể chứa các phần tử trùng lặp**, điều này làm phát sinh một vấn đề mới. Ví dụ, cho mảng $[4, \hat{4}, 5]$ và giá trị đích $9$, kết quả đầu ra của đoạn mã hiện có là $[4, 5], [\hat{4}, 5]$, chứa các tập con trùng lặp.

**Nguyên nhân gây ra sự trùng lặp này là các phần tử bằng nhau bị chọn nhiều lần trong cùng một vòng**. Trong hình dưới đây, vòng đầu tiên có ba lựa chọn, trong đó hai lựa chọn đều là $4$, tạo ra hai nhánh tìm kiếm trùng lặp và xuất ra các tập con trùng lặp. Tương tự, hai giá trị $4$ ở vòng thứ hai cũng tạo ra các tập con trùng lặp.

![Tập con trùng lặp do các phần tử bằng nhau gây ra](subset_sum_problem.assets/subset_sum_ii_repeat.png)

### Cắt tỉa các phần tử bằng nhau

Để giải quyết vấn đề này, **chúng ta cần giới hạn các phần tử bằng nhau chỉ được chọn một lần trong mỗi vòng**. Cách cài đặt khá tinh tế: vì mảng đã được sắp xếp, các phần tử bằng nhau sẽ nằm liền kề nhau. Điều này có nghĩa là trong một vòng chọn nhất định, nếu phần tử hiện tại bằng phần tử bên trái nó, thì giá trị đó đã được chọn trong vòng này rồi, vì vậy ta bỏ qua phần tử hiện tại luôn.

Đồng thời, **bài toán này quy định mỗi phần tử trong mảng chỉ được chọn một lần**. May mắn thay, chúng ta cũng có thể dùng biến `start` để thỏa mãn ràng buộc này: sau khi thực hiện lựa chọn $x_{i}$, đặt vòng tiếp theo bắt đầu duyệt từ chỉ số $i + 1$ trở đi. Điều này vừa loại bỏ được các tập con trùng lặp, vừa tránh việc chọn một phần tử nhiều lần.

### Cài đặt mã nguồn

```src
[file]{subset_sum_ii}-[class]{}-[func]{subset_sum_ii}
```

Hình dưới đây thể hiện quá trình quay lui đối với mảng $[4, 4, 5]$ và giá trị đích $9$, bao gồm bốn loại thao tác cắt tỉa. Hãy kết hợp hình minh họa với các chú thích trong mã nguồn để hiểu toàn bộ quá trình tìm kiếm và cách mỗi thao tác cắt tỉa hoạt động.

![Quá trình quay lui của bài toán tổng tập con II](subset_sum_problem.assets/subset_sum_ii.png)
