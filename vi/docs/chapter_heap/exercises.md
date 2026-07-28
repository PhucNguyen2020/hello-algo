# Bài tập

## Ôn tập khái niệm

### Đống thay đổi thế nào sau khi chèn 10?

Mảng `[9, 7, 8, 3, 5]` biểu diễn một đống lớn nhất. Bây giờ chèn số 10 vào.

<!-- numbered-subquestions -->

1. Trước tiên, thêm 10 vào cuối mảng. Giá trị của nút cha của nó là bao nhiêu?
2. Bắt đầu từ nút mới, thực hiện vun đống từ dưới lên trên và viết lại mảng sau mỗi lần hoán đổi.
3. Phần tử ở đỉnh đống cuối cùng là gì? Tổng cộng có bao nhiêu lần hoán đổi xảy ra?

??? success "Đáp án"

    1. Sau khi thêm 10, chỉ số của nó là 5, do đó chỉ số của nút cha là
        $\lfloor(5-1)/2\rfloor=2$. Giá trị của nút cha là 8.

    2. Vì 10 lớn hơn 8, mảng sau lần hoán đổi đầu tiên là `[9, 7, 10, 3, 5, 8]`.
        Vì 10 cũng lớn hơn nút cha của nó là 9, mảng sau lần hoán đổi thứ hai là `[10, 7, 9, 3, 5, 8]`.
        Lúc này giá trị 10 đã đến được nút gốc, nên quá trình vun đống hoàn tất.

    3. Phần tử ở đỉnh đống cuối cùng là 10, tổng cộng có 2 lần hoán đổi xảy ra.

### Kiểm tra quan hệ cha-con trong đống nhỏ nhất

Mảng `[1, 4, 3, 7, 6, 2]` biểu diễn một cây nhị phân hoàn chỉnh. Trong đống nhỏ nhất, mọi nút cha đều phải không lớn hơn các nút con của nó.
Với chỉ số $i$, chỉ số của con trái và con phải lần lượt là $2i+1$ và $2i+2$.

<!-- numbered-subquestions -->

1. Chỉ số và giá trị các con của chỉ số 2 là gì?
2. Nút ở chỉ số 2 có giá trị 3. Nó có vi phạm quy tắc đống nhỏ nhất với con của nó không? Nếu có, hai phần tử nào cần được hoán đổi?
3. Dựa trên câu trả lời của câu 2, hãy viết mảng sau khi hoán đổi nếu quy tắc bị vi phạm; nếu không, hãy giải thích vì sao không cần hoán đổi. Cuối cùng, kiểm tra các quan hệ cha-con còn lại.

??? success "Đáp án"

    1. Con trái của chỉ số 2 nằm ở chỉ số 5 và có giá trị 2. Chỉ số của con phải là 6, nhưng mảng chỉ có độ dài 6, nên con phải không tồn tại.

    2. Giá trị nút cha là 3 lớn hơn giá trị nút con là 2, vi phạm quy tắc đống nhỏ nhất. Cần hoán đổi các phần tử ở chỉ số 2 và 5.

    3. Sau khi hoán đổi, mảng là `[1, 4, 2, 7, 6, 3]`. Kiểm tra từng quan hệ:
        `1 ≤ 4`, `1 ≤ 2`; `4 ≤ 7`, `4 ≤ 6`; và `2 ≤ 3`.
        Mọi nút cha hiện đều không lớn hơn các nút con của nó, nên quy tắc đống nhỏ nhất được thỏa mãn.

### Giữ lại ba số lớn nhất bằng đống nhỏ nhất

Để giữ lại 3 số lớn nhất từ luồng dữ liệu `[4, 1, 7, 3, 8]`, hãy duy trì một đống nhỏ nhất chứa không quá 3 phần tử.

Trước tiên chèn lần lượt 3 số đầu tiên vào đống nhỏ nhất. Khi đống đã đầy, với mỗi số mới:
nếu nó lớn hơn phần tử ở đỉnh đống, xóa đỉnh đống và chèn số mới vào; ngược lại, giữ nguyên đống.

Sau mỗi số được đọc, hãy viết ra các số đang được giữ trong đống và phần tử ở đỉnh đống.
Viết các số được giữ dưới dạng một tập hợp; không cần cho biết thứ tự của chúng trong mảng biểu diễn đống.

??? success "Đáp án"

    Kết quả sau mỗi số được đọc như sau:

    | Số được đọc | Các số được giữ | Đỉnh đống |
    | --- | --- | --- |
    | 4 | `{4}` | 4 |
    | 1 | `{1, 4}` | 1 |
    | 7 | `{1, 4, 7}` | 1 |
    | 3 | `{3, 4, 7}` | 3 |
    | 8 | `{4, 7, 8}` | 4 |

    Khi đống đã đầy, đỉnh đống là số nhỏ nhất trong các số đang được giữ. Một số mới chỉ thay thế đỉnh đống khi nó lớn hơn đỉnh đống.
    Tập hợp cuối cùng `{4, 7, 8}` chính xác chứa 3 số lớn nhất.

## Bài tập lập trình

### Tìm phần tử lớn thứ k trong mảng

Cho một mảng số nguyên `nums` và một số nguyên $k$, trong đó $1 \le k \le n$ và $n$ là độ dài mảng, hãy trả về phần tử sẽ xuất hiện ở vị trí thứ $k$ nếu mảng được sắp xếp từ lớn đến nhỏ.

Đếm các phần tử trùng lặp một cách riêng biệt. Ví dụ, phần tử lớn thứ hai của `[5, 5, 2]` vẫn là 5. Hãy sử dụng một đống nhỏ nhất chứa không quá $k$ phần tử.

??? tip "Gợi ý"

    1. Phần tử lớn thứ k chính là phần tử nhỏ nhất trong số k phần tử lớn nhất
    2. Chèn từng số vào đống nhỏ nhất, và xóa giá trị nhỏ nhất mỗi khi kích thước đống vượt quá k
    3. Sau khi duyệt xong, đống chứa k phần tử lớn nhất, và đỉnh đống chính là đáp án

[LeetCode](https://leetcode.com/problems/kth-largest-element-in-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
