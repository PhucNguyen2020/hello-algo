# Thao tác xây dựng đống

Trong một số trường hợp, ta muốn xây dựng một đống từ toàn bộ các phần tử của một danh sách, quá trình này được gọi là "thao tác xây dựng đống."

## Cài đặt bằng cách chèn phần tử

Trước tiên, ta tạo một đống rỗng, sau đó duyệt qua danh sách, lần lượt thực hiện "thao tác chèn phần tử" với từng phần tử. Nghĩa là thêm phần tử vào cuối đống rồi thực hiện vun đống "từ dưới lên trên" đối với phần tử đó.

Mỗi lần một phần tử được chèn vào đống, độ dài của đống tăng thêm một. Vì các nút được thêm vào cây nhị phân lần lượt từ trên xuống dưới, nên đống được xây dựng "từ trên xuống dưới."

Với $n$ phần tử, mỗi thao tác chèn phần tử mất $O(\log{n})$ thời gian, do đó độ phức tạp thời gian của phương pháp xây dựng đống này là $O(n \log n)$.

## Cài đặt bằng cách duyệt và vun đống

Trên thực tế, ta có thể cài đặt một phương pháp xây dựng đống hiệu quả hơn theo hai bước.

1. Thêm nguyên trạng tất cả các phần tử của danh sách vào đống, lúc này tính chất của đống chưa được thỏa mãn.
2. Duyệt đống theo thứ tự ngược lại (ngược với duyệt theo mức), lần lượt thực hiện "vun đống từ trên xuống dưới" đối với từng nút không phải lá.

**Sau khi vun đống một nút, cây con gốc tại nút đó trở thành một đống con hợp lệ**. Vì ta duyệt theo thứ tự ngược lại, đống được xây dựng "từ dưới lên trên."

Lý do chọn duyệt theo thứ tự ngược lại là để đảm bảo các cây con bên dưới nút hiện tại đã là các đống con hợp lệ, nhờ đó việc vun đống nút hiện tại mới có hiệu quả.

Đáng chú ý là **vì các nút lá không có con nên chúng tự nhiên đã là các đống con hợp lệ và không cần vun đống**. Như đoạn mã dưới đây, nút không phải lá cuối cùng chính là nút cha của nút cuối cùng; ta bắt đầu từ nút đó và vun đống trong khi duyệt theo thứ tự ngược lại:

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Phân tích độ phức tạp

Tiếp theo, hãy thử suy ra độ phức tạp thời gian của phương pháp xây dựng đống thứ hai này.

- Giả sử cây nhị phân hoàn chỉnh có $n$ nút, thì số nút lá là $(n + 1) / 2$, trong đó $/$ là phép chia lấy phần nguyên. Do đó, số nút cần vun đống là $(n - 1) / 2$.
- Trong quá trình vun đống từ trên xuống dưới, mỗi nút chìm xuống tối đa đến một nút lá, nên số lần lặp tối đa bằng chiều cao của cây nhị phân, tức $\log n$.

Nhân hai giá trị này với nhau, ta được độ phức tạp thời gian $O(n \log n)$ cho quá trình xây dựng đống. **Tuy nhiên, ước lượng này không chính xác vì nó chưa tính đến đặc điểm là cây nhị phân có số nút ở các tầng dưới nhiều hơn hẳn so với các tầng trên**.

Hãy thực hiện một phép tính chính xác hơn. Để đơn giản hóa việc phân tích, giả sử ta có một "cây nhị phân hoàn hảo" với $n$ nút và chiều cao $h$; giả định này không ảnh hưởng đến tính đúng đắn của kết quả.

![Số lượng nút ở mỗi tầng của cây nhị phân hoàn hảo](build_heap.assets/heapify_operations_count.png)

Như hình minh họa ở trên, số lần lặp tối đa của thao tác "vun đống từ trên xuống dưới" tại một nút chính bằng khoảng cách từ nút đó đến một nút lá, đây cũng chính là chiều cao của nút đó. Do đó, ta có thể cộng tổng "số lượng nút $\times$ chiều cao của nút" tại mỗi tầng để **thu được tổng số lần lặp vun đống của tất cả các nút**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

Việc đơn giản hóa biểu thức trên đòi hỏi một số kiến thức đại số dãy số ở bậc phổ thông. Đầu tiên, nhân $T(h)$ với $2$ ta được:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

Sử dụng phép trừ các tổng đã dịch chuyển, lấy phương trình $2T(h)$ trừ đi phương trình $T(h)$ ta được:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

Quan sát biểu thức trên, ta nhận thấy $T(h)$ là một cấp số nhân, có thể tính trực tiếp bằng công thức tổng, cho ra độ phức tạp thời gian:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

Hơn nữa, một cây nhị phân hoàn hảo với chiều cao $h$ có $n = 2^{h+1} - 1$ nút, do đó độ phức tạp là $O(2^h) = O(n)$. Kết quả suy luận này cho thấy **độ phức tạp thời gian của việc xây dựng đống từ một danh sách đầu vào là $O(n)$, hiệu quả rất cao**.
