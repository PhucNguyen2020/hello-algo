# Tìm kiếm nhị phân

<u>Tìm kiếm nhị phân (binary search)</u> là một thuật toán tìm kiếm hiệu quả dựa trên chiến lược chia để trị. Nó tận dụng thứ tự đã sắp xếp của dữ liệu để giảm một nửa phạm vi tìm kiếm sau mỗi vòng lặp, cho đến khi tìm thấy phần tử mục tiêu hoặc khoảng tìm kiếm trở thành rỗng.

!!! question

    Cho một mảng `nums` có độ dài $n$ với các phần tử được sắp xếp theo thứ tự tăng dần và không có phần tử trùng lặp, hãy tìm và trả về chỉ số của phần tử `target` trong mảng. Nếu mảng không chứa phần tử đó, trả về $-1$. Một ví dụ được minh họa trong hình dưới đây.

![Dữ liệu ví dụ cho tìm kiếm nhị phân](binary_search.assets/binary_search_example.png)

Như hình minh họa dưới đây, đầu tiên ta khởi tạo hai con trỏ $i = 0$ và $j = n - 1$, trỏ lần lượt đến phần tử đầu tiên và cuối cùng của mảng, đại diện cho khoảng tìm kiếm $[0, n - 1]$. Lưu ý rằng dấu ngoặc vuông biểu thị một khoảng đóng, bao gồm cả các giá trị biên.

Tiếp theo, thực hiện lặp lại hai bước sau:

1. Tính chỉ số điểm giữa $m = \lfloor {(i + j) / 2} \rfloor$, trong đó $\lfloor \: \rfloor$ biểu thị phép làm tròn xuống.
2. So sánh `nums[m]` và `target`, dẫn đến ba trường hợp:
    1. Khi `nums[m] < target`, điều đó cho thấy `target` nằm trong khoảng $[m + 1, j]$, nên thực hiện $i = m + 1$.
    2. Khi `nums[m] > target`, điều đó cho thấy `target` nằm trong khoảng $[i, m - 1]$, nên thực hiện $j = m - 1$.
    3. Khi `nums[m] = target`, điều đó cho thấy đã tìm thấy `target`, nên trả về chỉ số $m$.

Nếu mảng không chứa phần tử mục tiêu, khoảng tìm kiếm cuối cùng sẽ trở thành rỗng. Trong trường hợp đó, trả về $-1$.

=== "<1>"
    ![Quá trình tìm kiếm nhị phân](binary_search.assets/binary_search_step1.png)

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png)

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png)

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png)

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png)

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png)

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png)

Cần lưu ý rằng vì cả $i$ và $j$ đều có kiểu `int`, **$i + j$ có thể vượt quá phạm vi biểu diễn của kiểu `int`**. Để tránh tràn số nguyên, ta thường dùng công thức $m = \lfloor {i + (j - i) / 2} \rfloor$ để tính điểm giữa.

Đoạn mã được trình bày dưới đây:

```src
[file]{binary_search}-[class]{}-[func]{binary_search}
```

**Độ phức tạp thời gian là $O(\log n)$**: Trong vòng lặp tìm kiếm nhị phân, khoảng tìm kiếm bị giảm một nửa sau mỗi vòng, nên số lần lặp là $\log_2 n$.

**Độ phức tạp không gian là $O(1)$**: Các con trỏ $i$ và $j$ sử dụng không gian có kích thước cố định.

## Các cách biểu diễn khoảng tìm kiếm

Bên cạnh khoảng đóng đã đề cập ở trên, một cách biểu diễn khoảng phổ biến khác là khoảng "đóng trái, mở phải" (left-closed right-open), được định nghĩa là $[0, n)$, nghĩa là biên trái được bao gồm còn biên phải bị loại trừ. Theo cách biểu diễn này, khoảng $[i, j)$ là rỗng khi $i = j$.

Ta có thể triển khai một thuật toán tìm kiếm nhị phân có cùng chức năng dựa trên cách biểu diễn này:

```src
[file]{binary_search}-[class]{}-[func]{binary_search_lcro}
```

Như hình minh họa dưới đây, với hai cách biểu diễn khoảng, việc khởi tạo, điều kiện lặp và thao tác thu hẹp khoảng của thuật toán tìm kiếm nhị phân đều khác nhau.

Vì cả biên trái và biên phải trong cách biểu diễn "khoảng đóng" đều được định nghĩa là đóng, nên các thao tác thu hẹp khoảng thông qua con trỏ $i$ và $j$ cũng đối xứng nhau. Điều này giúp giảm khả năng mắc lỗi, **do đó cách tiếp cận "khoảng đóng" thường được khuyến nghị sử dụng**.

![Hai cách định nghĩa khoảng](binary_search.assets/binary_search_ranges.png)

## Ưu điểm và hạn chế

Tìm kiếm nhị phân mang lại hiệu suất tốt cả về thời gian lẫn không gian.

- Tìm kiếm nhị phân có hiệu suất thời gian cao. Với khối lượng dữ liệu lớn, độ phức tạp thời gian logarit mang lại lợi thế đáng kể. Ví dụ, khi kích thước dữ liệu $n = 2^{20}$, tìm kiếm tuyến tính cần $2^{20} = 1048576$ lần lặp, trong khi tìm kiếm nhị phân chỉ cần $\log_2 2^{20} = 20$ lần lặp.
- Tìm kiếm nhị phân không cần thêm không gian phụ. So với các thuật toán tìm kiếm cần thêm không gian (như tìm kiếm dựa trên bảng băm), tìm kiếm nhị phân tiết kiệm không gian hơn.

Tuy nhiên, tìm kiếm nhị phân không phù hợp với mọi tình huống, chủ yếu vì các lý do sau:

- Tìm kiếm nhị phân chỉ áp dụng được cho dữ liệu đã sắp xếp. Nếu dữ liệu đầu vào chưa được sắp xếp, việc sắp xếp riêng để sử dụng tìm kiếm nhị phân sẽ phản tác dụng, vì các thuật toán sắp xếp thường có độ phức tạp thời gian $O(n \log n)$, cao hơn cả tìm kiếm tuyến tính lẫn tìm kiếm nhị phân. Đối với các kịch bản thường xuyên chèn phần tử, việc giữ cho mảng luôn được sắp xếp đòi hỏi chèn phần tử vào các vị trí cụ thể với độ phức tạp thời gian $O(n)$, điều này cũng rất tốn kém.
- Tìm kiếm nhị phân chỉ áp dụng được cho mảng. Tìm kiếm nhị phân đòi hỏi truy cập phần tử theo kiểu nhảy cóc, không liên tục, và kiểu truy cập này kém hiệu quả trong danh sách liên kết, khiến nó không phù hợp với danh sách liên kết hoặc các cấu trúc dữ liệu dựa trên danh sách liên kết.
- Đối với khối lượng dữ liệu nhỏ, tìm kiếm tuyến tính hoạt động tốt hơn. Trong tìm kiếm tuyến tính, mỗi vòng chỉ cần 1 phép so sánh; trong khi ở tìm kiếm nhị phân, cần 1 phép cộng, 1 phép chia, 1-3 phép so sánh, và 1 phép cộng (trừ), tổng cộng 4-6 đơn vị thao tác. Do đó, khi khối lượng dữ liệu $n$ nhỏ, tìm kiếm tuyến tính thực sự nhanh hơn tìm kiếm nhị phân.
