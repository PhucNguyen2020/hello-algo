# Bài toán hoán vị

Bài toán hoán vị là một ứng dụng kinh điển của giải thuật quay lui. Bài toán này được định nghĩa là tìm tất cả các cách sắp xếp khả dĩ của các phần tử trong một tập hợp cho trước (chẳng hạn như mảng hoặc chuỗi ký tự).

Bảng dưới đây cho thấy một vài tập dữ liệu ví dụ, bao gồm mảng đầu vào và các hoán vị tương ứng của chúng.

<p align="center"> Bảng <id> &nbsp; Ví dụ về bài toán hoán vị </p>

| Mảng đầu vào | Tất cả các hoán vị                                                 |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

## Trường hợp các phần tử khác nhau

!!! question

    Cho một mảng số nguyên không có phần tử trùng lặp, trả về tất cả các hoán vị khả dĩ.

Từ góc độ giải thuật quay lui, **chúng ta có thể hình dung quá trình tạo ra các hoán vị như kết quả của một chuỗi các lựa chọn**. Giả sử mảng đầu vào là $[1, 2, 3]$. Nếu đầu tiên ta chọn $1$, sau đó chọn $3$, và cuối cùng chọn $2$, ta thu được hoán vị $[1, 3, 2]$. Quay lui nghĩa là hoàn tác một lựa chọn rồi thử các lựa chọn khác.

Từ góc độ mã nguồn quay lui, tập ứng viên `choices` bao gồm tất cả các phần tử trong mảng đầu vào, còn trạng thái `state` là các phần tử đã được chọn cho đến thời điểm hiện tại. Lưu ý rằng mỗi phần tử chỉ có thể được chọn một lần, **do đó tất cả các phần tử trong `state` phải là duy nhất**.

Như hình dưới đây, chúng ta có thể mở rộng quá trình tìm kiếm thành một cây đệ quy, trong đó mỗi nút của cây đại diện cho trạng thái hiện tại `state`. Bắt đầu từ nút gốc, sau ba vòng lựa chọn, chúng ta đến được một nút lá, và mỗi nút lá tương ứng với một hoán vị.

![Cây đệ quy của bài toán hoán vị](permutations_problem.assets/permutations_i.png)

### Cắt tỉa các lựa chọn trùng lặp

Để đảm bảo mỗi phần tử chỉ được chọn một lần, chúng ta xem xét việc đưa vào một mảng boolean `selected`, trong đó `selected[i]` cho biết `choices[i]` đã được chọn hay chưa. Dựa trên đó, chúng ta cài đặt thao tác cắt tỉa như sau.

- Sau khi thực hiện lựa chọn `choices[i]`, ta đặt `selected[i]` bằng $\text{True}$, cho biết phần tử đó đã được chọn.
- Khi duyệt qua danh sách ứng viên `choices`, ta bỏ qua tất cả các nút đã được chọn, đây chính là cắt tỉa.

Như hình dưới đây, giả sử chúng ta chọn $1$ ở vòng đầu tiên, $3$ ở vòng thứ hai, và $2$ ở vòng thứ ba. Khi đó ta cần cắt tỉa nhánh của phần tử $1$ ở vòng thứ hai, và cắt tỉa các nhánh của phần tử $1$ và $3$ ở vòng thứ ba.

![Ví dụ cắt tỉa của bài toán hoán vị](permutations_problem.assets/permutations_i_pruning.png)

Quan sát hình trên, ta thấy thao tác cắt tỉa này làm giảm kích thước không gian tìm kiếm từ $O(n^n)$ xuống còn $O(n!)$.

### Cài đặt mã nguồn

Sau khi hiểu các thông tin trên, chúng ta có thể điền vào các chỗ trống trong mã khung sườn. Để rút gọn toàn bộ đoạn mã, chúng ta không cài đặt riêng từng hàm trong khung sườn, mà thay vào đó triển khai chúng trực tiếp trong hàm `backtrack()`:

```src
[file]{permutations_i}-[class]{}-[func]{permutations_i}
```

## Trường hợp có phần tử trùng lặp

!!! question

    Cho một mảng số nguyên **có thể chứa các phần tử trùng lặp**, trả về tất cả các hoán vị duy nhất.

Giả sử mảng đầu vào là $[1, 1, 2]$. Để phân biệt hai phần tử $1$ trùng nhau, ta ký hiệu phần tử $1$ thứ hai là $\hat{1}$.

Như hình dưới đây, một nửa số hoán vị được tạo ra bởi phương pháp trên là trùng lặp.

![Các hoán vị trùng lặp](permutations_problem.assets/permutations_ii.png)

Vậy làm thế nào để loại bỏ các hoán vị trùng lặp? Cách trực tiếp nhất là dùng một tập băm để khử trùng lặp trực tiếp trên kết quả các hoán vị. Tuy nhiên, cách này không tối ưu vì **các nhánh tìm kiếm tạo ra hoán vị trùng lặp là không cần thiết và nên được phát hiện và cắt tỉa sớm**, điều này có thể nâng cao hơn nữa hiệu quả của giải thuật.

### Cắt tỉa các phần tử bằng nhau

Quan sát hình dưới đây. Ở vòng đầu tiên, việc chọn $1$ hay chọn $\hat{1}$ là tương đương nhau. Tất cả các hoán vị được tạo ra dưới hai lựa chọn này đều trùng lặp. Vì vậy, ta nên cắt tỉa $\hat{1}$.

Tương tự, sau khi chọn $2$ ở vòng đầu tiên, $1$ và $\hat{1}$ ở vòng thứ hai cũng tạo ra các nhánh trùng lặp, vì vậy $\hat{1}$ ở vòng thứ hai cũng nên bị cắt tỉa.

Về bản chất, **mục tiêu của chúng ta là đảm bảo rằng nhiều phần tử bằng nhau chỉ được chọn một lần trong một vòng lựa chọn nhất định**.

![Cắt tỉa các hoán vị trùng lặp](permutations_problem.assets/permutations_ii_pruning.png)

### Cài đặt mã nguồn

Dựa trên đoạn mã của bài toán trước, chúng ta khởi tạo một tập băm `duplicated` trong mỗi vòng lựa chọn để ghi lại những phần tử nào đã được thử trong vòng đó, và cắt tỉa các phần tử bằng nhau:

```src
[file]{permutations_ii}-[class]{}-[func]{permutations_ii}
```

Giả sử các phần tử đôi một khác nhau, có $n!$ (giai thừa) hoán vị của $n$ phần tử. Khi ghi lại kết quả, chúng ta cần sao chép một danh sách có độ dài $n$, mất thời gian $O(n)$. **Do đó, độ phức tạp thời gian là $O(n! \cdot n)$**.

Độ sâu đệ quy tối đa là $n$, sử dụng $O(n)$ không gian ngăn xếp. `selected` sử dụng $O(n)$ không gian. Có tối đa $n$ tập `duplicated` tồn tại đồng thời, sử dụng $O(n^2)$ không gian. **Do đó, độ phức tạp không gian là $O(n^2)$**.

### So sánh hai phương pháp cắt tỉa

Lưu ý rằng mặc dù cả `selected` và `duplicated` đều được dùng để cắt tỉa, nhưng chúng có mục tiêu khác nhau.

- **Cắt tỉa các lựa chọn trùng lặp**: Chỉ có duy nhất một `selected` trong suốt toàn bộ quá trình tìm kiếm. Nó ghi lại những phần tử nào đang có mặt trong trạng thái hiện tại, và mục đích của nó là ngăn một phần tử xuất hiện lặp lại trong `state`.
- **Cắt tỉa các phần tử bằng nhau**: Mỗi vòng lựa chọn (mỗi lần gọi hàm `backtrack`) chứa một tập `duplicated` riêng. Nó ghi lại những phần tử nào đã được chọn trong vòng lặp `for` của vòng đó, và mục đích của nó là đảm bảo các phần tử bằng nhau chỉ được chọn một lần.

Hình dưới đây thể hiện phạm vi tác dụng của hai điều kiện cắt tỉa. Lưu ý rằng mỗi nút trong cây đại diện cho một lựa chọn, và các nút trên đường đi từ gốc đến một nút lá tạo thành một hoán vị.

![Phạm vi tác dụng của hai điều kiện cắt tỉa](permutations_problem.assets/permutations_ii_pruning_summary.png)
