# Bài tập

## Ôn tập khái niệm

### Vài vòng đầu tiên của sắp xếp chọn và sắp xếp nổi bọt

Cho mảng `[4, 2, 5, 1, 3]`, hãy sắp xếp nó theo thứ tự tăng dần trong cả hai phần dưới đây.

<!-- numbered-subquestions -->

1. Mô phỏng hai vòng đầu tiên của sắp xếp chọn. Viết lại mảng sau mỗi vòng và xác định những vị trí nào đã được cố định.
2. Mô phỏng vòng đầu tiên của sắp xếp nổi bọt. Viết lại mảng kết quả và số lần hoán đổi, đồng thời xác định vị trí nào đã được cố định.

??? success "Đáp án"

    1. Hai vòng đầu tiên là:

        | Vòng | Mảng | Giải thích |
        | --- | --- | --- |
        | 1 | `[1, 2, 5, 4, 3]` | Phần tử nhỏ nhất, 1, được hoán đổi với phần tử đầu tiên |
        | 2 | `[1, 2, 5, 4, 3]` | Giá trị 2 đã ở chỉ số 1, nên không cần hoán đổi |

        Hai vị trí đầu tiên đã được cố định. Các vòng sau chỉ cần tìm phần tử nhỏ nhất trong `[5, 4, 3]`.

    2. So sánh các phần tử liền kề theo thứ tự: hoán đổi 4 và 2; không hoán đổi 4 và 5; hoán đổi 5 và 1; rồi hoán đổi 5 và 3.
        Kết quả là `[2, 4, 1, 3, 5]`, sau 3 lần hoán đổi. Phần tử lớn nhất, 5, đã di chuyển đến cuối mảng, nên vị trí cuối cùng đã được cố định.

### Các phần tử bằng nhau có thể thay đổi thứ tự tương đối không?

Trong mảng $[2_a, 2_b, 1]$, $2_a$ và $2_b$ có giá trị bằng nhau, nhưng chỉ số dưới của chúng đánh dấu thứ tự ban đầu.

<!-- numbered-subquestions -->

1. Viết mảng sau vòng đầu tiên của sắp xếp chọn. Thứ tự tương đối của $2_a$ và $2_b$ có thay đổi không?
2. Viết mảng sau vòng đầu tiên của sắp xếp nổi bọt. Thứ tự tương đối của $2_a$ và $2_b$ có thay đổi không?
3. Dựa trên hai câu hỏi trên, hãy giải thích hai giải thuật sắp xếp này khác nhau như thế nào trong việc giữ nguyên thứ tự ban đầu của các phần tử bằng nhau.

??? success "Đáp án"

    1. Ở vòng đầu tiên, sắp xếp chọn chọn phần tử nhỏ nhất, 1, và hoán đổi nó với phần tử đầu tiên, $2_a$, tạo ra
        $[1, 2_b, 2_a]$. Thứ tự tương đối đã thay đổi vì $2_a$ đã dịch chuyển ra sau $2_b$.

    2. Sắp xếp nổi bọt trước tiên so sánh $2_a$ và $2_b$. Vì chúng bằng nhau, nó không hoán đổi chúng. Sau đó nó so sánh $2_b$ và 1 rồi hoán đổi chúng,
        tạo ra $[2_a, 1, 2_b]$ sau vòng đầu tiên. $2_a$ vẫn đứng trước $2_b$, nên thứ tự tương đối của chúng không thay đổi.

    3. Trong ví dụ này, sắp xếp chọn làm thay đổi thứ tự ban đầu của các phần tử bằng nhau. Sắp xếp nổi bọt chỉ hoán đổi các phần tử liền kề khi phần tử bên trái lớn hơn phần tử bên phải.
        Các phần tử bằng nhau không bị hoán đổi, nên thứ tự tương đối ban đầu của chúng được giữ nguyên.

### So sánh sắp xếp đếm và sắp xếp cơ số

Một trường học cần sắp xếp nhiều mã số học sinh, mỗi mã có đúng 8 chữ số. Trả lời các câu hỏi sau:

<!-- numbered-subquestions -->

1. Sắp xếp cơ số cần bao nhiêu vòng khi bắt đầu từ chữ số có nghĩa thấp nhất?
2. Nếu mã số học sinh được coi trực tiếp là số nguyên để dùng cho sắp xếp đếm, tại sao mảng đếm lại cần rất nhiều ô không bao giờ được dùng đến?
3. Dựa trên hai câu hỏi trên, bạn sẽ chọn giải thuật nào để sắp xếp nhiều mã số học sinh có độ dài cố định 8 chữ số: sắp xếp đếm hay sắp xếp cơ số? Vì sao?

??? success "Đáp án"

    1. Một mã số học sinh có 8 chữ số, nên cần 8 vòng từ chữ số có nghĩa thấp nhất đến cao nhất. Mỗi vòng chỉ nhóm các giá trị theo 0–9.

    2. Việc đếm trực tiếp sẽ cần một ô cho mỗi giá trị 8 chữ số có thể có, nhưng chỉ một phần nhỏ trong số đó thực sự được gán cho học sinh.
        Hầu hết các ô trong mảng đếm sẽ vẫn là 0.

    3. Sắp xếp cơ số là lựa chọn tốt hơn. Nó tận dụng việc độ dài cố định và mỗi chữ số chỉ có 10 giá trị có thể, chỉ cần 8 vòng nhóm ổn định.
        Sắp xếp đếm, nếu dùng toàn bộ mã số 8 chữ số làm chỉ số nguyên, sẽ cần các ô mảng đếm cho rất nhiều giá trị không bao giờ xuất hiện.

## Bài tập lập trình

### Sắp xếp một mảng bằng sắp xếp trộn

Cho một mảng số nguyên `nums`, hãy tự cài đặt sắp xếp trộn, sắp xếp các phần tử của nó theo thứ tự không giảm, và trả về kết quả. Không được gọi hàm sắp xếp dựng sẵn của ngôn ngữ.

??? tip "Gợi ý"

    1. Một khoảng có độ dài tối đa 1 thì đã được sắp xếp sẵn
    2. Chia đôi khoảng tại điểm giữa và đệ quy sắp xếp cả hai nửa
    3. Dùng hai con trỏ để trộn hai nửa đã sắp xếp, sau đó ghi kết quả trở lại mảng gốc

[LeetCode](https://leetcode.com/problems/sort-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Sắp xếp một mảng số nguyên bằng sắp xếp đếm

Cho một mảng số nguyên `nums` và một số nguyên không âm $K$. Mọi phần tử của mảng đều nằm trong khoảng từ $0$ đến $K$.

Hãy cài đặt sắp xếp đếm, ghi kết quả trở lại `nums` theo thứ tự không giảm, và trả về `nums`.
Không được xác định thứ tự bằng cách so sánh các phần tử, và không được gọi hàm sắp xếp dựng sẵn của ngôn ngữ.

??? tip "Gợi ý"

    1. Vì mọi phần tử đều nằm trong khoảng từ 0 đến K, hãy dùng trực tiếp giá trị của mỗi phần tử làm chỉ số trong mảng đếm
    2. Duyệt nums một lần và tăng số đếm ở vị trí tương ứng
    3. Sau đó duyệt mảng đếm từ 0 đến K; nếu giá trị x xuất hiện một số lần nhất định, hãy ghi x vào nums liên tiếp đúng số lần đó
